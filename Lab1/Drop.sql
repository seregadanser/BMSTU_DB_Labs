use Lab1
go

if object_id('ConnectTable') is not null
	drop table ConnectTable
go

if object_id('Serverr') is not null
	drop table Serverr
go

if object_id('Organisation') is not null
	drop table Organisation
go
if object_id('Computer') is not null
	drop table Computer
go
if object_id('DataCenter') is not null
	drop table DataCenter
go

if object_id('Sitee') is not null
	drop table Sitee
go
if object_id('Persons') is not null
	drop table Persons
go

use master 
drop database Lab1