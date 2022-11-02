use Lab1
go

select Organisation.Country, AVG(Organisation.YearProfit) from Organisation
group by Country
having  AVG(Organisation.YearProfit) > (
select avg(DataCenter.CostofUsage) from DataCenter where DataCenter.LocationCountry = Organisation.Country
)
go