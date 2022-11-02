
use Lab1
go

alter table Sitee add
Ref int null
foreign key(Ref) references Sitee(Id) 
go

update Sitee
set Ref =  (case Id 
when 1 then null
when 2 then 5
when 3 then 8
when 4 then 1
when 5 then 3
when 6 then 9
when 7 then 4
when 8 then 7
when 9 then 2
when 10 then 8
end
)
select * from Sitee
go

with ST(siteN, siteID, Ref, RefLevel) as
(
 select Sitee.SiteName, Sitee.Id, Sitee.Ref, 0 as RefLevel from Sitee
 where Sitee.Ref is null
 union all
  select s.SiteName, s.Id, s.Ref,  RefLevel+1 from Sitee as s
  inner join ST as d on s.Ref = d.siteID
)
select * from ST order by siteID
go


alter table Sitee 
drop FK__Sitee__Ref__3A81B327
alter table Sitee 
drop column Ref
go
