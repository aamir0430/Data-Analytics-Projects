USE EnterpriseBI_DW;
GO

SELECT
    b.BridgeRegionEmployeeKey,
    b.EmployeeKey,
    de.EmployeeID,
    de.EmployeeName,
    de.JobTitle,
    b.RegionKey,
    st.TerritoryName AS RegionName,
    b.IsActive,
    b.AssignmentSource,
    b.EffectiveFrom,
    b.EffectiveTo
FROM Security.BridgeRegionEmployee b
INNER JOIN Dim.DimEmployee de
    ON b.EmployeeKey = de.EmployeeKey
INNER JOIN Dim.DimSalesTerritory st
    ON b.RegionKey = st.SalesTerritoryKey
ORDER BY b.RegionKey, de.EmployeeName;

-- Summary

SELECT
    st.TerritoryName AS RegionName,
    COUNT(*) AS EmployeeCount
FROM Security.BridgeRegionEmployee b
INNER JOIN Dim.DimSalesTerritory st
    ON b.RegionKey = st.SalesTerritoryKey
WHERE b.IsActive = 1
GROUP BY st.TerritoryName
ORDER BY st.TerritoryName;