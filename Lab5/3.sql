use Lab1
go
if object_id('LT') is not null
	drop table LT
GO
create table LT
(
    val1 int,
	val2 xml,
	Id int not null identity
);
GO

insert into LT values (1, '<Lab1.dbo.Computer MemoryValue="35693" Furency="2" CoolType="fan" NumberOfCores="2" Id="1"/>'),
(4, '<Lab1.dbo.Computer MemoryValue="35693" Furency="2" CoolType="fan" NumberOfCores="2" Id="1"/>');

select * from LT

drop table LT
go