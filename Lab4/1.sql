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

CREATE ASSEMBLY [Scalar]
FROM 'D:/Labs/DataBase/Lab4/Scalar.dll'
GO

CREATE FUNCTION GetRandomNumber ()
RETURNS INT
AS
EXTERNAL NAME
Scalar.[Scalar].GetRandomNumber
GO

SELECT dbo.GetRandomNumber() AS RandomNumber
GO


DROP FUNCTION GetRandomNumber

DROP ASSEMBLY Scalar