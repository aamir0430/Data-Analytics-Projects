USE EnterpriseBI_DW;
GO

WITH VendorSpend AS
(
    SELECT
        VendorKey,
        SUM(LineTotal) AS VendorPurchaseAmount
    FROM Fact.FactPurchaseOrders
    GROUP BY VendorKey
),
OverallSpend AS
(
    SELECT
        SUM(LineTotal) AS TotalPurchaseAmount,
        COUNT(DISTINCT VendorKey) AS TotalVendors
    FROM Fact.FactPurchaseOrders
)
SELECT
    v.VendorKey,

    v.VendorName,

    vs.VendorPurchaseAmount,

    os.TotalPurchaseAmount,

    os.TotalVendors,

    CAST(
        os.TotalPurchaseAmount * 1.0 /
        NULLIF(os.TotalVendors, 0)
        AS DECIMAL(18,2)
    ) AS AverageSpendPerVendor,

    CAST(
        vs.VendorPurchaseAmount * 100.0 /
        NULLIF(os.TotalPurchaseAmount, 0)
        AS DECIMAL(18,2)
    ) AS VendorSpendContributionPercentage

FROM VendorSpend vs
INNER JOIN Dim.DimVendor v
    ON vs.VendorKey = v.VendorKey
CROSS JOIN OverallSpend os
ORDER BY vs.VendorPurchaseAmount DESC;