-- bla bla
use AdventureWorks2014;
go
select all
	ProductID
	,[Name] [Product Name]
	,substring([Name],1,3)
	,right([Name],3)
	,reverse(substring(reverse(Name),2,3)) Pen3Name
	,[Weight] [Product Weight]
	,[Class] [Product Class]
	,StandardCost
	,ListPrice
	,ListPrice-StandardCost as Profit
from [Production].[Product];
go


