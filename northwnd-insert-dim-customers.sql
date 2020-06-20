use DW_NORTHWND
if OBJECT_ID('DimCustomers', 'U') is not null
	drop table DimCustomers;

use northwnd;
select 
CustomerID, CompanyName, city, Region, Country
into DW_NORTHWND.dbo.DimCustomers
 from Customers b
