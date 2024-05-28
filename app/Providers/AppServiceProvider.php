<?php

namespace App\Providers;

use Redis;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('*', function($view) {
            $view->with('workerStatus', $this->getWorkerStatus());
        });
    }

    private function getWorkerStatus() : ?string
    {
        $redis = new Redis();
        $redis->connect(config('redis.host'), config('redis.port'));

        return $redis->get('lax_obfuscator_horizon:status');
    }
}
