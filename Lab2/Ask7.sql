use Lab1
go

select AVG(YearProfit) as 'avgy', Country from Organisation
	where Country = 'Latvia'
group by Country
union 
select AVG(YearProfit) as 'avgy', Country from Organisation
	where Country = 'Ukraine'
group by Country
go