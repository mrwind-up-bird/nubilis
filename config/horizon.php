<?php

use Illuminate\Support\Str;

return [
    'domain' => env('HORIZON_DOMAIN'),
    'path' => env('HORIZON_PATH', 'horizon'),
    'use' => 'default',
    'prefix' => env(
        'HORIZON_PREFIX',
        Str::slug(env('APP_NAME', 'laravel'), '_') . '_horizon:'
    ),
    'middleware' => ['web'],
    'waits' => [
        'redis:default' => 60,
        'redis:default_obfuscator' => 60,
        'redis:obfuscate_watcher' => 60,
    ],
    'trim' => [
        'recent'        => 60,
        'pending'       => 60,
        'completed'     => 60,
        'recent_failed' => 10080,
        'failed'        => 10080,
        'monitored'     => 10080,
    ],
    'silenced' => [
        // App\Jobs\ExampleJob::class,
    ],
    'metrics' => [
        'trim_snapshots' => [
            'job'   => 24,
            'queue' => 24,
        ],
    ],
    'fast_termination' => false,
    'memory_limit' => 64,
    'defaults' => [
        'Erebos' => [
            'connection'          => 'redis',
            'queue'               => [
                'default_obfuscator'
            ],
            'balance'             => 'auto',
            'autoScalingStrategy' => 'time',
            'minProcesses'        => 1,
            'maxProcesses'        => 1,
            'maxTime'             => 0,
            'maxJobs'             => 0,
            'memory'              => 512,
            'tries'               => 3,
            'timeout'             => 240,
            'nice'                => 0,
        ],

        'Charon' => [
            'connection'          => 'redis',
            'queue'               => [
                'default_obfuscator'
            ],
            'balance'             => 'auto',
            'autoScalingStrategy' => 'time',
            'minProcesses'        => 1,
            'maxProcesses'        => 1,
            'maxTime'             => 0,
            'maxJobs'             => 0,
            'memory'              => 512,
            'tries'               => 3,
            'timeout'             => 500,
            'nice'                => 0,
        ],
        'Kerberus' => [
            'connection'          => 'redis',
            'queue'               => [
                'obfuscate_watcher',
            ],
            'balance'             => 'auto',
            'autoScalingStrategy' => 'time',
            'minProcesses'        => 1,
            'maxProcesses'        => 1,
            'maxTime'             => 0,
            'maxJobs'             => 0,
            'memory'              => 512,
            'tries'               => 12,
            'timeout'             => 120,
            'nice'                => 0,
        ],
    ],

    'environments' => [
        'production' => [
            'Erebos' => [
                'maxProcesses'    => 6,
                'balanceMaxShift' => 2,
                'balanceCooldown' => 3,
                'tries'           => 3,
                'timeout'         => (60 * 5) - 10,
            ],

            'Charon' => [
                'maxProcesses'    => 6,
                'balanceMaxShift' => 2,
                'balanceCooldown' => 3,
                'tries'           => 3,
                'timeout'         => (60 * 5) - 10,
            ],
        ],

        'local' => [
            'Erebos' => [
                'maxProcesses'    => 6,
                'balanceMaxShift' => 2,
                'balanceCooldown' => 3,
                'tries'           => 3,
                'timeout'         => (60 * 5) - 10,
            ],

            'Charon' => [
                'maxProcesses'    => 6,
                'balanceMaxShift' => 2,
                'balanceCooldown' => 3,
                'tries'           => 3,
                'timeout'         => (60 * 5) - 10,
            ],
        ],
    ],
];
