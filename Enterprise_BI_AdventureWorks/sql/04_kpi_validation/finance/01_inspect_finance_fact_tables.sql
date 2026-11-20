USE EnterpriseBI_DW;
GO

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'FactPurchaseOrders',
    'FactPurchaseOrderHeader',
    'FactCurrencyRate'
)
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;
GO