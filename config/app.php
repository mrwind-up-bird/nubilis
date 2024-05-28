<?php

use Illuminate\Support\Facades\Facade;
use Illuminate\Support\ServiceProvider;

return [

    'name' => env('APP_NAME', 'lax Obfuskator'),
    'env' => env('APP_ENV', 'development'),
    'debug' => (bool) env('APP_DEBUG', true),
    'url' => env('APP_URL', 'http://127.0.0.1'),
    'asset_url' => env('ASSET_URL'),
    'timezone' => 'Europe/Berlin',
    'locale' => 'de',
    'fallback_locale' => 'en',
    'faker_locale' => 'en_US',
    'key' => env('APP_KEY'),
    'cipher' => 'AES-256-CBC',
    'maintenance' => [
        'driver' => 'file',
        // 'store' => 'redis',
    ],
    'providers' => ServiceProvider::defaultProviders()->merge([
        App\Providers\AppServiceProvider::class,
        App\Providers\AuthServiceProvider::class,
        App\Providers\EventServiceProvider::class,
        App\Providers\RouteServiceProvider::class,
        App\Providers\DatabaseServiceProvider::class
    ])->toArray(),

    'aliases' => Facade::defaultAliases()->merge([
        // 'Example' => App\Facades\Example::class,
    ])->toArray(),
];
