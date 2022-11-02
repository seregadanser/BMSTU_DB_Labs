use Lab1
go

select LocationCountry, CompanyName, 
case 
when CostofUsage < 500 then 'cheap'
when CostofUsage < 800 then 'normal'
else 'expensive' end as 'soder'
from DataCenter
go
