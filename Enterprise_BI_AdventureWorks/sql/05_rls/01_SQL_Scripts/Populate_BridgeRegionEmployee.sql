USE EnterpriseBI_DW;
GO

SET XACT_ABORT ON;

BEGIN TRANSACTION;

-- 1. Prepare the verified employee-region mapping
IF OBJECT_ID('tempdb..#EmployeeRegionMapping') IS NOT NULL
    DROP TABLE #EmployeeRegionMapping;

SELECT
    de.EmployeeKey,
    sp.TerritoryID AS RegionKey
INTO #EmployeeRegionMapping
FROM Dim.DimEmployee de
INNER JOIN AdventureWorks2025.Sales.SalesPerson sp
    ON de.EmployeeID = sp.BusinessEntityID
WHERE sp.TerritoryID IS NOT NULL;

-- 2. Verify that there are exactly 14 source assignments
IF (SELECT COUNT(*) FROM #EmployeeRegionMapping) <> 14
BEGIN
    THROW 50001,
        'Expected 14 employee-region mappings. Insert cancelled.',
        1;
END;

-- 3. Check for conflicting existing employee assignments
IF EXISTS
(
    SELECT 1
    FROM #EmployeeRegionMapping m
    INNER JOIN Security.BridgeRegionEmployee b
        ON b.EmployeeKey = m.EmployeeKey
    WHERE b.RegionKey <> m.RegionKey
)
BEGIN
    THROW 50002,
        'Conflicting employee-region assignment found. Insert cancelled.',
        1;
END;

-- 4. Insert missing employee-region assignments
INSERT INTO Security.BridgeRegionEmployee
(
    EmployeeKey,
    RegionKey,
    IsActive,
    AssignmentSource,
    EffectiveFrom,
    EffectiveTo
)
SELECT
    m.EmployeeKey,
    m.RegionKey,
    1,
    'AdventureWorks SalesPerson Territory Assignment',
    CONVERT(DATE, GETDATE()),
    NULL
FROM #EmployeeRegionMapping m
WHERE NOT EXISTS
(
    SELECT 1
    FROM Security.BridgeRegionEmployee b
    WHERE b.EmployeeKey = m.EmployeeKey
);

COMMIT TRANSACTION;

PRINT 'HR employee-region bridge population completed.';
GO