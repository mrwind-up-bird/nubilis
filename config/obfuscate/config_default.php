<?php
return [
    'project' => [
        'projectName' => 'Default',
        'configFile' => 'default'
    ],
    'dumpFile' => [
        'inputFile' => null,
        'outputFile' => null,
        'outputFormat' => \App\Services\DatabaseService::OUTPUT_SQL
    ],
    'database' => [
        'source' => [
            'dbHost' => '',
            'dbPort' => '',
            'dbName' => '',
            'dbUser' => '',
            'dbPass' => '',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true
            ]
        ],
        'target' => [
            'dbHost' => '',
            'dbPort' => '',
            'dbName' => '',
            'dbUser' => '',
            'dbPass' => '',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true,
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET GLOBAL sql_mode="IGNORE_SPACE,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"',
            ]
        ]
    ],
    'obfuscate' => [],
    'truncate' => [],
    'obsolete' => []
];
