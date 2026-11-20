USE EnterpriseBI_DW;
GO

WITH MonthlyPurchases AS
(
    SELECT
        d.YearNumber,
        d.QuarterNumber,
        d.MonthNumber,
        d.MonthName,
        SUM(f.LineTotal) AS MonthlyPurchaseAmount
    FROM Fact.FactPurchaseOrders f
    INNER JOIN Dim.DimDate d
        ON f.OrderDateKey = d.DateKey
    GROUP BY
        d.YearNumber,
        d.QuarterNumber,
        d.MonthNumber,
        d.MonthName
),
TimeIntelligence AS
(
    SELECT
        *,
        SUM(MonthlyPurchaseAmount) OVER
        (
            PARTITION BY YearNumber
            ORDER BY MonthNumber
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS PurchaseYTD,

        SUM(MonthlyPurchaseAmount) OVER
        (
            PARTITION BY YearNumber, QuarterNumber
            ORDER BY MonthNumber
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS PurchaseQTD

    FROM MonthlyPurchases
)
SELECT
    t.YearNumber,
    t.QuarterNumber,
    t.MonthNumber,
    t.MonthName,
    t.MonthlyPurchaseAmount,
    t.MonthlyPurchaseAmount AS PurchaseMTD,
    t.PurchaseQTD,
    t.PurchaseYTD,

    py.MonthlyPurchaseAmount AS PurchasePreviousYear,

    t.MonthlyPurchaseAmount -
        COALESCE(py.MonthlyPurchaseAmount, 0)
        AS PurchaseYoYGrowthAmount,

    CAST(
        (t.MonthlyPurchaseAmount - py.MonthlyPurchaseAmount) * 100.0
        / NULLIF(py.MonthlyPurchaseAmount, 0)
        AS DECIMAL(18,2)
    ) AS PurchaseYoYGrowthPercentage

FROM TimeIntelligence t
LEFT JOIN MonthlyPurchases py
    ON t.YearNumber = py.YearNumber + 1
    AND t.MonthNumber = py.MonthNumber
ORDER BY
    t.YearNumber,
    t.MonthNumber;