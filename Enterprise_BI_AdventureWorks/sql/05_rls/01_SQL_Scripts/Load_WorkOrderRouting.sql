USE EnterpriseBI_DW;
GO

-- Create Production schema if it does not exist
IF NOT EXISTS
(
    SELECT 1
    FROM sys.schemas
    WHERE name = 'Production'
)
BEGIN
    EXEC('CREATE SCHEMA Production');
END;
GO

-- Create the warehouse table using the source table structure
IF OBJECT_ID('Production.WorkOrderRouting', 'U') IS NULL
BEGIN
    SELECT TOP (0) *
    INTO Production.WorkOrderRouting
    FROM AdventureWorks2025.Production.WorkOrderRouting;
END;
GO

-- Refresh the warehouse table
TRUNCATE TABLE Production.WorkOrderRouting;

INSERT INTO Production.WorkOrderRouting
SELECT *
FROM AdventureWorks2025.Production.WorkOrderRouting;
GO

-- Validate the loaded data
SELECT
    COUNT(*) AS TotalRoutingRows,
    COUNT(DISTINCT WorkOrderID) AS DistinctWorkOrders,
    COUNT(DISTINCT LocationID) AS DistinctLocations
FROM Production.WorkOrderRouting;
GO