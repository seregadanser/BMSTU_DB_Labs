IF OBJECT_ID ( N'dbo.ScalarFunc' ) IS NOT NULL
      DROP PROCEDURE dbo.ScalarFunc
GO
CREATE PROCEDURE ScalarFunc @nam varchar(100) AS 
BEGIN

BEGIN

		SELECT name, system_type_id
		FROM sys.columns
        WHERE table_name = name_

END;
GO

EXECUTE ScalarFunc @nam = 'w';

select * from sys.all_columns where name = 'Inn'

select * from INFORMATION_SCHEMA.COLUMNS