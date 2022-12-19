use testDB
go

create table Emploee
(
id int, 
FIO varchar(100),
statuss varchar(100),
date_of_status date
)

insert into Emploee values
(1, 'Ivanov', 'offline', '12-12-2022'),
(1, 'Ivanov', 'offline', '13-12-2022'),
(1, 'Ivanov', 'ill', '14-12-2022'),
(1, 'Ivanov', 'ill', '15-12-2022'),
(1, 'Ivanov', 'outsource', '16-12-2022'),
(1, 'Ivanov', 'outsource', '19-12-2022'),
(1, 'Ivanov', 'outsource', '20-12-2022'),
(2, 'Petrov', 'offline', '12-12-2022'),
(2, 'Petrov', 'offline', '13-12-2022'),
(2, 'Petrov', 'outsource', '14-12-2022'),
(2, 'Petrov', 'outsource', '15-12-2022'),
(2,'Petrov', 'offline', '16-12-2022'),
(2,'Petrov', 'offline', '20-12-2022')

select * from Emploee

Create Table #SeriesGenerate(dt date, FIO varchar(100),statuss varchar(100), id int)
GO

declare @max date
 select @max = MAX(date_of_status) from Emploee group by date_of_status
 select @max
 declare @min date
 select @min = MIN(date_of_status)from Emploee group by date_of_status order by date_of_status DESC
 select @min


While (@min <= @max)
BEGIN
Insert into #SeriesGenerate values (@min, 'Petrov','offline', 2)
Insert into #SeriesGenerate values (@min, 'Ivanov', 'outsource',1)
set @min = DATEADD(DAY, 1, @min)
END

Create Table #t2(date_of_status date, statuss varchar(100), id int,FIO varchar(100))
GO
insert into #t2 Select a.dt as date_of_status, b.statuss, a.id,a.FIO
from #SeriesGenerate a LEFT OUTER JOIN Emploee b
    on a.dt = b.date_of_status and a.id = b.id  order by a.id,a.dt

select * from #t2 order by id,date_of_status

update #t2
set statuss = 'outsource' where statuss is NULL and id = 1
update #t2
set statuss = 'offline' where statuss is NULL and id = 2

--create table #t3(id int, FIO varchar(100),statuss varchar(100), date_of_status date, rn int) 
--insert into #t3 select * ,  ROW_NUMBER() over (order by id, date_of_status) as rn from Emploee



select 
id,  MIN(date_of_status) as minDate, MAX(date_of_status) as maxDate ,statuss, FIO
 from
(
  select 
   id,FIO,date_of_status,statuss,DATEADD(DAY,-Number,date_of_status) as NumGroup 
  from
   (
    select id, FIO,statuss,ROW_NUMBER() over (order by id)Number, date_of_status
  
   from
    ( 
   -- select * from Emploee group by id, FIO, statuss, date_of_status
--select * ,datediff(DAY, d1.date_of_status, d2.date_of_status) as ss from #t3 d1
--join #t3 d2 on d1.rn=d2.rn-1
 select * from #t2 group by id, FIO, statuss, date_of_status
    )A
  )B
)D group by NumGroup, id, FIO, statuss order by id
  



-- drop table #t3








drop table  #SeriesGenerate
drop table   #t2
drop table Emploee
go