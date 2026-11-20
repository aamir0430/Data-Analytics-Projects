USE EnterpriseBI_DW;
GO

SELECT
    SUM(LineTotal) AS TotalSales,
    SUM(OrderQty) AS TotalQuantitySold,
    COUNT(DISTINCT SalesOrderID) AS TotalOrders,
    COUNT(DISTINCT CustomerKey) AS TotalCustomers
FROM Fact.FactSales;
GO