USE Lab1
GO

IF OBJECT_ID ( N'dbo.SelectC', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.SelectC
GO
CREATE PROCEDURE dbo.SelectC @Theme nvarchar(30)
AS
BEGIN
SELECT * FROM Sitee WHERE Theme = @Theme
END;
GO

EXEC  dbo.SelectC  @Theme = "Games";