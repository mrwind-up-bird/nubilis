## Data Obfuscator for sensitive personal information
The aim of this application is to obfuscate customer-related data such as IBAN, BIC, name and address.
The data is read from a MySQL table (source), compared with a configuration to determine which fields are to be obfuscated
and written back into a MySQL database (target).

## Installation
The application is designed as a Docker container. If necessary, a few adjustments must be made in the docker-compose
if other containers with database or web server are running on 3306 or 80.

``composer install && docker-compose build && docker-compose up``

## Configuration
The configuration for the database servers, the tables, the fields to be obfuscated and other configuration options
are in: ``./config/obfuscate.php`` and in the ``.env`` configuration file.

## Usage
``php artisan app:obfuscate``

The application can be started as specified above, the settings are read from the config file. It is possible to
specify parameters:

```
--table={table1,table2,table3}
--worker={number}
--dryRun
```

- ``--table=table1,table2,table3`` can be tables (several separated by commas) that are to be processed.
- ``--worker={number}`` controls the number of tables or clusters to be processed in parallel.
- ``--dryRun`` activates the test mode, no data is written to the database.

## Database
The file ``mysql_tuner.pl`` is located in the ``database/scripts`` directory. It can analyse the database and indicate possible performance problems or errors.

## Future
- Converter for database engine (MyISAM > InnoDB), character sets, collations and structures
- Creation of views, triggers, procedures
- Obfuscate the data if only the field is named without reference to a table, quasi ``*.fieldName``
