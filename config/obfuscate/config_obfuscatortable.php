<?php

// configuration for obfuscating sensitive data

return [
    'project' => [
        'name' => 'Obfuskator Datenbank',
        'config' => 'obfuscatortable'
    ],
    'dumpFile' => [
        'inputFile' => 'db_lax_obfuscator.sql',
        'outputFile' => 'db_lax_obfuscator_output.sql',
    ],
    'database' => [
        'source' => [
            'dbHost' => '127.0.0.1',
            'dbPort' => '3306',
            'dbName' => 'dump_import',
            'dbUser' => 'root',
            'dbPass' => 'laxgmbh123',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true
            ]
        ],
        'target' => [
            'dbHost' => '127.0.0.1',
            'dbPort' => '3306',
            'dbName' => 'obf_dump_import',
            'dbUser' => 'root',
            'dbPass' => 'laxgmbh123',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true
            ]
        ]
    ],
    'obfuscate' => [],
    'obfuscateFields' => [],
    'truncate' => [],
    'obsolete' => []
];
