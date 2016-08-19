declare @haystack varchar(100) ='kubrick-group--training-course'
select @haystack 
select replace(replace(@haystack,'-',' '),'i','I')
select stuff(@haystack,1,7,' ')-- stuffing charcters in place of what was there before. Between one and seven, kubrick is replaced by a space