
--RANK:entry for 1,2,2,2,5: gives the joint position and the position in the scheme 
--DENSE RANK: entry for 1,2,2,3,4,: gives the joint position 
--ROWNUMBER:unique for the whole dataset
--NTILE: Distribue les lignes d'une partition triée dans un nombre spécifié de groupes. 
-- Les groupes sont numérotés à partir de un. Pour chaque ligne, NTILE retourne le numéro du groupe auquel la ligne appartient.

-- goal: rank these products by color, ranked by price.

select 
	name
	,isnull(color,'NA') -- replace null by NA
	,listprice
	,rank() over (partition by [color] order by [listprice] asc) rnk--rank() always
	,row_number() over (partition by [color] order by [listprice] asc) rown--rank() always
	,dense_rank () over (partition by [color] order by [listprice] asc) dense_rank--rank() always
	,ntile(10) over (order by [listprice] asc) ntilee -- split the x rows into y clusters. total number of rows divided by 10
from production.product