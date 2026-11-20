USE EnterpriseBI_DW;
GO

-- 1. Check which schemas already exist
SELECT
    name AS SchemaName
FROM sys.schemas
WHERE name NOT IN
(
    'dbo',
    'guest',
    'INFORMATION_SCHEMA',
    'sys'
)
ORDER BY name;


-- 2. Check whether the transaction type dimension exists
SELECT
    s.name AS SchemaName,
    t.name AS TableName,
    c.column_id AS ColumnOrder,
    c.name AS ColumnName,
    ty.name AS DataType
FROM sys.tables t
INNER JOIN sys.schemas s
    ON t.schema_id = s.schema_id
INNER JOIN sys.columns c
    ON t.object_id = c.object_id
INNER JOIN sys.types ty
    ON c.user_type_id = ty.user_type_id
WHERE t.name = 'DimTransactionType'
ORDER BY c.column_id;


-- 3. Check transaction type records
SELECT *
FROM Dim.DimTransactionType;


-- 4. Confirm whether routing data exists in the source database
SELECT
    COUNT(*) AS RoutingRows,
    COUNT(DISTINCT WorkOrderID) AS DistinctWorkOrders,
    COUNT(DISTINCT LocationID) AS DistinctLocations
FROM AdventureWorks2025.Production.WorkOrderRouting;
GO