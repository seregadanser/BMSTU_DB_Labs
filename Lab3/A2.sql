USE Lab1
GO
IF OBJECT_ID (N'dbo.Survival', N'FN') IS NOT NULL
    DROP FUNCTION dbo.Sites
GO

CREATE FUNCTION dbo.Sites()
RETURNS TABLE
AS
RETURN (
    SELECT Id, SiteName, PlatformWork from Sitee 
	where Sitee.Theme = 'Games'
    )
GO


SELECT *
FROM dbo.Sites()
GO