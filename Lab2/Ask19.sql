use Lab1
go

update Organisation
set YearProfit = (select min(Organisation.YearProfit) from Organisation where Organisation.Country = 'Ukraine')
where Organisation.Country = 'Poland'
go

select * from Organisation