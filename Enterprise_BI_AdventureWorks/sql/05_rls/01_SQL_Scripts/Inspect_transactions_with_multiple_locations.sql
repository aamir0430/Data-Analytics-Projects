USE EnterpriseBI_DW;
GO

SELECT TOP (30)
    InventoryTransactionKey,
    TransactionID,
    WorkOrderID,
    COUNT(DISTINCT LocationKey) AS LocationCount,
    STRING_AGG(
        CAST(LocationID AS VARCHAR(10)),
        ', '
    ) AS LocationIDs
FROM Security.vw_WorkOrderTransactionLocation
GROUP BY
    InventoryTransactionKey,
    TransactionID,
    WorkOrderID
HAVING COUNT(DISTINCT LocationKey) > 1
ORDER BY LocationCount DESC, WorkOrderID;
GO