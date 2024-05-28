<?php

namespace App\Jobs;

use App\Entities\TableEntity;
use App\Traits\ClosureSerializerTrait;
use App\Traits\DatabaseTransactionTrait;
use App\Traits\ErrorChannelTrait;
use Illuminate\Bus\Batchable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\Jobs\Job;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Str;

class TableRunnerJob implements ShouldQueue
{
    use Dispatchable,
        InteractsWithQueue,
        Queueable,
        ClosureSerializerTrait,
        DatabaseTransactionTrait,
        ErrorChannelTrait,
        Batchable;

    public int $tries = 3;
    public int $timeout = 240;

    /**
     * @param TableEntity $table
     */
    public function __construct(private TableEntity $table)
    {
    }

    /**
     * @return bool
     * @throws \Throwable
     */
    public function handle() : bool
    {
        $this->table->initDatabaseService();

        Log::info(sprintf('TableEntity: %s with Config: %s loaded', $this->table->getTableName(), $this->table->getConfigName()));

        $currentPage = 1;
        $rowsUpdated = [];

        $this->beginTransaction($this->table);

        if ($this->table->isTableForTruncate()) {
            Log::info(sprintf('Skip Table %s because its listed on TruncateTable List', $this->table->getTableName()));
            return true;
        }

        Log::info(sprintf('Table: %s, Rows: %s, start processing.', $this->table->getTableName(), $this->table->getRowCount()));

        do {
            try {
                if ($this->table->processTable($currentPage)) {
                    $currentPage++;
                }
                else {
                    $this->table->checkRowCount();
                    break;
                }
            }
            catch (\Exception $e) {
                Log::error(sprintf('Error processing %s, Error: %s', $this->table->getTableName(), Str::of($e->getMessage())->substr(0,50)));
                $this->pushError($e, 'process');
                $this->rollbackTransaction();
                break;
            }
        } while (true);

        try {
            $this->commitTransaction();
        }
        catch (\Throwable $e) {
            // MyISAM does not support Transactions, we should convert all MyISAM to InnoDB
            Log::error(sprintf("MyISAM does not support Table Transactions! Table %s, %s", $this->table->getTableName(), $e->getMessage()));
            $this->pushError($e, 'transaction');
            return false;
        }

        Log::info(sprintf("Table: %s finished, %s Rows updated or inserted", $this->table->getTableName(), array_sum($rowsUpdated)));

        return true;
    }

    /**
     * @return string
     */
    public function displayName() : string
    {
        return sprintf('TableRunner: %s, Rows: %s', $this->table->getTableName(), $this->table->getRowCount());
    }
}
