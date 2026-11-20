USE AdventureWorks2025;
GO

SELECT
    v.BusinessEntityID,
    v.AccountNumber,
    v.Name AS VendorName,
    a.AddressID,
    a.City,
    sp.Name AS StateProvince,
    sp.CountryRegionCode,
    cr.Name AS CountryName
FROM Purchasing.Vendor v
LEFT JOIN Person.BusinessEntityAddress bea
    ON v.BusinessEntityID = bea.BusinessEntityID
LEFT JOIN Person.Address a
    ON bea.AddressID = a.AddressID
LEFT JOIN Person.StateProvince sp
    ON a.StateProvinceID = sp.StateProvinceID
LEFT JOIN Person.CountryRegion cr
    ON sp.CountryRegionCode = cr.CountryRegionCode
ORDER BY v.BusinessEntityID;