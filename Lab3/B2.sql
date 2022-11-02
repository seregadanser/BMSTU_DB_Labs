USE Lab1
GO

IF OBJECT_ID ( N'dbo.SiteRef') IS NOT NULL
      DROP PROCEDURE dbo.SiteRef
GO

CREATE PROCEDURE dbo.SiteRef @StartS int, @RecDeep int
AS
   if @RecDeep > 0 begin
		select Sitee.SiteName, Sitee.Theme, Sitee.NumberOfUsers from
		Sitee where Sitee.Id = @StartS;
		declare @r int;
		set @r = (select MAX(Sitee.Ref) from Sitee where Sitee.Id = @StartS);
		declare @r1 int;
		set @r1 =  @RecDeep - 1;
		EXEC dbo.SiteRef @StartS = @r, @RecDeep = @r1;
   end;
GO

EXEC dbo.SiteRef @StartS = 5, @RecDeep = 3;