USE master
GO
if exists (select name from sys.databases where name = N'Lab1') 
	drop database Lab1

create database Lab1
GO

USE Lab1
GO

if object_id('ConnectTable') is not null
	drop table ConnectTable
GO
create table ConnectTable
(
    IdUser int,
	IdSite int,
	IdServer int,
	actualyflag int,
	dateof date,
    Id int not null identity
);
GO

if object_id('Serverr') is not null
	drop table Serverr
GO
create table Serverr
(
    ComputerId int,
	ValueOfComputers int,
	DatacenterId int,
	OrganisationId int,
	ServerName varchar(100),
	Bandwidth int,
    Id int not null identity
);
GO


if object_id('Organisation') is not null
	drop table Organisation
GO
create table Organisation
(
    NameO  varchar(100) NOT NULL, 
    Country varchar(100) NOT NULL,
    Inn bigint,
    YearProfit int, 
   -- Specialisation varchar(100),
    Id int not null identity
);
GO

if object_id('Computer') is not null
	drop table Computer
GO
create table Computer
(
    MemoryValue int,
	Furency int,
	CoolType varchar(100),
	NumberOfCores int,
    Id int not null identity
);
GO

if object_id('DataCenter') is not null
	drop table DataCenter
GO
create table DataCenter
(
    CompanyName varchar(100),
	LocationCountry varchar(100),
	Size int,
	CostofUsage int,
    Id int not null identity
);
GO

if object_id('Sitee') is not null
	drop table Sitee
GO
create table Sitee
(
    SiteName varchar(100),
	Theme varchar(100),
	PlatformWork varchar(100),
	NumberOfUsers int,
	Ref int,
    Id int not null identity
);
GO

if object_id('Persons') is not null
	drop table Persons
GO
create table Persons
(
    FirstName varchar(100),
	SecondName varchar(100),
	Proffesion varchar(100),
	DateOfBD DATE,
    Id int not null identity
);
GO


