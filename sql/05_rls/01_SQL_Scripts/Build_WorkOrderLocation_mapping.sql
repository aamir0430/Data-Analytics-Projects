USE EnterpriseBI_DW;
GO

SELECT
    wor.LocationID,
    dl.LocationKey,
    dl.LocationName,
    COUNT(*) AS RoutingOperations,
    COUNT(DISTINCT wor.WorkOrderID) AS DistinctWorkOrders,
    COUNT(DISTINCT wor.ProductID) AS DistinctProducts
FROM Production.WorkOrderRouting wor
INNER JOIN Dim.DimLocation dl
    ON wor.LocationID = dl.LocationID
GROUP BY
    wor.LocationID,
    dl.LocationKey,
    dl.LocationName
ORDER BY
    wor.LocationID;
GO