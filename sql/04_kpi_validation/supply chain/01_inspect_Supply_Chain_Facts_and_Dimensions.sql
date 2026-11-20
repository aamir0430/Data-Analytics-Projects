USE EnterpriseBI_DW;
GO

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE,
    IS_NULLABLE,
    ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN
(
    'FactInventorySnapshot',
    'FactInventoryTransaction',
    'FactWorkOrder',
    'DimLocation',
    'DimProduct',
    'DimScrapReason',
    'DimTransactionType',
    'DimDate'
)
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;
