USE EnterpriseBI_DW;
GO

SELECT
    SUM(
        OrderQty * UnitPrice * UnitPriceDiscount
    ) AS TotalDiscountAmount
FROM Fact.FactSales;
GO