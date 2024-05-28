<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiQueueController;

Route::get('/jobs', [ApiQueueController::class, 'getJobs']);
Route::get('/queues', [ApiQueueController::class, 'getQueues']);
Route::get('/job/{id}', [ApiQueueController::class, 'getJob']);
Route::get('/queue/{queue}', [ApiQueueController::class, 'getQueue']);
Route::middleware('auth:sanctum')->get('/user', [ApiQueueController::class, 'getUser']);
