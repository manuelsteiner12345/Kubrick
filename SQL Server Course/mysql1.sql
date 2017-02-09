-- show databases;
use world;
-- show tables;
-- select * from city;
-- select * from country limit 5,10;

-- which city has the highest population in % for all countries

select 
	ci.Name
    ,co.Name
    ,(ci.population/co.population)*100 pop
from city ci
inner join country co
on ci.CountryCode = co.Code
order by pop desc;
