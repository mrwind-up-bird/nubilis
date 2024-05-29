## Data Obfuscator for Sensitive Personal Information

### Overview
This application is designed to obfuscate sensitive customer-related data, including IBAN, BIC, names, and addresses. It reads data from a MySQL table or a SQL file, applies obfuscation rules based on a configuration, and writes the anonymized data back into a MySQL database. Each table found is processed until all rows comply with the defined ruleset, followed by a database cleanup and deletion of input files. The obfuscated data can be downloaded for further use.

### Purpose
In many development environments, complete database dumps are often used locally to ensure the application operates correctly without missing dependencies, foreign keys, or data structures. However, test databases often lack comprehensive information or links, and using actual data can pose significant data protection risks. Sensitive information such as bank details, addresses, employer details, and medical information can be accessed by anyone with database or dump access, posing a threat if the data leaves the company for external partners, suppliers, or freelancers.

This tool addresses these issues by integrating seamlessly into the backup process, ensuring that any generated database dump is obfuscated and devoid of any identifiable personal information.

### Obfuscation Process
#### Before and After Obfuscation Example

**Before:**
```
1;Max;Mustermann;Musterstraße 1;12345;Musterstadt;;030123456;0170123456;030123457;www.mustermann.de;Musterland;DE;DE;2024-05-28 09:55:38;2024-05-28 09:55:38
2;Erika;Musterfrau;Beispielweg 2;67890;Beispielstadt;;040987654;0171987654;040987655;www.musterfrau.de;Beispielland;DE;DE;2024-05-28 09:55:38;2024-05-28 09:55:38
```

**After:**
```
1;Ma*;Mu*******n;Mu**********e 1;12045;Mu********t;;030000056;0100000056;030000057;ww*.***********.de;Mu*********d;***;***;2024-05-28 09:55:38;2024-05-28 09:55:38
2;Er*ka;Mu*******u;Be********** 2;67090;Be*********t;;040000054;0100000054;040000055;ww*.***********.de;Be**********d;***;***;2024-05-28 09:55:38;2024-05-28 09:55:38
```

### Installation
The application is containerized using Docker. Adjustments may be required in the docker-compose file if other containers are using ports 3306 or 80.

To install and start the application, run:
```sh
composer install && docker-compose build && docker-compose up
```

### Configuration
Configuration files for database servers, tables, fields to be obfuscated, and other settings are located in the `./config/obfuscate/` directory and the `.env` configuration file.

### Usage
To start the obfuscation process, use the following command:
```sh
php artisan app:obfuscate && php artisan horizon
```
Alternatively, you can specify a different configuration file:
```sh
php artisan app:obfuscate --config=filename && php artisan horizon
```

### GUI
A graphical user interface (GUI) is available at `127.0.0.1`. This GUI, although still under development (authentication is in progress), allows for uploading source `.sql` files, editing the configuration, and initiating the obfuscation process in the background.

### Database Analysis
The `mysql_tuner.pl` script located in the `database/scripts` directory can be used to analyze the database and identify potential performance issues or errors.

### Future Plans
- Implementing email and/or SNS/SQS queues for notifications upon completion of obfuscation tasks.
- Code Cleanup, Config Entity, Filewatcher
