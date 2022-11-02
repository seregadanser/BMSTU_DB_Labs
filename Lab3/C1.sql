USE Lab1
GO

create table #timetable1
(
id int
);
go

IF OBJECT_ID ( N'dbo.aiu') IS NOT NULL
      	DROP TRIGGER dbo.aiu
GO

CREATE TRIGGER dbo.aiu
ON Persons
AFTER INSERT, UPDATE
AS
begin
select * from inserted
insert #timetable1 values((SELECT MAX(Id) FROM inserted))
end;
go

update Persons 
set FirstName = 'Mike' where FirstName = 'Adam'
go

 select * from #timetable1

 drop table #timetable1