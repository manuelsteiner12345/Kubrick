-- Filtering Groups with Having. E.g. Insta likes: use aggregate counts. Use user, picture, likeID. 
-- Group by picture (and count the number of rows, i.e. likes) ex: 1 user 4 likes 


--select 

--p.ProductNumber
--,count(*) SaleCount

--from [Sales].[SalesOrderDetail] sod with (nolock)
--inner join Production.Product p with (nolock)
--	on isnull(sod.ProductID , 'ZZZZZ') = p.ProductID
--inner join [Sales].[SalesOrderHeader] soh with (nolock)
--	on sod.SalesOrderID = soh.SalesOrderID 

--where p.Color = 'Red' --filter before grouping
--	-- and count(*) >=2000 -- where where aggregated count > 200,000. group by comes first so we cannot filter on what hasnt been grouped yet

--group by
--	p.ProductNumber 
--having count(*) >= 2000 -- having allows to circumvent the problem. No Salecount as select salecount is the last step. 

--select 
--	color
--	,count(*)
--from Production.Product
--group by
--	color
/*
NULL	247
Black	93
Blue	26
Green	1
Grey	1
Multi	8
Red	38
Silver	43
Silver/Black	7
White	4
Yellow	36
*/	

-- count(*) counts the rows based on what we hav egot in the color
select 
	color
	,count(color)
from Production.Product
group by
	color
-- 0 NULL because it is not a value. count(color) counts columns
/*NULL	0
Black	93
Blue	26
Green	1
Grey	1
Multi	8
Red	38
Silver	43
Silver/Black	7
White	4
Yellow	36*/

/*Window functions where we do not use group by at all but can still have aggregates. It just partitions the rows by columns over this following group*/

select
	color
	,name
	,ProductNumber
	,Weight
	,count(*) over (partition by color) CountByColor
	,count(*) over (partition by [Weight]) CountByWeight

from production.product
where weight is not null
order by CountByWeight desc


--LAG: looking at previous rows

--LEAD:looking at following rows

--Lag and Lead: 
select 
	[SalesOrderID]
	,[SalesOrderDetailID]
	,lead([SalesOrderDetailID]) over (partition by [SalesOrderID]order by [SalesOrderDetailID] asc) --look on the next rows based on the partition created 
	,[ProductID]
	,[LineTotal]
from [Sales].[SalesOrderDetail] -- ex. salesorderID is the same for the first 12 rows, so this person bought 12 itmes. 
order by 1,2 
/*43659	1	776	2024.994000
43659	2	777	6074.982000
43659	3	778	2024.994000
43659	4	771	2039.994000
43659	5	772	2039.994000
43659	6	773	4079.988000
43659	7	774	2039.994000
43659	8	714	86.521200
43659	9	716	28.840400
43659	10	709	34.200000
43659	11	712	10.373000
43659	12	711	80.746000
43660	13	762	419.458900*/


--lag
select 
	[SalesOrderID]
	,[SalesOrderDetailID]
	,lead([SalesOrderDetailID]) over (partition by [SalesOrderID]order by [SalesOrderDetailID] asc) lead --look on the next rows based on the partition created 
	,lag([SalesOrderDetailID]) over (partition by [SalesOrderID]order by [SalesOrderDetailID] asc) lag
	,first_value([SalesOrderDetailID]) over (partition by [SalesOrderID]order by [SalesOrderDetailID] asc) first_value -- 12 entries for the first in that window
	,last_value([SalesOrderDetailID]) over (partition by [SalesOrderID]order by [SalesOrderDetailID] asc rows between unbounded preceding and unbounded following) last_value -- 
	,[ProductID]
	[LineTotal]
from [Sales].[SalesOrderDetail] -- ex. salesorderID is the same for the first 12 rows, so this person bought 12 itmes. 
order by 1,2 











