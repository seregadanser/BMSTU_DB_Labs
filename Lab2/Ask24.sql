use Lab1 
go

select AVG(YearProfit) over (partition by Organisation.NameO) as 'avgy', Country from Organisation
	where Country = 'Poland'
