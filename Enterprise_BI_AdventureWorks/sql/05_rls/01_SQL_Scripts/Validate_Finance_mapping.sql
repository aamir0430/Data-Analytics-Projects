USE EnterpriseBI_DW;
GO

SELECT
    b.BridgeRegionFinanceKey,
    b.VendorKey,
    v.VendorName,
    b.RegionKey,
    st.TerritoryName,
    st.TerritoryGroup,
    b.SourceTerritoryID,
    b.AddressTypeID,
    b.IsActive

FROM Security.BridgeRegionFinance b

INNER JOIN Dim.DimVendor v
    ON b.VendorKey = v.VendorKey

INNER JOIN Dim.DimSalesTerritory st
    ON b.RegionKey = st.SalesTerritoryKey

ORDER BY
    st.TerritoryName,
    v.VendorName;
GO


-- Mapping counts by region

SELECT
    st.TerritoryName,
    st.TerritoryGroup,
    COUNT(DISTINCT b.VendorKey) AS VendorCount

FROM Security.BridgeRegionFinance b

INNER JOIN Dim.DimSalesTerritory st
    ON b.RegionKey = st.SalesTerritoryKey

WHERE b.IsActive = 1

GROUP BY
    st.TerritoryName,
    st.TerritoryGroup

ORDER BY st.TerritoryName;
GO


-- Check unmapped vendors

SELECT
    v.VendorKey,
    v.VendorName

FROM Dim.DimVendor v

LEFT JOIN Security.BridgeRegionFinance b
    ON v.VendorKey = b.VendorKey

WHERE b.VendorKey IS NULL;
GO