USE EnterpriseBI_DW;
GO

SELECT
    t.name AS TableName,
    c.column_id AS ColumnOrder,
    c.name AS ColumnName,
    ty.name AS DataType,
    c.max_length AS MaxLength,
    c.is_nullable AS IsNullable
FROM sys.tables t
INNER JOIN sys.columns c
    ON t.object_id = c.object_id
INNER JOIN sys.types ty
    ON c.user_type_id = ty.user_type_id
WHERE t.name IN (
    'FactPurchaseOrders',
    'FactPurchaseOrderHeader',
    'FactCurrencyRate',
    'DimDate',
    'DimVendor'
)
ORDER BY
    t.name,
    c.column_id;

SELECT
    fk.name AS ForeignKeyName,
    OBJECT_NAME(fkc.parent_object_id) AS FactTable,
    COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS FactColumn,
    OBJECT_NAME(fkc.referenced_object_id) AS ReferencedTable,
    COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS ReferencedColumn
FROM sys.foreign_key_columns fkc
INNER JOIN sys.foreign_keys fk
    ON fkc.constraint_object_id = fk.object_id
WHERE OBJECT_NAME(fkc.parent_object_id) IN (
    'FactPurchaseOrders',
    'FactPurchaseOrderHeader',
    'FactCurrencyRate'
)
ORDER BY FactTable, ForeignKeyName;