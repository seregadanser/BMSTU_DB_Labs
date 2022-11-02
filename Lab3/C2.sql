USE Lab1
GO
create table #timetable1
(
id int
);
go

IF OBJECT_ID ( N'dbo.iod') IS NOT NULL
      	DROP TRIGGER  dbo.iod
GO

CREATE TRIGGER dbo.iod
ON Persons
INSTEAD OF DELETE
AS
begin
select * from deleted
insert #timetable1 values((SELECT MAX(Id) FROM deleted))
end;
go

delete from Persons where FirstName = N'Mike' 
go

 select * from #timetable1

 drop table #timetable1