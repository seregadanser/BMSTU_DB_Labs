use Lab1
go

select Organisation.Country , MAX(Organisation.YearProfit) as 'maxval', AVG(Organisation.YearProfit) 
as 'avgvalue', MIN(Organisation.YearProfit) as 'minval' from Organisation
group by Country for xml raw

