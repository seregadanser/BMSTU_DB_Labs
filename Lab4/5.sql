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

CREATE ASSEMBLY [Trigger]
FROM 'D:/Study/DataBase/Lab4/Trigger.dll'
GO


CREATE TRIGGER SafeTr
ON DataCenter
INSTEAD OF DELETE
AS
EXTERNAL NAME
[Trigger].[Triggers].SafeTrigger
GO

DELETE DataCenter
WHERE ID = 1
GO

DROP TRIGGER SafeTr

DROP ASSEMBLY [Trigger]