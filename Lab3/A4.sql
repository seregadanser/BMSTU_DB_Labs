USE Lab1
GO
IF OBJECT_ID (N'dbo.gcb') IS NOT NULL
    DROP FUNCTION dbo.gcb
GO
CREATE FUNCTION dbo.gcb(@a int, @b int)
RETURNS int
as 
begin
declare @r int
if @b = 0
	set @r = @a
else 
set @r = dbo.gcb(@b, @a%@b)
return @r
end
go

select dbo.gcb(1260,3400)