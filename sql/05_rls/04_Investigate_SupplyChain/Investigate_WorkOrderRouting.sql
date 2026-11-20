USE AdventureWorks2025;
GO

-- Work Order Routing Details

SELECT
    wor.WorkOrderID,
    wor.ProductID,
    wor.OperationSequence,
    wor.LocationID,
    l.Name AS LocationName,
    wor.ScheduledStartDate,
    wor.ScheduledEndDate,
    wor.ActualStartDate,
    wor.ActualEndDate,
    wor.ActualResourceHrs,
    wor.PlannedCost,
    wor.ActualCost
FROM Production.WorkOrderRouting wor
INNER JOIN Production.Location l
    ON wor.LocationID = l.LocationID
ORDER BY
    wor.WorkOrderID,
    wor.OperationSequence;

-- Work Orders by operational locations

SELECT
    l.LocationID,
    l.Name AS LocationName,
    l.CostRate,
    l.Availability,
    COUNT(DISTINCT wor.WorkOrderID) AS WorkOrderCount,
    COUNT(*) AS RoutingOperationCount
FROM Production.WorkOrderRouting wor
INNER JOIN Production.Location l
    ON wor.LocationID = l.LocationID
GROUP BY
    l.LocationID,
    l.Name,
    l.CostRate,
    l.Availability
ORDER BY
    l.LocationID;

-- Inspect all production locations

SELECT
    LocationID,
    Name AS LocationName,
    CostRate,
    Availability,
    ModifiedDate
FROM Production.Location
ORDER BY LocationID;