<?php

namespace App\Entities;

use App\Helpers\ObfuscatorHelper;
use App\Services\DatabaseService;
use App\Traits\ClosureSerializerTrait;
use App\Traits\DatabaseTransactionTrait;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class TableEntity
{
    use SerializesModels, Queueable, DatabaseTransactionTrait, ClosureSerializerTrait;

    public string $tableName;

    public ?string $configName;
    public ?string $tableEngine;
    public ?string $primaryKey;

    public ?int $size = 0;
    public ?int $rowCount = 0;
    public ?bool $truncateTable;

    public ?Paginator $rows;
    public Collection $errorChannel;

    public DatabaseService $db;
    public ObfuscatorHelper $ob;

    public const int MAX_PER_PAGE = 250;

    public int $tries = 3;          // relates to queue worker
    public int $timeout = 240;      // relates to queue worker

    /**
     * @param array $data
     * @param ObfuscatorHelper $ob
     * @param DatabaseService $db
     */
    public function __construct(array $data)
    {
        $this->tableName = $data['tableName'] ?? null;
        $this->primaryKey = $data['primaryKey'] ?? null;
        $this->size = $data['size'] ?? null;
        $this->rowCount = $data['rowCount'] ?? null;
        $this->truncateTable = $data['truncateTable'] ?? null;
        $this->rows = $data['rows'] ?? null;
        $this->tableEngine = $data['tableEngine'] ?? null;

        $this->configName = $data['configName'] ?? null;

        //$this->db = (new DatabaseService())->setTable($this->getTableName());
        $this->db = ($data['db'])?->setTable($this->tableName) ?? (new DatabaseService())->setTable($this->tableName);
        $this->ob = (new ObfuscatorHelper())->setTable($this);

        //debugging
        $this->errorChannel = collect();

        return $this;
    }

    /**
     * @param int $currentPage
     * @return bool
     */
    public function processTable(int $currentPage) : bool
    {
        $this->setRows($this->db->fetchContent(TableEntity::MAX_PER_PAGE, $currentPage));

        $obfuscatedResult = $this->ob->obfuscate();

        if ($obfuscatedResult->isNotEmpty()) {
            $this->db->upsertRows($obfuscatedResult, $this, $currentPage);
        }
        else {
            return false;
        }

        return true;
    }

    /**
     * @param int $rows
     * @return bool
     */
    public function checkRowCount() : bool
    {
        $rowCountTargetDb = DB::connection('target')->table($this->tableName)->count();
        Log::info(sprintf('Table: %s, Rows (Target/Source): %s/%s', $this->tableName, $rowCountTargetDb, $this->getRowCount()));

        if ($rowCountTargetDb !== $this->getRowCount()) {
            return false;
        }

        return true;
    }

    /**
     * @return ?string
     */
    public function getConfigName() : ?string
    {
        return $this->configName;
    }

    /**
     * @return DatabaseService
     */
    public function initDatabaseService() : DatabaseService
    {
        $this->db->loadProjectConfig($this->getConfigName());
        $this->db->setTable($this->getTableName());

        $this->db->setInitSourceDb(false);

        DB::reconnect('source');
        DB::reconnect('target');

        return $this->db;
    }

    /**
     * @return bool
     */
    public function isTableForTruncate() : bool
    {
        return $this->truncateTable;
    }

    /**
     * @return string
     */
    public function getTableName(): string
    {
        return $this->tableName;
    }

    /**
     * @return int
     */
    public function getSize(): int
    {
        return $this->size;
    }

    /**
     * @param int $size
     * @return TableEntity
     */
    public function setSize(int $size): TableEntity
    {
        $this->size = $size;
        return $this;
    }

    /**
     * @return int
     */
    public function getRowCount(): int
    {
        return $this->rowCount;
    }

    /**
     * @param int $rowCount
     * @return TableEntity
     */
    public function setRowCount(int $rowCount): TableEntity
    {
        $this->rowCount = $rowCount;
        return $this;
    }

    /**
     * @return Paginator
     */
    public function getRows() : ?Paginator
    {
        return $this->rows;
    }

    /**
     * @param ?Paginator $rows
     * @return TableEntity
     */
    public function setRows(?Paginator $rows) : TableEntity
    {
        /** @var Paginator $rows */
        $this->rows = $rows;
        return $this;
    }

    /**
     * @return TableEntity
     */
    public function getEntity() : TableEntity
    {
        return $this;
    }

    /**
     * @param string $tableEngine
     * @return $this
     */
    public function setTableEngine(string $tableEngine): TableEntity
    {
        $this->tableEngine = $tableEngine;
        return $this;
    }

    /**
     * @return ?string
     */
    public function getTableEngine(): string
    {
        return $this->tableEngine;
    }

    /**
     * @return ?string
     */
    public function getPrimaryKey(): ?string
    {
        return $this->primaryKey;
    }

    /**
     * @param ?string $primaryKey
     * @return TableEntity $this
     */
    public function setPrimaryKey(?string $primaryKey): TableEntity
    {
        $this->primaryKey = $primaryKey;
        return $this;
    }
}
