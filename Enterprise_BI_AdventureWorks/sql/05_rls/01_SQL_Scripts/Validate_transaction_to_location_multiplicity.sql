USE EnterpriseBI_DW;
GO

WITH TransactionLocationCount AS
(
    SELECT
        InventoryTransactionKey,
        COUNT(DISTINCT LocationKey) AS LocationCount
    FROM Security.vw_WorkOrderTransactionLocation
    GROUP BY InventoryTransactionKey
)
SELECT
    LocationCount,
    COUNT(*) AS NumberOfTransactions
FROM TransactionLocationCount
GROUP BY LocationCount
ORDER BY LocationCount;
GO