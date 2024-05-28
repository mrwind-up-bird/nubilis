<?php

namespace App\Providers;

use App\Helpers\ObfuscatorHelper;
use App\Services\DatabaseService;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\DB;
use App\Services;

class DatabaseServiceProvider extends ServiceProvider
{
    /**
     * @return void
     */
    public function register(): void
    {
        $this->app->singleton(DatabaseServiceProvider::class, function () {
            return new DatabaseService();
        });
    }
}
