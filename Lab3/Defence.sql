USE Lab1
GO

IF OBJECT_ID ( N'dbo.work') IS NOT NULL
      DROP PROCEDURE dbo.work
GO

CREATE PROCEDURE dbo.work @sid int
AS
begin
	select Organisation.NameO, Organisation.Country from Serverr join Organisation on
	Serverr.OrganisationId = Organisation.Id where Serverr.DatacenterId = @sid
end;
GO

EXEC dbo.work @sid = 5