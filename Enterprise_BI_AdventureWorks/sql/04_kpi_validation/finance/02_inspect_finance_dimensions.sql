USE EnterpriseBI_DW;
GO

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'DimDate',
    'DimProduct',
    'DimEmployee',
    'DimVendor',
    'DimShipMethod',
    'DimCurrency'
)
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;
GO