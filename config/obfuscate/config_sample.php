<?php
// this is a sample configuration
return [
    'project' => [
        'projectName' => 'Demo',
        'configFile' => 'sample',
    ],
    'dumpFile' => [
        'inputFile' => 'demo_input.sql',
        'outputFile' => 'demo_output.sql',
        'outputFormat' => \App\Services\DatabaseService::OUTPUT_SQL
    ],
    'database' => [
        'source' => [
            'dbHost' => 'host.docker.internal',
            'dbPort' => '3306',
            'dbName' => 'obfuscate_demo',
            'dbUser' => 'root',
            'dbPass' => '12345',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true
            ]
        ],
        'target' => [
            'dbHost' => 'host.docker.internal',
            'dbPort' => '3306',
            'dbName' => 'obf_obfuscate_demo',
            'dbUser' => 'root',
            'dbPass' => '12345',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true,
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET GLOBAL sql_mode="IGNORE_SPACE,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"',
            ]
        ]
    ],
    'obfuscate' => [
        'Company' => ['name', 'street', 'zipcode', 'city', 'country', 'phone', 'fax', 'website', 'email'],
        'User' => ['name', 'surname', 'street', 'zipcode', 'city', 'county', 'country', 'phone', 'mobile', 'fax', 'website', 'language'],
        'Login' => ['login', 'password', 'email']
    ],
    'truncate' => [''],
    'obsolete' => []
];