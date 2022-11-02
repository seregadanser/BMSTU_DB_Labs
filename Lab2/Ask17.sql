use Lab1
go

insert into Serverr(ComputerId, ValueOfComputers, DatacenterId, OrganisationId, ServerName, Bandwidth)
select Computer.Id, 8, 5, 3, 'll', 9875 from Computer
where Computer.CoolType = 'Fan'

select * from Serverr