USE EnterpriseBI_DW;
GO

-- Inspect table structures

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    (TABLE_SCHEMA = 'Dim' AND TABLE_NAME = 'DimLocation')
    OR
    (TABLE_SCHEMA = 'Fact' AND TABLE_NAME IN
    (
        'FactInventorySnapshot',
        'FactInventoryTransaction',
        'FactWorkOrder'
    ))
ORDER BY
    TABLE_SCHEMA,
    TABLE_NAME,
    ORDINAL_POSITION;

-- Inspect DimLocation

USE EnterpriseBI_DW;
GO

SELECT *
FROM Dim.DimLocation
ORDER BY LocationKey;

-- Inspect InventorySnapshot

SELECT TOP 30 *
FROM Fact.FactInventorySnapshot
ORDER BY LocationKey, ProductKey;

-- Inspect InventoryTransactions

SELECT TOP 30 *
FROM Fact.FactInventoryTransaction
ORDER BY TransactionDateKey, ProductKey;

-- Inspect WorkOrders

SELECT TOP 30 *
FROM Fact.FactWorkOrder
ORDER BY WorkOrderID;