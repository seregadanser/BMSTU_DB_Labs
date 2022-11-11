sp_configure 'show advanced options', 1
GO
RECONFIGURE
GO
sp_configure 'clr enabled', 1
GO
RECONFIGURE
GO
sp_configure 'clr strict security', 0
GO
RECONFIGURE
GO

use Lab1
go

create table Serverr1
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

INSERT INTO Serverr1
VALUES (3, 3, 4, 5, 'aa', 89),
        (4, 1, 4, 5, 'aa2', 89),
		(5, 5, 4, 5, 'a1a', 89)
 
SELECT * FROM Serverr1

CREATE ASSEMBLY [Defence]
FROM 'D:/Study/DataBase/Lab4/Defence.dll'
GO


CREATE TRIGGER SafeTr
ON Serverr1
INSTEAD OF DELETE
AS
EXTERNAL NAME
[Defence].[Triggers].SafeTrigger
GO

DELETE Serverr1
WHERE ID = 1
GO

drop table Serverr1
go

DROP TRIGGER SafeTr

DROP ASSEMBLY [Defence]