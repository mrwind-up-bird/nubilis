<?php

use App\Http\Controllers\ObfuscateController;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers;

Route::get('/', [ObfuscateController::class,'index']);
Route::get('/error', [ObfuscateController::class,'error']);
Route::get('/config/{config?}', [ObfuscateController::class,'config'])->name('config.load');
Route::get('/dumps', [ObfuscateController::class,'dumps']);

Route::get('/run/{filename}', function($filename) {
    Log::info(sprintf('Start with Config File: %s', $filename));
    Artisan::call('app:obfuscate', ['--config' => $filename]);
    return Artisan::output();
});

Route::get('/download/{filename}', [ObfuscateController::class, 'download'])->name('file.download');

Route::get('/oauth', function($auth) {
    Log::info(sprintf('OAuth Response: %s', print_r($auth,true)));
    dd($auth);
});

Route::post('/config', [ObfuscateController::class,'config'])->name('config.save');
Route::post('/upload', [ObfuscateController::class, 'upload'])->name('upload');

Route::delete('/delete/{filename}', [ObfuscateController::class,'delete'])->name('file.delete');

Auth::routes();
