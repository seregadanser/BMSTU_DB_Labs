USE Lab1
GO
IF OBJECT_ID (N'dbo.FromQueenstown', N'FN') IS NOT NULL
    DROP FUNCTION dbo.FPC
GO

CREATE FUNCTION dbo.FPC()
RETURNS @FivePC TABLE 
(
    Mem int, 
	Cool varchar(100), 
	Num int, 
	Furency int
)
AS
BEGIN
    INSERT INTO @FivePC
    SELECT Computer.MemoryValue, Computer.CoolType, Computer.NumberOfCores, Computer.Furency
    FROM Computer JOIN Serverr on Serverr.ComputerId = Computer.Id
    WHERE Serverr.ValueOfComputers > 5
RETURN
END
GO


SELECT *
FROM dbo.FPC()