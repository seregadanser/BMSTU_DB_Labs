use Lab1
go

select NameO, Inn, YearProfit from Organisation
where YearProfit > all(
select YearProfit  from Organisation where Country = 'Latvia'
)
go