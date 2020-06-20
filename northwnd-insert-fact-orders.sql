/****** Script for SelectTopNRows command from SSMS  ******/
use DW_NORTHWND
if OBJECT_ID('FactOrders', 'U') is not null
	drop table FactOrders;

use northwnd;
SELECT TOP (1000) o.[OrderID]      ,o.[CustomerID]      ,o.[EmployeeID]
      ,o.[OrderDate]      ,o.[RequiredDate]      ,o.[ShippedDate]
      ,s.CompanyName      ,o.[Freight]      ,o.[ShipName]
      ,o.[ShipCity]      ,o.[ShipRegion]      ,o.[ShipCountry]
  INTO [DW_NORTHWND].dbo.FactOrders
  FROM [NORTHWND].[dbo].[Orders] o
  inner join NORTHWND.dbo.Shippers s
	on s.ShipperID = o.ShipVia