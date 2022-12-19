use testDB
go

create table table1(
id int, 
var1 varchar(100),
valid_from_dttm date,
valid_to_dttm date
)

create table table2(
id int, 
var2 varchar(100),
valid_from_dttm date,
valid_to_dttm date
)

insert into table1 values
(1, 'A', '2018-09-01', '2018-09-15'),
(1, 'B', '2018-09-16', '5999-12-31')

insert into table2 values
(1, 'A', '2018-09-01', '2018-09-18'),
(1, 'B', '2018-09-19', '5999-12-31')


--select * from table1
--select * from table2
go
with ranges as (
  select df.id,valid_from_dttm as date_from, MIN(valid_to_dttm) as date_to
  from 
	  (
		select id, valid_from_dttm from table1
		union
		select id, valid_from_dttm from table2
	  ) df
  join 
      (
		select id, valid_to_dttm from table1
		union
		select id, valid_to_dttm from table2
	  ) dt  
  on dt.id = df.id AND dt.valid_to_dttm > df.valid_from_dttm
  group by df.id, valid_from_dttm
)
select r.id, t1.var1, t2.var2, r.date_from, r.date_to
from ranges r
left join table1 t1 on t1.id = r.id and t1.valid_from_dttm <= r.date_to and t1.valid_to_dttm >= r.date_from
left join table2 t2 on t2.id = r.id and t2.valid_from_dttm <= r.date_to and t2.valid_to_dttm >= r.date_from
order by r.id, r.date_from

--select df.id,df.var1, MIN(dt.var1) as var2, valid_from_dttm as date_from, MIN(valid_to_dttm) as date_to
--from 
--	  (
--		select id,var1, valid_from_dttm from table1
--		union
--		select id,var2, valid_from_dttm from table2
--	  ) df
--  join 
--      (
--		select id,var1, valid_to_dttm from table1
--		union
--		select id,var2, valid_to_dttm from table2
--	  ) dt  
--  on dt.id = df.id AND dt.valid_to_dttm > df.valid_from_dttm
--  group by valid_from_dttm, df.id,  df.var1

drop table table1
drop table table2