USE EnterpriseBI_DW;
GO

-- Validate Work Order Transaction coverage

SELECT
    COUNT(*) AS TotalWorkOrderTransactions,

    COUNT(DISTINCT fit.ReferenceOrderID)
        AS DistinctReferencedWorkOrders,

    COUNT(DISTINCT CASE
        WHEN fwo.WorkOrderID IS NOT NULL
        THEN fit.ReferenceOrderID
    END) AS MatchedWorkOrders,

    COUNT(CASE
        WHEN fwo.WorkOrderID IS NOT NULL
        THEN 1
    END) AS MatchedTransactionRows,

    COUNT(CASE
        WHEN fwo.WorkOrderID IS NULL
        THEN 1
    END) AS UnmatchedTransactionRows

FROM Fact.FactInventoryTransaction fit

LEFT JOIN Fact.FactWorkOrder fwo
    ON fit.ReferenceOrderID = fwo.WorkOrderID

WHERE fit.TransactionTypeKey = 1;
GO

-- Validate transactions against production routing

USE EnterpriseBI_DW;
GO

SELECT
    COUNT(*) AS TotalWorkOrderTransactions,

    COUNT(CASE
        WHEN wol.WorkOrderID IS NOT NULL
        THEN 1
    END) AS TransactionsWithRouting,

    COUNT(CASE
        WHEN wol.WorkOrderID IS NULL
        THEN 1
    END) AS TransactionsWithoutRouting,

    COUNT(DISTINCT fit.ReferenceOrderID)
        AS DistinctReferencedWorkOrders

FROM Fact.FactInventoryTransaction fit

LEFT JOIN
(
    SELECT DISTINCT WorkOrderID
    FROM Security.vw_WorkOrderLocation
) wol
    ON fit.ReferenceOrderID = wol.WorkOrderID

WHERE fit.TransactionTypeKey = 1;
GO