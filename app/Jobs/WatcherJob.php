<?php

namespace App\Jobs;

use App\Services\DatabaseService;
use App\Traits\ClosureSerializerTrait;
use App\Traits\ErrorChannelTrait;
use Carbon\Carbon;
use Illuminate\Bus\Batch;
use Illuminate\Bus\Batchable;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Queue;

class WatcherJob implements ShouldQueue
{
    use Dispatchable,
        InteractsWithQueue,
        ClosureSerializerTrait,
        Queueable,
        ErrorChannelTrait,
        Batchable;

    private Batch $obfuscatorBatch;
    public const string WATCHER_QUEUE_NAME = 'obfuscate_watcher';

    /**
     * @param string $obfuscatorBatchId
     * @param DatabaseService $databaseService
     */
    public function __construct(private readonly string $obfuscatorBatchId, private readonly DatabaseService $databaseService)
    {

    }

    /**
     * @return Batch
     */
    public function getBatchById() : Batch
    {
        $this->obfuscatorBatch = Bus::findBatch($this->obfuscatorBatchId);

        return $this->obfuscatorBatch;
    }

    /**
     * @return bool
     */
    public function handle() : bool
    {
        try {
            $this->getBatchById();

            if ($this->checkIfQueuesAreFinished()) {
                Log::info(sprintf('Finished Batch ID: %s, Progress: %s%% | Jobs %s/%s', $this->obfuscatorBatch->id, $this->obfuscatorBatch->progress(), $this->obfuscatorBatch->processedJobs(), $this->obfuscatorBatch->totalJobs));
                Log::info(sprintf('Exporting obfuscated Database Dump: %s', $this->databaseService->getTargetDbName()));
                $this->databaseService->saveDatabaseDump();

                return true;
            }

            $this->getQueueStatus();
            Log::info(sprintf('Batch: %s still running, Progress: %s%%, dispatch new Watcher in 10 seconds', $this->obfuscatorBatchId, $this->obfuscatorBatch->progress()));

            Queue::later(Carbon::now()->addSeconds(10), new WatcherJob($this->obfuscatorBatchId, $this->databaseService), '', WatcherJob::WATCHER_QUEUE_NAME);

            return true;
        } catch (\Exception $e) {
            $this->pushError($e);
        }

        return false;
    }

    /**
     * @return bool
     */
    private function checkIfQueuesAreFinished() : bool
    {
        return $this->obfuscatorBatch->finished();
    }

    /**
     * @return array
     */
    public function getQueueStatus() : array
    {
        Log::info(sprintf('Running Batch ID: %s, Progress: %s%% | Jobs %s/%s', $this->obfuscatorBatch->id, $this->obfuscatorBatch->progress(), $this->obfuscatorBatch->processedJobs(), $this->obfuscatorBatch->totalJobs));

        return array(
            'id' => $this->obfuscatorBatch->id,
            'progress' => $this->obfuscatorBatch->progress(),
            'processedJobs' => $this->obfuscatorBatch->processedJobs(),
            'totalJobs' => $this->obfuscatorBatch->totalJobs
        );
    }

    /**
     * @return string
     */
    public function displayName() : string
    {
        return sprintf('Watcher: BatchID: %s', $this->obfuscatorBatchId);
    }
}
