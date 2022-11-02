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

CREATE ASSEMBLY [Len]
FROM 'D:/Labs/DataBase/Lab4/Len.dll'
GO

CREATE FUNCTION StrLen ( @InputName NVARCHAR(4000) )
RETURNS TABLE 
(
   word NVARCHAR(4000), 
   leng INT
)
AS
EXTERNAL NAME
[Len].[Len].[StrLen]
GO

SELECT * FROM dbo.StrLen ('Hello')
GO

DROP FUNCTION StrLen

DROP ASSEMBLY Len