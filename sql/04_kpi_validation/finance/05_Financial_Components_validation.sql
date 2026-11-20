USE EnterpriseBI_DW;
GO

SELECT
    SUM(SubTotal) AS TotalPurchaseSubtotal,

    SUM(TaxAmt) AS TotalPurchaseTax,

    SUM(Freight) AS TotalPurchaseFreight,

    SUM(TotalDue) AS TotalPurchaseDue,

    COUNT(DISTINCT PurchaseOrderID) AS TotalHeaderOrders,

    CAST(
        SUM(TaxAmt) * 1.0 /
        NULLIF(COUNT(DISTINCT PurchaseOrderID), 0)
        AS DECIMAL(18,2)
    ) AS AverageTaxPerOrder,

    CAST(
        SUM(Freight) * 1.0 /
        NULLIF(COUNT(DISTINCT PurchaseOrderID), 0)
        AS DECIMAL(18,2)
    ) AS AverageFreightPerOrder

FROM Fact.FactPurchaseOrderHeader;