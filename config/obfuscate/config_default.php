<?php

// configuration for obfuscating sensitive data

return [
    'project' => [
        'projectName' => 'Typo3',
        'configFile' => 'default'
    ],
    'dumpFile' => [
        'inputFile' => null,
        'outputFile' => null,
        'outputFormat' => \App\Services\DatabaseService::OUTPUT_SQL
    ],
    'database' => [
        'source' => [
            'dbHost' => 'host.docker.internal',
            'dbPort' => '3306',
            'dbName' => 'lax_typo3',
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
            'dbName' => 'obf_lax_typo3',
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
        '*' => ['cKundename', 'cKundeemail','cKundetelefon'],
        'taccount' => ['cVorname','cNachname', 'cOrt', 'cLand', 'cTel', 'cFax', 'cStrasse', 'cUSTID', 'cBankinstitut', 'cBankname', 'nKontoNr', 'nBLZ', 'cKontoinhaber', 'cIBAN:iban', 'cBIC', 'cSepaRef', 'cSteuernummer', 'cEmail','cIBAN'],
        'taccounthistory' => [],
        'account_deleted' => ['salutation','first_name','last_name','company','street','zipcode','city','extra_address_line','country','tax_id'],
        'account_email_changes' => ['email_current','email_new'],
        'acl_accounts' => ['name','email','pin_code'],
        'tansprechpartner' => [],
        'tvertriebcasehistory' => ['cFirma', 'cKommentar', 'cLand', 'cMail', 'cNachname', 'cOrt', 'cPLZ', 'cStrasse', 'cTel', 'cVorname']
    ],
    ## not yet implemented
    'obfuscateFields' => [
        'cName',
        'cEmail',
        'nBLZ',
        'cIBAN'
    ],
    'truncate' => [
        'thilfsmittelrubrik',
    ],
    'obsolete' => [
        'Aktionlaxconnect2018',
        'AuthAccessTokens',
        'AuthAccountWebhooks',
        'AuthClientScopeTranslations',
        'AuthClientScopes',
        'AuthClientTemplates',
        'AuthClients',
        'AuthCodes',
        'AuthDevelopers',
        'AuthPersonalAccessClients',
        'AuthRefreshTokens',
        'AuthWebhooks',
        'MailchimpCampaign',
        'MarketplaceCategories',
        'MarketplaceCategoryLocalizations',
        'NewsletterBlacklist',
        'PosPaymentDoc',
        'Registration',
        'SupportDiscount',
        'support_translations',
        'store_connector_image_linkings',
        'store_connector_product_linkings',
        'Tbankpruefung',
        'Tdownloadprodukt',
        'Tfulfillmenterror',
        'Tkuendigung',
        'Tlicapplicationrequirement',
        'Tliccode',
        'Tmodulkey',
        'Treferenzleistung',
        'Tsupportanfragen',
        'Ttechnologiepartnerkategorie',
        'Tmodulkeyfreischaltung',
        'TmodulkeyfreischaltungFehler',
        'tplaneritem',
        'tinstallationsservice',
        'thostingtraffic',
        'thostingtraffic_error',
        'tkategorie',
        'tkuendigung',
        'tkundemail',
        'tliccode',
        'tlizenzupgrade',
        'tnews',
        'tnewskategorie',
        'tnewskategorienews',
        'tnewskommentar',
        'tnewsmonatsuebersicht',
        'tnewsletterempfaenger',
        'orderdataprocessingfulfillment',
        'orderdataprocessingfulfillmenthistory',
        'orderdataprocessingfulfillmenthistorysqluser',
        'tnewsletterempfaengerhistory',
        'ttestbarershop',
        'twarenwirtschaft',
    ]
];
