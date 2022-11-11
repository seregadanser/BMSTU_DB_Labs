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

CREATE ASSEMBLY [Agregate]
FROM 'D:/Study/DataBase/Lab4/Agregate.dll'
GO


CREATE AGGREGATE MyAgg (@input nvarchar(200)) RETURNS nvarchar(max)  
EXTERNAL NAME Agregate.Concatenate; 
GO

SELECT LocationCountry, dbo.MyAgg(CompanyName)  
FROM DataCenter  
GROUP BY LocationCountry;  

DROP AGGREGATE MyAgg

DROP ASSEMBLY Agregate