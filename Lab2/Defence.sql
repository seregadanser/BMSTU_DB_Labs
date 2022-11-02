--максимальное количество организаций которые арендуют сервер на одном компе

with MaxVal(CompId, Valuee) as
(
select Serverr.ComputerId, COUNT(Serverr.OrganisationId) as Valuee from Serverr
group by Serverr.ComputerId)

select Max(MaxVal.Valuee) as Maxx from MaxVal 





