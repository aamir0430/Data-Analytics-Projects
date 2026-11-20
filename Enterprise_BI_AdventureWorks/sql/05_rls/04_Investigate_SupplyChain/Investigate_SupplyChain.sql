USE AdventureWorks2025;
GO

-- Product Inventory and Locations

SELECT
    pi.ProductID,
    p.Name AS ProductName,
    pi.LocationID,
    l.Name AS LocationName,
    pi.Shelf,
    pi.Bin,
    pi.Quantity
FROM Production.ProductInventory pi
INNER JOIN Production.Product p
    ON pi.ProductID = p.ProductID
INNER JOIN Production.Location l
    ON pi.LocationID = l.LocationID
ORDER BY
    pi.ProductID,
    pi.LocationID;

-- Number of Locations per Product

SELECT
    pi.ProductID,
    p.Name AS ProductName,
    COUNT(DISTINCT pi.LocationID) AS LocationCount,
    STRING_AGG(
        CAST(l.Name AS NVARCHAR(MAX)),
        ', '
    ) AS Locations
FROM Production.ProductInventory pi
INNER JOIN Production.Product p
    ON pi.ProductID = p.ProductID
INNER JOIN Production.Location l
    ON pi.LocationID = l.LocationID
GROUP BY
    pi.ProductID,
    p.Name
ORDER BY
    LocationCount DESC,
    pi.ProductID;

-- Work Order and Possible Inventory Locations

SELECT
    wo.WorkOrderID,
    wo.ProductID,
    p.Name AS ProductName,
    COUNT(DISTINCT pi.LocationID) AS PossibleLocationCount,
    STRING_AGG(
        CAST(l.Name AS NVARCHAR(MAX)),
        ', '
    ) AS PossibleLocations
FROM Production.WorkOrder wo
INNER JOIN Production.Product p
    ON wo.ProductID = p.ProductID
LEFT JOIN Production.ProductInventory pi
    ON wo.ProductID = pi.ProductID
LEFT JOIN Production.Location l
    ON pi.LocationID = l.LocationID
GROUP BY
    wo.WorkOrderID,
    wo.ProductID,
    p.Name
ORDER BY
    PossibleLocationCount DESC,
    wo.WorkOrderID;

-- Transaction to Work-Order mapping

SELECT
    th.TransactionType,
    COUNT(*) AS TransactionCount,
    COUNT(DISTINCT th.ReferenceOrderID) AS ReferenceOrderCount,
    COUNT(DISTINCT wo.WorkOrderID) AS MatchingWorkOrders,
    COUNT(DISTINCT wo.ProductID) AS MatchingProducts
FROM Production.TransactionHistory th
LEFT JOIN Production.WorkOrder wo
    ON th.ReferenceOrderID = wo.WorkOrderID
   AND th.TransactionType = 'W'
GROUP BY
    th.TransactionType
ORDER BY
    th.TransactionType;

-- Inspect Production Foreign Keys

SELECT
    fk.name AS ForeignKeyName,
    OBJECT_SCHEMA_NAME(fkc.parent_object_id) AS ParentSchema,
    OBJECT_NAME(fkc.parent_object_id) AS ParentTable,
    pc.name AS ParentColumn,
    OBJECT_SCHEMA_NAME(fkc.referenced_object_id) AS ReferencedSchema,
    OBJECT_NAME(fkc.referenced_object_id) AS ReferencedTable,
    rc.name AS ReferencedColumn
FROM sys.foreign_key_columns fkc
INNER JOIN sys.foreign_keys fk
    ON fkc.constraint_object_id = fk.object_id
INNER JOIN sys.columns pc
    ON fkc.parent_object_id = pc.object_id
   AND fkc.parent_column_id = pc.column_id
INNER JOIN sys.columns rc
    ON fkc.referenced_object_id = rc.object_id
   AND fkc.referenced_column_id = rc.column_id
WHERE OBJECT_SCHEMA_NAME(fkc.parent_object_id) = 'Production'
ORDER BY
    ParentTable,
    ForeignKeyName;