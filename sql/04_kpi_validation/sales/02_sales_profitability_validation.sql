USE EnterpriseBI_DW;
GO

SELECT
    SUM(
        F.OrderQty * P.StandardCost
    ) AS TotalCost,

    SUM(F.LineTotal) AS TotalSales,

    SUM(F.LineTotal)
        - SUM(F.OrderQty * P.StandardCost)
        AS TotalProfit

FROM Fact.FactSales F

INNER JOIN Dim.DimProduct P
    ON F.ProductKey = P.ProductKey;
GO