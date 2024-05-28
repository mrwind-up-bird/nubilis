<?php

namespace App\Helpers;

use App\Entities\TableEntity;
use Illuminate\Contracts\Pagination\Paginator;
use App\Factories\ObfuscatorFactory;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

/**
 *
 */
class ObfuscatorHelper
{
    /**
     * @var TableEntity
     */
    private TableEntity $table;

    public function __construct()
    {
    }

    /**
     * @param TableEntity $table
     * @return $this
     */
    public function setTable(TableEntity $table) : ObfuscatorHelper
    {
        $this->table = $table;
        return $this;
    }

    /**
     * @return Collection
     */
    public function obfuscate() : Collection
    {
        /** @var Paginator $rows */
        $rows = $this->table->getRows();

        if ((null === $rows) || is_int($rows->getCollection()) || gettype($rows->getCollection()->first()) == 'integer') {
            // some weird constellations with the database, it may be solved with DB::reconnect for every worker
            return collect();
        }

        return $rows->getCollection()->map(function($row) {
            return ($this->checkIfTableToObfuscate($this->table->tableName)) ? self::prepareRow($row) : $row;
        });
    }

    /**
     * @param \stdClass|Collection $row
     * @return Collection
     */
    public function prepareRow(\stdClass|Collection $row) : Collection
    {
        $result = [];
        foreach ($row AS $fieldName => $fieldContent) {
            extract([$fieldName, $method] = Str::of($fieldName)->explode(':')->pad(2, 'default')->toArray());
            if ($this->checkIfFieldToObfuscate($this->table->tableName, $fieldName) && !is_null($fieldContent)) {
                $result[$fieldName] = ObfuscatorFactory::obfuscateString($fieldContent, $method);
            }
            else {
                $result[$fieldName] = $fieldContent;
            }
        }

        return collect($result);
    }

    /**
     * @param string $table
     * @param array|null $config
     * @return bool
     */
    public function checkIfTableToObfuscate(string $table, array $config = null) : bool
    {
        if (null === $config) {
            $config = $this->arrayMapRecursive(function($configKey) {
                return strtolower($configKey);
            }, config('obfuscate.obfuscate'));
        }

        if (array_key_exists(strtolower($table), $config)) {
            return true;
        }

        if ($table === '*') {
            return true;
        }

        return false;
    }

    /**
     * @param string $table
     * @param string $field
     * @return bool
     */
    public function checkIfFieldToObfuscate(string $table, string $field) : bool
    {
        $config = $this->arrayMapRecursive(function($configKey) {
            return strtolower($configKey);
        }, config('obfuscate.obfuscate'));

        if (array_key_exists(strtolower($table), $config) && in_array(strtolower($field), $config[strtolower($table)])) {
            return true;
        }

        return false;
    }

    /**
     * @param callable $callback
     * @param array $array
     * @return array
     */
    public function arrayMapRecursive(callable $callback, array $array) : array
    {
        $func = function ($item) use (&$func, &$callback) {
            return is_array($item) ? array_map($func, $item) : call_user_func($callback, $item);
        };

        return array_map($func, $array);
    }
}
