use AdventureWorks2014
go
select
	[BusinessEntityID]
	,[EmailAddressID]
	--,reverse(substring(reverse(CHARINDEX('@',[EmailAddress],'@')),1,20)) as Start
	,[EmailAddress]
	,CHARINDEX('@',[EmailAddress])
    ,substring([EmailAddress],CHARINDEX('@',[EmailAddress])+1,len(EmailAddress)) as [End]
	,substring([EmailAddress],1,CHARINDEX('@',[EmailAddress])-1) mailbox
	,len(substring([EmailAddress],CHARINDEX('@',[EmailAddress])+1,len(EmailAddress)))
	,datalength(substring([EmailAddress],CHARINDEX('@',[EmailAddress])+1,len(EmailAddress)))
	from [Person].[EmailAddress]