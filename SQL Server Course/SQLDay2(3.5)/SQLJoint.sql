select 
	p.[Name] ProductName
	,p.[ListPrice] 
	,cast(p.StandardCost as decimal(10,2))
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
	,DATEADD(month,DATEDIFF(month,0,soh.OrderDate),0)-1 -- get the last day of the month
	,DATEDIFF(month,0,soh.OrderDate)
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
--	--and cast(soh.OrderDate as date) between '2013-06-10' and '2013-07-10' -- query date columns
--	and datediff(mm,cast(soh.OrderDate as date), '2012-8-19') <=6 -- where the date difference is less than 6 months
--set dateformat dmy -- say in what order it would be

--select getdate() --get today date and hour

-- decimal(precision (greater than scale as it includes all numbers),scale)
-- rowversion: changes whenever row changes. 
-- average price by quarter