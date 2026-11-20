USE EnterpriseBI_DW;
GO

SELECT
    SUM(LineTotal) AS TotalPurchaseAmount,

    COUNT(DISTINCT PurchaseOrderID) AS TotalPurchaseOrders,

    COUNT(*) AS TotalPurchaseLines,

    SUM(OrderQty) AS TotalQuantityOrdered,

    SUM(ReceivedQty) AS TotalQuantityReceived,

    SUM(RejectedQty) AS TotalQuantityRejected,

    SUM(StockedQty) AS TotalQuantityStocked,

    CAST(
        SUM(LineTotal) * 1.0 /
        NULLIF(COUNT(DISTINCT PurchaseOrderID), 0)
        AS DECIMAL(18,2)
    ) AS AveragePurchaseOrderValue,

    CAST(
        SUM(LineTotal) * 1.0 /
        NULLIF(COUNT(*), 0)
        AS DECIMAL(18,2)
    ) AS AveragePurchaseLineValue

FROM Fact.FactPurchaseOrders;