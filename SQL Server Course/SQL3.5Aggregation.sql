select 
	avg(sod.LineTotal) AvgSpend 
	--,avg(sod.LineTotal) StDevSpend
	--,min(sod.LineTotal) MinSpend
	--,max(sod.LineTotal) MaxSpend
	,datename(yy,soh.[OrderDate]) + datename(qq,soh.[OrderDate]) YQtr


from [Sales].[SalesOrderDetail] sod with (nolock)
inner join Production.Product p with (nolock)
	on sod.ProductID = p.ProductID
inner join [Sales].[SalesOrderHeader] soh
	on sod.SalesOrderID = soh.SalesOrderID 
where 1=1

group by	--allows to query something else than aggregate
	datename(yy, soh.OrderDate) +datename(qq,soh.OrderDate)-- give average (defined in select) of all the values by year
	--,  -- group by date and quarter
	-- if you group by aggregatd value, impossible to get single values