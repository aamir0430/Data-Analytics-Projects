USE AdventureWorks2025;
GO

SELECT
    e.BusinessEntityID,
    e.NationalIDNumber,
    e.JobTitle,
    e.HireDate,
    p.FirstName,
    p.LastName,
    a.AddressID,
    a.City,
    sp.Name AS StateProvince,
    sp.CountryRegionCode,
    cr.Name AS CountryName
FROM HumanResources.Employee e
LEFT JOIN Person.Person p
    ON e.BusinessEntityID = p.BusinessEntityID
LEFT JOIN Person.BusinessEntityAddress bea
    ON e.BusinessEntityID = bea.BusinessEntityID
LEFT JOIN Person.Address a
    ON bea.AddressID = a.AddressID
LEFT JOIN Person.StateProvince sp
    ON a.StateProvinceID = sp.StateProvinceID
LEFT JOIN Person.CountryRegion cr
    ON sp.CountryRegionCode = cr.CountryRegionCode
ORDER BY e.BusinessEntityID;