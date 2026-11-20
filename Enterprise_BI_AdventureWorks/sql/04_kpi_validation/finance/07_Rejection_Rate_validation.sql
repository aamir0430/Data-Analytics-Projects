USE EnterpriseBI_DW;
GO

SELECT
    SUM(ReceivedQty) AS TotalQuantityReceived,

    SUM(RejectedQty) AS TotalQuantityRejected,

    CAST(
        SUM(RejectedQty) * 100.0 /
        NULLIF(SUM(ReceivedQty), 0)
        AS DECIMAL(18,2)
    ) AS RejectionRatePercentage

FROM Fact.FactPurchaseOrders;