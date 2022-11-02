use Lab1
go
select Country, YearProfit from Organisation
	where YearProfit > 1000 and  Country = 'Russia'
order by YearProfit
go