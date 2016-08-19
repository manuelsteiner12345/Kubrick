select 
	p.[Name] ProductName
	,p.[ListPrice] 
	,p.[StandardCost]
	,p.[Color]
	,sod.[CarrierTrackingNumber]
	,sod.[OrderQty]
	,sod.[LineTotal]
	,sod.[UnitPrice]
	,cast(soh.[OrderDate] as date) OrderDate	-- DateTime (milisecond)/ DateTime2(nanosecond)/Date/DateTimeOffset (date of the time + timezone)
	,datename(yy,soh.[OrderDate]) OrderYear-- gives the year
	,datename(qq,soh.[OrderDate]) OrderQuarter --gives the quarter
	,datename(mm,soh.[OrderDate]) OrderMonth -- gives the month
	,datepart(mm,soh.[OrderDate]) OrderM	-- gives the month in number
	,convert(date, soh.OrderDate, 13) --works as cast (just use it for date tho because it has a special feature for date). The number is a special country code
	,convert(date, soh.OrderDate, 3)
	,soh.[DueDate]
	,soh.[ShipDate]
--from [Sales].[SalesOrderDetail], [Production].[Product]
--where [Sales].[SalesOrderDetail].[ProductID] = [Production].[Product].[ProductID]-- where primary key = foreign key (old bad way of doing it)

from [Sales].[SalesOrderDetail] sod with (nolock)
inner join Production.Product p with (nolock)
	on sod.ProductID = p.ProductID
inner join [Sales].[SalesOrderHeader] soh
	on sod.SalesOrderID = soh.SalesOrderID 
where 1=1
	and cast(soh.OrderDate as date) between '2013-06-10' and '2013-07-10'