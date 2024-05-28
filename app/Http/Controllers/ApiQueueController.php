<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Queue\Queue;
use Illuminate\Support\Facades\Queue as QueueFacade;

class ApiQueueController extends Controller
{
    public function __construct(private Queue $queue)
    {
    }

    public function getConnectionName()
    {
        $connectionName = $this->queue->getConnectionName();
        return response()->json(['connection_name' => $connectionName]);
    }

    public function getJobs(string $queueName)
    {
        $jobs = $this->retrieveJobDetails($queueName);
        return response()->json($jobs);
    }

    public function getJob(string $id)
    {
        $job = $this->findJob($id);
        return response()->json($job);
    }

    public function getQueues()
    {
        $queues = $this->retrieveAllQueues();
        return response()->json($queues);
    }

    public function getQueue($queueName)
    {
        $jobs = $this->retrieveJobDetails($queueName);
        return response()->json($jobs);
    }

    public function getUser(Request $request)
    {
        return $request->user();
    }

    private function retrieveJobDetails($queueName)
    {
        return QueueFacade::connection($this->queue->getConnectionName());
    }

    private function findJob($jobId)
    {
        return QueueFacade::find($jobId);
    }

    private function retrieveAllQueues()
    {
        return QueueFacade::connection($this->queue->getConnectionName());
    }
}
