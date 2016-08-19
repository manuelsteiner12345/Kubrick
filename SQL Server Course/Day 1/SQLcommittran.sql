select 
	 * 
from [Production].[Product]
where ProductID = 1
begin tran


update [Production].[Product]
set Color = 'Green'
where ProductID =1

-- commit tran (forgot to commit) the row is locked, nobody can see it before it is commit . 
-- no color because it has not committed. 

-- to check if no errors, then commit

commit tran