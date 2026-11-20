USE EnterpriseBI_DW;
GO

-- 1. Inspect all Finance vendor columns
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dim'
  AND TABLE_NAME = 'DimVendor'
ORDER BY ORDINAL_POSITION;


-- 2. Inspect all HR employee columns
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dim'
  AND TABLE_NAME = 'DimEmployee'
ORDER BY ORDINAL_POSITION;


-- 3. Inspect all Supply Chain location columns
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Dim'
  AND TABLE_NAME = 'DimLocation'
ORDER BY ORDINAL_POSITION;


-- 4. Inspect all Finance fact columns
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Fact'
  AND TABLE_NAME IN (
      'FactPurchaseOrders',
      'FactPurchaseOrderHeader'
  )
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- 5. Inspect all Supply Chain fact columns
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Fact'
  AND TABLE_NAME IN (
      'FactInventorySnapshot',
      'FactInventoryTransaction',
      'FactWorkOrder'
  )
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- 6. Inspect all HR fact columns
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Fact'
  AND TABLE_NAME IN (
      'FactEmployeeDepartmentHistory',
      'FactEmployeeSnapshot',
      'FactEmployeePayHistory'
  )
ORDER BY TABLE_NAME, ORDINAL_POSITION;