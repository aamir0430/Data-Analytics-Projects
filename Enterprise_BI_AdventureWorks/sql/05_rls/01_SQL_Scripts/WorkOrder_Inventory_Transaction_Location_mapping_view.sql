USE EnterpriseBI_DW;
GO

CREATE OR ALTER VIEW Security.vw_WorkOrderTransactionLocation
AS
SELECT DISTINCT
    fit.InventoryTransactionKey,
    fit.TransactionID,
    fit.ReferenceOrderID AS WorkOrderID,
    wol.LocationKey,
    wol.LocationID,
    wol.LocationName
FROM Fact.FactInventoryTransaction fit

INNER JOIN Security.vw_WorkOrderLocation wol
    ON fit.ReferenceOrderID = wol.WorkOrderID

WHERE fit.TransactionTypeKey = 1;
GO