--if not exists(select * from sys.columns where OBJECT_ID = object_id( N'ConnectTable') and name = N'actualyflag')
--begin
--alter table ConnectTable add
--actualyflag varchar(50)
--end

--if not exists(select * from sys.columns where OBJECT_ID = object_id( N'ConnectTable') and name = N'dateof')
--begin
--alter table ConnectTable add
--dateof varchar(50)
--end

BULK INSERT Lab1.dbo.Computer
FROM 'D:\Labs\DataBase\Lab1\Generator\Computer.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.DataCenter
FROM 'D:\Labs\DataBase\Lab1\Generator\DataServer.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.Organisation
FROM 'D:\Labs\DataBase\Lab1\Generator\Company.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.Serverr
FROM 'D:\Labs\DataBase\Lab1\Generator\Server.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.Sitee
FROM 'D:\Labs\DataBase\Lab1\Generator\Site.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.Persons
FROM 'D:\Labs\DataBase\Lab1\Generator\People.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
go

BULK INSERT Lab1.dbo.ConnectTable
FROM 'D:\Labs\DataBase\Lab1\Generator\ConnectTable.csv'
WITH (DATAFILETYPE = 'char', FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a');
GO 
