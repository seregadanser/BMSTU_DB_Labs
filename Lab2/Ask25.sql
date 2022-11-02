use Lab1 
go

with DF(avgy, countt, Co) as
(
select AVG(YearProfit) over (partition by Organisation.NameO) as avgy,ROW_NUMBER() 
over(partition by Country order by  Organisation.NameO) as countt  ,Country from Organisation
)
select * from DF
where countt = 1