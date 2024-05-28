<?php
// this is a sample configuration
return [
    'project' => [
        'projectName' => 'Admin',
        'configFile' => 'admin',
    ],
    'dumpFile' => [
        'inputFile' => 'lax_laxadmin_20240429.sql',
        'outputFile' => null,
        'outputFormat' => \App\Services\DatabaseService::OUTPUT_SQL
    ],
    'database' => [
        'source' => [
            'dbHost' => 'host.docker.internal',
            'dbPort' => '3306',
            'dbName' => 'lax_admin',
            'dbUser' => 'root',
            'dbPass' => 'laxgmbh123',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true
            ]
        ],
        'target' => [
            'dbHost' => 'host.docker.internal',
            'dbPort' => '3306',
            'dbName' => 'obf_lax_admin',
            'dbUser' => 'root',
            'dbPass' => 'laxgmbh123',
            'options' => [
                PDO::ATTR_EMULATE_PREPARES => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_PERSISTENT => true,
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET GLOBAL sql_mode="IGNORE_SPACE,STRICT_TRANS_TABLES,STRICT_ALL_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"',
            ]
        ]
    ],
    'obfuscate' => [
        'critical_info_mailing_sent' => ['email:email'],
        'tadminlogin' => ['cName','cRealname','cMail:email'],
        'tkunde' => ['cVorname','cNachname','cFirma','cMail:email','cDomain'],
        'tlizenzbestellung' => ['cVorname','cNachname','cFirma','cStrasse','cPLZ','cOrt','cMail:email','cTel','cFax','cUstID:ustd'],
        'tnewsletter' => ['cMail:email'],
        #'*' => ['cVorname','cNachname','cFirma','cStrasse','cPLZ','cOrt','cMail:email','cTel','cFax','cUstID:ustd','cDomain','cRealname','cName'],
    ],
    'truncate' => [],
    'obsolete' => []
];
