USE EnterpriseBI_DW;
GO

CREATE OR ALTER VIEW Security.vw_WorkOrderLocation
AS
SELECT DISTINCT
    wor.WorkOrderID,
    wor.LocationID,
    dl.LocationKey,
    dl.LocationName
FROM Production.WorkOrderRouting wor
INNER JOIN Dim.DimLocation dl
    ON wor.LocationID = dl.LocationID;
GO

-- Validate the view

SELECT
    COUNT(*) AS TotalWorkOrderLocationMappings,
    COUNT(DISTINCT WorkOrderID) AS DistinctWorkOrders,
    COUNT(DISTINCT LocationKey) AS DistinctLocations
FROM Security.vw_WorkOrderLocation;
GO