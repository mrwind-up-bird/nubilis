<?php

namespace App\Traits;

use App\Entities\TableEntity;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use function Symfony\Component\Translation\t;

/**
 *
 */
trait DatabaseTransactionTrait
{
    private TableEntity $table;

    /**
     * @param TableEntity $table
     * @return bool
     * @throws \Throwable
     */
    protected function beginTransaction(TableEntity $table) : bool
    {
        $this->table = $table;

        if ($this->table->getTableEngine() == 'InnoDB') {
            try {
                DB::connection('target')->beginTransaction();
            }
            catch(\Throwable) {
                // just catch if there is no active transaction
            }
        }

        return true;
    }

    /**
     * @return bool
     * @throws \Throwable
     */
    protected function commitTransaction() : bool
    {
        if ($this->table->getTableEngine() == 'InnoDB') {
            try {
                DB::connection('target')->commit();
            }
            catch(\Throwable) {
                // just catch if there is no active transaction
            }
        }

        return true;
    }

    /**
     * @return bool
     */
    protected function rollbackTransaction() : bool
    {
        if ($this->table->getTableEngine() == 'InnoDB') {
            try {
                DB::connection('target')->rollBack();
            }
            catch(\Throwable) {
                // just catch if there is no active transaction
            }

        }

        return true;
    }
}
