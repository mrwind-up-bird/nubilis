<?php

return [
    'host' => env('REDIS_HOST', 'host.docker.internal'),
    'port' => env('REDIS_POST', 6379),
    'password' => env('REDIS_PASSWORD', ''),
];
