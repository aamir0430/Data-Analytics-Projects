USE EnterpriseBI_DW;
GO

-- 1. Existing Sales territories
SELECT
    SalesTerritoryKey,
    TerritoryID,
    TerritoryName,
    CountryRegionCode,
    TerritoryGroup
FROM Dim.DimSalesTerritory
ORDER BY TerritoryGroup, TerritoryName;


-- 2. Existing Supply Chain locations
SELECT
    LocationKey,
    LocationID,
    LocationName,
    Availability,
    CostRate
FROM Dim.DimLocation
ORDER BY LocationName;


-- 3. Geographical distribution of addresses
SELECT
    TerritoryID,
    CountryRegionCode,
    CountryName,
    StateProvinceName,
    COUNT(*) AS AddressCount
FROM Dim.DimAddress
GROUP BY
    TerritoryID,
    CountryRegionCode,
    CountryName,
    StateProvinceName
ORDER BY
    TerritoryID,
    CountryName,
    StateProvinceName;


-- 4. HR department structure
SELECT
    DepartmentKey,
    DepartmentID,
    DepartmentName,
    DepartmentGroup
FROM Dim.DimDepartment
ORDER BY DepartmentGroup, DepartmentName;


-- 5. Employees assigned to departments
SELECT
    d.DepartmentName,
    COUNT(DISTINCT h.EmployeeKey) AS EmployeeCount
FROM Fact.FactEmployeeDepartmentHistory h
INNER JOIN Dim.DimDepartment d
    ON h.DepartmentKey = d.DepartmentKey
WHERE h.IsCurrentAssignment = 1
GROUP BY d.DepartmentName
ORDER BY d.DepartmentName;