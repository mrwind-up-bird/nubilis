## Programme description
The programme is intended to read tables from a database, mask the individual fields in accordance with the GDPR regulations and then write the data back into a new database. Tables can be omitted or only created empty, for example in order not to make all data available to different partners or departments.

### Usage
The application runs on the command line under PHP 8.3/Laravel in a Docker container. It connects to a source database, reads all table information (size, number of rows, engine, etc.) and creates a cluster with X entries that are written to the cluster array, distributed as evenly as possible according to size and number of columns.

#### Configuration
The configuration is located in /config/obfuscate.php and is in the standard Laravel config format and contains the following sections:
```
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
                PDO::ATTR_PERSISTENT => true
            ]
        ]
    ],
```
Enter target, source, target connection parameters and off you go

```
    'obfuscate' => [
        'tabelle1' => ['field1','field2','field3:email']
    ],
```
These are the respective tables with the column names whose content is to be obfuscated. A method for special handling of this column can be added to the column names, separated with :. For example, md5 or email, special characters or conversion to another field type. These methods must be defined in /app/Factories/ObfuscatorFactory.php and implemented as a function which implements the Interface and called in /app/Factories/ObfuscatorFactory.php. 

And then there is
```
    'truncate' => [
    ],
    'obsolete' => [
    ]
```
The tables in these fields are either ignored during export (obsolete) or the data is not retrieved, but the table is created.
