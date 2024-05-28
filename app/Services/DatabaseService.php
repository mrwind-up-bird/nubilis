<?php

namespace App\Services;

use AllowDynamicProperties;
use App\Entities\TableEntity;
use App\Traits\ClosureSerializerTrait;
use App\Traits\ErrorChannelTrait;
use Carbon\Carbon;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Symfony\Component\Process\Process;


class DatabaseService
{
    use ClosureSerializerTrait,
        ErrorChannelTrait,
        Queueable,
        InteractsWithQueue;

    private string $table;
    private ?string $configName = null;
    private array $config = [];
    private array $projectConfig = [];
    private array $dbSourceConfig = [];
    private array $dbTargetConfig = [];

    private bool $initSourceDb = true;

    private Collection $errorChannel;

    public const int PER_PAGE = 250;
    public const string TMP_DATABASE_NAME = 'tmp_database_dry_run.sqlite';
    public const string CONFIG_KEY = 'obfuscate';

    public const string DIRECTORY_TYPE_DUMPS = 'storage_path';
    public const string DIRECTORY_TYPE_CONFIGS = 'config_path';

    public const string OUTPUT_DUMP_PREFIX = 'output';

    public const bool KEEP_DATA_AFTER_FINISHED = true;

    public ?string $inputFileName = null;
    public ?string $outputFileName = null;
    public ?string $outputFileFormat = DatabaseService::OUTPUT_ZIP;

    public const string OUTPUT_SQL = 'sql';
    public const string OUTPUT_ZIP = 'zip';

    public function __construct()
    {
    }

    /**
     * @return string
     */
    public function getTargetDbName(): string
    {
        return $this->dbTargetConfig['dbName'];
    }


    /**
     * @param string|null $configName
     * @return DatabaseService
     */
    public static function init(?string $configName = null): DatabaseService
    {
        $service = new DatabaseService();
        $service->loadProjectConfig($configName)->createTargetDatabase();

        return $service;
    }

    /**
     * @param string|null $configName
     * @return DatabaseService
     */
    public function loadProjectConfig(?string $configName = null): DatabaseService
    {
        if (null !== $configName && File::exists(config_path(sprintf('%s/config_%s.php', self::CONFIG_KEY, $configName)))) {
            Log::info(sprintf('Load Custom Config File: %s/config_%s.php', self::CONFIG_KEY, $configName));
            $this->config = include config_path(sprintf('%s/config_%s.php', self::CONFIG_KEY, $configName));
            $this->configName = $configName;
        } else {
            $this->config = include config_path(sprintf('%s/config_default.php', self::CONFIG_KEY));
            $this->configName = 'default';
        }

        Config::set(self::CONFIG_KEY, $this->config);

        Log::info(sprintf('Project: %s', config(sprintf('%s.project.name', self::CONFIG_KEY))));

        $this->dbSourceConfig = config(sprintf('%s.database.source', self::CONFIG_KEY));
        $this->dbTargetConfig = config(sprintf('%s.database.target', self::CONFIG_KEY));

        $this->inputFileName = Config::get(sprintf('%s.dumpFile.inputFile', self::CONFIG_KEY), null);

        $outputFileName = Config::get(sprintf('%s.dumpFile.outputFile', self::CONFIG_KEY));

        $this->outputFileName = strlen($outputFileName) ? $outputFileName : sprintf('%s_%s-%s', self::OUTPUT_DUMP_PREFIX, Carbon::now()->format('ymdHi'), $this->configName);
        $this->outputFileFormat = Config::get(sprintf('%s.dumpFile.outputFormat', self::CONFIG_KEY), 'zip');

        $this->loadDatabaseDump();

        return $this->createDbConnections();
    }

    /**
     * @return bool
     */
    private function loadDatabaseDump(): bool
    {
        if (null !== $this->inputFileName && $this->initSourceDb) {
            Log::info(sprintf('Import DB Dump: %s', $this->inputFileName ));
            $dumpFile = storage_path(sprintf('%s/%s', self::CONFIG_KEY, $this->inputFileName));
            if (File::exists($dumpFile)) {
                try {
                    DB::statement(sprintf('CREATE DATABASE IF NOT EXISTS `%s`', $this->dbSourceConfig['dbName']));

                    $loadDumpCmd = sprintf("%s --host=%s --port=%s --user=%s -p'%s' %s < %s",
                        env('PATH_DB_EXECUTABLE'),
                        $this->dbSourceConfig['dbHost'],
                        $this->dbSourceConfig['dbPort'],
                        $this->dbSourceConfig['dbUser'],
                        $this->dbSourceConfig['dbPass'],
                        $this->dbSourceConfig['dbName'],
                        $dumpFile,
                    );

                    $process = Process::fromShellCommandline($loadDumpCmd);
                    $process->run();

                    if (!$process->isSuccessful()) {
                        throw new \RuntimeException($process->getErrorOutput());
                    }
                } catch (\Exception $e) {
                    $this->pushError($e);
                    Log::error(sprintf('Import Database Dump: %s into Database failed: %s', $dumpFile, $e->getMessage()));
                    return false;
                }
                Log::info(sprintf('Dump File: %s imported', $dumpFile));
                $this->initSourceDb = false;

                return true;
            }
        }

        return false;
    }

    /**
     * @return bool
     * @throws \RedisException
     */
    public function saveDatabaseDump(): bool
    {
        Log::info(sprintf('Export Database: %s', $this->outputFileName));

        if ($this->outputFileName) {
            try {
                $dumpFile = ($this->outputFileFormat === DatabaseService::OUTPUT_ZIP)
                    ? sprintf('| tar czf %s -', sprintf('%s/%s/%s.tar.gz', storage_path(), self::CONFIG_KEY, $this->outputFileName))
                    : sprintf('> %s/%s/%s.sql', storage_path(), self::CONFIG_KEY, $this->outputFileName);

                $saveDumpCmd = sprintf("%s --host=%s --port=%s --user=%s -p'%s' %s %s",
                    env('PATH_DB_DUMPEXECUTABLE'),
                    $this->dbTargetConfig['dbHost'],
                    $this->dbTargetConfig['dbPort'],
                    $this->dbTargetConfig['dbUser'],
                    $this->dbTargetConfig['dbPass'],
                    $this->dbTargetConfig['dbName'],
                    $dumpFile
                );

                $outputFileName = ($this->outputFileFormat === DatabaseService::OUTPUT_ZIP) ?
                    sprintf('%s/%s/%s.tar.gz', storage_path(), self::CONFIG_KEY, $this->outputFileName) :
                    sprintf('%s/%s/%s.sql', storage_path(), self::CONFIG_KEY, $this->outputFileName);

                $process = Process::fromShellCommandline($saveDumpCmd);
                $process->run();

                if (!$process->isSuccessful()) {
                    throw new \RuntimeException($process->getErrorOutput());
                }

                if (!File::exists($outputFileName)) {
                    throw new \RuntimeException(sprintf('Database Dump: %s not created', $outputFileName));
                }

                $this->removeDatabases();

            } catch (\Exception $e) {
                $this->pushError($e);
                Log::error(sprintf('Error creating Dumpfile: %s, Error: %s', $outputFileName, $e->getMessage()));
            }
        }

        return true;
    }

    /**
     * @return bool
     */
    public function removeDatabases($keep = DatabaseService::KEEP_DATA_AFTER_FINISHED): bool
    {
        if ($keep) return true;

        try {
            $inputFile = storage_path(sprintf('%s/%s', self::CONFIG_KEY, $this->inputFileName));

            if (File::exists($inputFile)) {
                File::delete($inputFile);
                Log::info(sprintf('InputFile: %s deleted', $inputFile));
            }

            //DB::connection('source')->statement(sprintf('DROP DATABASE IF EXISTS %s', $this->dbSourceConfig['database']));
            DB::connection('target')->statement(sprintf('DROP DATABASE IF EXISTS %s', $this->dbTargetConfig['database']));

        } catch (\Exception $e) {
            Log::error(sprintf('Error removing old Data, Error: %s', $e->getMessage()));
            return false;
        }

        Log::error(sprintf('Databases cleared, File: %s exported. Finished everything.', $this->outputFileName));

        return true;
    }

    /**
     * @return DatabaseService
     */
    private function createDbConnections(): DatabaseService
    {
        Config::set(['database.connections.source' => [
            'driver' => 'mysql',
            'host' => $this->dbSourceConfig['dbHost'],
            'port' => $this->dbSourceConfig['dbPort'],
            'database' => $this->dbSourceConfig['dbName'],
            'username' => $this->dbSourceConfig['dbUser'],
            'password' => $this->dbSourceConfig['dbPass'],
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
            'options' => $this->dbSourceConfig['options']
        ]]);

        Config::set(['database.connections.target' => [
            'driver' => 'mysql',
            'host' => $this->dbTargetConfig['dbHost'],
            'port' => $this->dbTargetConfig['dbPort'],
            'database' => $this->dbTargetConfig['dbName'],
            'username' => $this->dbTargetConfig['dbUser'],
            'password' => $this->dbTargetConfig['dbPass'],
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
            'options' => $this->dbTargetConfig['options']
        ]]);

        // we need to use this connection params for creating the target Database
        Config::set(['database.connections.init' => [
            'driver' => 'mysql',
            'host' => $this->dbTargetConfig['dbHost'],
            'port' => $this->dbTargetConfig['dbPort'],
            'database' => '',
            'username' => $this->dbTargetConfig['dbUser'],
            'password' => $this->dbTargetConfig['dbPass'],
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
        ]]);

        return $this;
    }

    /**
     * @return void
     */
    public function createTargetDatabase(): DatabaseService
    {
        if ($this->checkIfDatabaseExists()) {
            Log::info(sprintf('Create Database Schema for %s from %s', $this->dbTargetConfig['dbName'], $this->dbSourceConfig['dbName']));

            try {
                $dumpCmd = sprintf(
                    "%s --no-data --ignore-table=%s.%s --host=%s --port=%s --user=%s -p'%s' %s | sed 's/DEFINER=[^*]*\*/\*/g' | %s --host=%s --port=%s --user=%s -p'%s' %s",
                    env('PATH_DB_DUMPEXECUTABLE'),
                    $this->dbSourceConfig['dbName'],
                    collect(config('obfuscate.obsolete'))->unique()->implode(sprintf(' --ignore-table=%s.', $this->dbSourceConfig['dbName'])),
                    $this->dbSourceConfig['dbHost'],
                    $this->dbSourceConfig['dbPort'],
                    $this->dbSourceConfig['dbUser'],
                    $this->dbSourceConfig['dbPass'],
                    $this->dbSourceConfig['dbName'],
                    env('PATH_DB_EXECUTABLE'),
                    $this->dbTargetConfig['dbHost'],
                    $this->dbTargetConfig['dbPort'],
                    $this->dbTargetConfig['dbUser'],
                    $this->dbTargetConfig['dbPass'],
                    $this->dbTargetConfig['dbName']
                );

                $process = Process::fromShellCommandline($dumpCmd);
                $process->run();

                if (!$process->isSuccessful()) {
                    throw new \RuntimeException($process->getErrorOutput());
                }
            } catch (\Exception $e) {
                $this->pushError($e);
                Log::error(sprintf('Error %s creating Schema %s in Target DB: %s\nApplication terminated...', $process->getErrorOutput(), $this->dbTargetConfig['dbName'], $dumpCmd));
                exit(0); // terminate application
            }
        }

        // we need to disable the foreign_key_check globally during the whole Export
        Log::info('Setting Global / Session sql_mode successfull');
        DB::connection('target')->statement('SET GLOBAL foreign_key_checks=0');

        return $this;
    }

    /**
     * @return bool
     */
    private function checkIfDatabaseExists(): bool
    {
        try {
            $result = DB::select(sprintf('SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = %s', DB::escape($this->dbTargetConfig['dbName'])));

            if (!empty($result)) {
                Log::info(sprintf('Database %s exists, skip creation part', $this->dbTargetConfig['dbName']));
                return true;
            } else {
                try {
                    DB::connection('init')->statement(sprintf('CREATE SCHEMA %s', $this->dbTargetConfig['dbName']));
                    Log::info(sprintf('Database %s created', $this->dbTargetConfig['dbName']));
                    return $this->checkIfDatabaseExists();
                } catch (\PDOException $e) {
                    Log::error(sprintf('Error creating Database %s, Error: %s, Config: %s', $this->dbTargetConfig['dbName'], $e->getMessage(), print_r($this->dbTargetConfig, true)));
                    return false;
                }
            }
        } catch (\PDOException $e) {
            $this->pushError($e);
            Log::error(sprintf('Error creating Database %s, Error: %s, Config: %s', $this->dbTargetConfig['dbName'], $e->getMessage(), print_r($this->dbTargetConfig, true)));
            return false;
        }
    }

    /**
     * @return int
     */
    public static function setDryRunMode(): int
    {
        try {
            if (!File::exists(database_path(self::TMP_DATABASE_NAME))) {
                File::put(database_path(self::TMP_DATABASE_NAME), '');
            }

            config(['database.connections.target' => [
                'driver' => 'sqlite',
                'host' => '',
                'port' => '',
                'database' => database_path(self::TMP_DATABASE_NAME),
                'username' => '',
                'password' => '',
                'charset' => 'utf8mb4',
                'collation' => 'utf8mb4_unicode_ci',
                'prefix' => '',
                'foreign_key_constraints' => env('DB_FOREIGN_KEYS', true),
            ]]);

            DB::purge('target');
            DB::reconnect('target');
        } catch (\Exception $e) {
            Log::error(sprintf('Error activating DryRun Mode, Error: %s', $e->getMessage()));
            return false;
        }

        Log::info('DryRun activated, no Database Operations should be placed!');
        return true;
    }

    /**
     * @param string $table
     * @return $this
     */
    public function setTable(string $table): DatabaseService
    {
        $this->table = $table;
        return $this;
    }

    /**
     * @return string
     */
    public function getTable(): string
    {
        return $this->table;
    }

    /**
     * @param int $clusterCount
     * @param Collection|null $singleTables
     * @return array
     */
    public function clusterTables(int $clusterCount, Collection $singleTables = null): array
    {
        DB::reconnect('source');
        DB::reconnect('target');

        $addToQuery = [];

        $dbName = DB::escape(config(sprintf('%s.database.source.dbName', self::CONFIG_KEY)));

        $obsoleteTables = collect(config(sprintf('%s.obsolete', self::CONFIG_KEY)))->map(function ($obsoleteTableName) {
            return DB::escape($obsoleteTableName);
        })->implode(',');

        if (Str::length($obsoleteTables)) {
            $addToQuery[] = sprintf('AND ist.TABLE_NAME NOT IN (%s)', $obsoleteTables);
        }

        if (null !== $singleTables) {
            $singleTables = collect($singleTables)->map(function ($tableName) {
                return DB::escape($tableName);
            })->implode(',');
            $addToQuery[] = sprintf('AND ist.TABLE_NAME IN (%s)', $singleTables);
        }

        $tables = DB::connection('source')->select(
            sprintf("SELECT ist.TABLE_NAME                            as tableName,
                   ROUND(ist.DATA_LENGTH + ist.INDEX_LENGTH) as tableSize,
                   ist.TABLE_ROWS                            as tableRowCount,
                   ist.ENGINE                                as tableEngine,
                   isk.COLUMN_NAME                           as primaryKey
            FROM INFORMATION_SCHEMA.TABLES ist
                LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE isk
                ON ist.TABLE_NAME = isk.TABLE_NAME
            WHERE (
                ist.TABLE_SCHEMA = %s
                AND ist.TABLE_TYPE = 'BASE TABLE'
                AND (ist.TABLE_ROWS IS NOT NULL OR ist.TABLE_ROWS > 0)
                %s
            ) GROUP BY ist.TABLE_NAME;"
                , $dbName, Arr::join($addToQuery, ' ')));

        $totalSize = array_sum(array_column($tables, 'tableSize'));
        $totalRows = array_sum(array_column($tables, 'tableRowCount'));

        $targetSize = $totalSize / $clusterCount;
        $targetRows = $totalRows / $clusterCount;

        $clusters = array_fill(0, $clusterCount, []);

        $currentCluster = 0;
        $currentTableCount = 0;
        $currentSize = 0;
        $currentRows = 0;

        $stats = [];

        foreach ($tables as $table) {
            try {
                $clusters[$currentCluster][] = new TableEntity([
                    'tableName' => $table->tableName,
                    'rowCount' => intval($table->tableRowCount),
                    'size' => intval($table->tableSize),
                    'tableEngine' => $table->tableEngine,
                    'truncateTable' => self::checkIfTableToTruncate($table->tableName),
                    'db' => ($this)->setTable($table->tableName),
                    'configName' => $this->configName,
                    'rows' => null,
                ]);
            } catch (\Exception $e) {
                Log::error(sprintf('Error creating Entity for Table: %s', $e->getMessage()));
                return [];
            }

            $currentSize += $table->tableSize;
            $currentRows += $table->tableRowCount;
            $currentTableCount++;

            if ($currentSize >= $targetSize || $currentRows >= $targetRows) {
                $stats[$currentCluster][] = [
                    'sizeOfCluster' => $currentSize,
                    'rowsInCLuster' => $currentRows,
                    'tablesInCluster' => $currentTableCount
                ];
                $currentCluster++;
                $currentSize = 0;
                $currentRows = 0;
                $currentTableCount = 0;
            }
        }

        return $clusters;
    }

    /**
     * @param string $table
     * @return bool
     */
    public static function checkIfTableToTruncate(string $table): bool
    {
        $config = config(sprintf('%s.truncate', self::CONFIG_KEY));

        if (in_array(strtolower($table), array_map(function ($configKey) {
            return strtolower($configKey);
        },
            $config))) {
            return true;
        }

        return false;
    }

    /**
     * @param int $perPage
     * @param int $page
     * @return ?Paginator
     */
    public function fetchContent(int $perPage = self::PER_PAGE, int $page = 1): ?Paginator
    {
        try {
            return (DB::connection('source')->table($this->table))->simplePaginate($perPage, ['*'], md5($this->table), $page);
        } catch (\Exception $e) {
            Log::error(sprintf('Error fetch Content from Table: %s, Error: %s', $this->table, $e->getMessage()));
            $this->pushError($e, 'fetch');
        }

        return null;
    }

    /**
     * @param Collection $rows
     * @param TableEntity $table
     * @return void
     */
    public function upsertRows(Collection $rows, TableEntity $table, int $currentPage): bool
    {
        try {
            DB::connection('target')->table($this->table)->upsert(
                $rows->map(function ($row) {
                    return ($row instanceof \stdClass) ? (array)$row : $row->toArray();
                })->toArray(),
                [$table->getPrimaryKey()],
                collect($rows->first())->keys()->all()
            );
        } catch (\PDOException $e) {
            // Log::error(sprintf('Error upsert Rows in Table: %s, Page: %s, Error: %s', $table->getTableName(), $currentPage, $e->getCode()));
            $this->pushError($e, 'upsert');
        }

        return true;
    }

    /**
     * @return string
     */
    public function getConfigName(): string
    {
        return $this->configName ?? 'default';
    }

    public function getConfigKey()
    {
        return self::CONFIG_KEY;
    }

    public function setInitSourceDb(bool $state) : bool
    {
        return $this->initSourceDb = $state;
    }
}
