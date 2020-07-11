use DW_NORTHWND
if OBJECT_ID('FactOrderDetails', 'U') is not null
	drop table FactOrderDetails;

use northwnd;
select b.OrderID, b.ProductID, b.UnitPrice, b.Quantity, b.Discount, 
b.Discount * 100 as DiscountPct, convert (varchar (10), b.Discount * 100) + '%' as DiscountPctStr,
b.UnitPrice * b.Discount as UnitDiscount,
b.UnitPrice * b.Quantity * b.Discount as TotalDiscount
INTO DW_NORTHWND.dbo.FactOrderDetails
from [Order Details] b