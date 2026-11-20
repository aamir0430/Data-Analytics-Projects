USE EnterpriseBI_DW;
GO

INSERT INTO Security.BridgeRegionFinance
(
    RegionKey,
    VendorKey,
    SourceTerritoryID,
    AddressTypeID
)

SELECT DISTINCT
    st.SalesTerritoryKey,
    dv.VendorKey,
    sp.TerritoryID,
    bea.AddressTypeID

FROM AdventureWorks2025.Purchasing.Vendor v

INNER JOIN AdventureWorks2025.Person.BusinessEntityAddress bea
    ON v.BusinessEntityID = bea.BusinessEntityID

INNER JOIN AdventureWorks2025.Person.Address a
    ON bea.AddressID = a.AddressID

INNER JOIN AdventureWorks2025.Person.StateProvince sp
    ON a.StateProvinceID = sp.StateProvinceID

INNER JOIN Dim.DimVendor dv
    ON dv.VendorID = v.BusinessEntityID

INNER JOIN Dim.DimSalesTerritory st
    ON st.TerritoryID = sp.TerritoryID

WHERE bea.AddressTypeID = 3

AND NOT EXISTS
(
    SELECT 1
    FROM Security.BridgeRegionFinance existing
    WHERE existing.VendorKey = dv.VendorKey
      AND existing.RegionKey = st.SalesTerritoryKey
);
GO