--select 
--	[BusinessEntityID]
--	,[FirstName]
--	,[LastName]

--from [Person].[Person] -- 19,972
--union all
--select 
--	ProductID
--	, Name
--	,ProductNumber
--from Production.Product --504


--select 'A' as col1

--union select 'A' as col1 -- 1 row as it is a duplicate

--select 'A' as col1

--union all select 'A' as col1 --2 rows, as duplicates are not removed 


--select 
--	Name
--	, ListPrice
--	, Name +' '+ cast(ListPrice as varchar(max)) -- make them both strings in order to concatenate them (20); maximum number of characters allowed
--	,case	
--		when cast(ListPrice as int) = 0 then 'FREE!' -- to round the number and compare as an integer
--		when ListPrice between 0 and 10 then 'Cheap'
--		when ListPrice between 10 and 200 then 'Quite Pricey'
--		when ListPrice > 200 then 'You''re Joking right?' -- '' to make an apostophe appear only once
--		else 'Unexpected'
--	end PriceDescription
--from Production.Product


-- select 'Manuel' + 'Steiner'  -- it is concatenating 

select FirstName
	 ,MiddleName
	 ,LastName
	 ,FirstName+' '+ISNULL(MiddleName,'')+ case when MiddleName is not null then ' ' else '' end +LastName -- remove the double space between first and last name if no middl ename 

from Person.Person


select 
	middlename
	,isnull(nullif(middlename,'B'),'BADNAME') -- turn a NULL into BADNAME. NULL column cannot match with equals, so it has to be replaced with another 
											-- name if we want to join columns that contain names. Do that if there is null
from person.person