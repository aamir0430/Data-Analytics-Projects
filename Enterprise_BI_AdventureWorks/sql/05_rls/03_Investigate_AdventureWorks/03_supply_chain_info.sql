-- Work Order Structure

USE AdventureWorks2025;
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
  AND TABLE_NAME = 'WorkOrder'
ORDER BY ORDINAL_POSITION;

-- Inventory Transaction Structure

USE AdventureWorks2025;
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
  AND TABLE_NAME = 'TransactionHistory'
ORDER BY ORDINAL_POSITION;

-- Production Locations

USE AdventureWorks2025;
GO

SELECT
    LocationID,
    Name AS LocationName,
    CostRate,
    Availability
FROM Production.Location
ORDER BY LocationID;