## Snippets

#### Empty Tables
searches for empty tables without entries and those named as obsolete, returns the tableName, create_at and updated_at as well as the number of rows (which should be NULL or 0).

See also:  https://confluence.jtl-software.de/display/IDEV/Inventar%3A+Obsolete+DB+Tables

```
SELECT t.TABLE_NAME as tableName, p.RowCnt, t.CREATE_TIME as createTime, t.UPDATE_TIME AS lastUpdate
FROM INFORMATION_SCHEMA.TABLES t
         LEFT JOIN (
        SELECT TABLE_NAME, TABLE_ROWS AS RowCnt
        FROM INFORMATION_SCHEMA.TABLES
        GROUP BY TABLE_NAME
    ) p ON t.TABLE_NAME = p.TABLE_NAME
WHERE
    (t.TABLE_TYPE = 'BASE TABLE' AND t.TABLE_SCHEMA = '<<database>>' AND (p.RowCnt IS NULL OR p.RowCnt = 0)
  OR (
    (p.TABLE_NAME IN
         (<<usetables>>)))
  );
```

Searches for all Tables containing possible obfuscatable Data.

```
SELECT t.TABLE_NAME as tableName, t.TABLE_SCHEMA as schemaName, p.RowCnt, t.CREATE_TIME as createTime, t.UPDATE_TIME AS lastUpdate
FROM INFORMATION_SCHEMA.TABLES t
         LEFT JOIN (
    SELECT TABLE_NAME, TABLE_ROWS AS RowCnt
    FROM INFORMATION_SCHEMA.TABLES
    GROUP BY TABLE_NAME
) p ON t.TABLE_NAME = p.TABLE_NAME
WHERE
    (t.TABLE_TYPE = 'BASE TABLE' AND t.TABLE_SCHEMA = '<<database>>' AND (p.RowCnt IS NOT NULL OR p.RowCnt > 0)
        AND (
         (p.TABLE_NAME NOT IN
          (<<skiptables>>)))
        )
ORDER BY t.TABLE_NAME;
```

Fetches all ColumnNames and the FieldCount that represents the total number of usage of this field in all Tables.

```
SELECT COLUMN_NAME, COUNT(*) AS FieldCount, GROUP_CONCAT(TABLE_NAME) AS TableNames
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = '<<database>>'
GROUP BY COLUMN_NAME
ORDER BY FieldCount DESC, COLUMN_NAME;
```

Fetches the Size of the Tabelles in MB and the Row Count
```
SELECT
    TABLE_NAME AS TableName,
    ROUND(DATA_LENGTH + INDEX_LENGTH) AS Size_MB,
    ROUND(DATA_LENGTH) AS DataSize_MB,
    TABLE_ROWS AS RowCount
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = '<<database>>'
  AND
    TABLE_TYPE = 'BASE TABLE';
```

All the relevant Data we need to create the Cluster
```
SELECT INFORMATION_SCHEMA.TABLES.TABLE_NAME AS tableName,
   ROUND(DATA_LENGTH + INDEX_LENGTH)    AS size,
   TABLE_ROWS                           AS rowCnt,
   UPDATE_TIME                          AS lastUpdatedAt,
   COLUMN_NAME                          AS primaryKey
FROM INFORMATION_SCHEMA.TABLES
     LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE
               ON INFORMATION_SCHEMA.TABLES.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME
WHERE (
      INFORMATION_SCHEMA.TABLES.TABLE_SCHEMA = '<<database>>' AND TABLE_TYPE = 'BASE TABLE' AND
      (TABLE_ROWS IS NOT NULL OR TABLE_ROWS > 0)
          AND
      (
          INFORMATION_SCHEMA.TABLES.TABLE_NAME NOT IN ('" . implode("', '", $this->obsoletTables) . "')
          )
      );
```
