USE EnterpriseBI_DW;
GO

WITH WorkOrderLocationCount AS
(
    SELECT
        WorkOrderID,
        COUNT(DISTINCT LocationID) AS LocationCount
    FROM Production.WorkOrderRouting
    GROUP BY WorkOrderID
)
SELECT
    LocationCount,
    COUNT(*) AS NumberOfWorkOrders
FROM WorkOrderLocationCount
GROUP BY LocationCount
ORDER BY LocationCount;
GO

-- Identify Work orders assigned to multiple Locations

USE EnterpriseBI_DW;
GO

SELECT TOP (50)
    WorkOrderID,
    COUNT(DISTINCT LocationID) AS LocationCount,
    STRING_AGG(
        CAST(LocationID AS VARCHAR(10)),
        ', '
    ) AS LocationIDs
FROM Production.WorkOrderRouting
GROUP BY WorkOrderID
HAVING COUNT(DISTINCT LocationID) > 1
ORDER BY LocationCount DESC, WorkOrderID;
GO

-- Validate routing-to-dimension coverage

USE EnterpriseBI_DW;
GO

SELECT
    COUNT(*) AS TotalRoutingRows,

    SUM(
        CASE
            WHEN dl.LocationKey IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS MatchedRoutingRows,

    SUM(
        CASE
            WHEN dl.LocationKey IS NULL THEN 1
            ELSE 0
        END
    ) AS UnmatchedRoutingRows

FROM Production.WorkOrderRouting wor
LEFT JOIN Dim.DimLocation dl
    ON wor.LocationID = dl.LocationID;
GO