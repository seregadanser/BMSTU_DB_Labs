use Lab1
go
IF OBJECT_ID (N'dbo.MaxCost', N'FN') IS NOT NULL
    DROP FUNCTION dbo.MaxCost
GO
CREATE FUNCTION dbo.MaxCost()
RETURNS int
AS
BEGIN
       RETURN (SELECT MAX(CostofUsage) FROM dbo.DataCenter)
END
GO

SELECT dbo.MaxCost()

