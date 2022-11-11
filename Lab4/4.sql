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

CREATE ASSEMBLY [Proc]
FROM 'D:/Study/DataBase/Lab4/Proc.dll'
GO

Create Procedure Sel
As
External Name
[Proc].[StoredProcedures].Sel
GO

EXEC Sel
GO

DROP Procedure Sel

DROP ASSEMBLY [Proc]