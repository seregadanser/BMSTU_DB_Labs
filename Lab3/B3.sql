create table #timetable
(
 NameO  varchar(100) NOT NULL, 
 Country varchar(100) NOT NULL,
 ServerName varchar(100),
 Id int
);
go

USE Lab1
GO

IF OBJECT_ID ( N'dbo.ins', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.ins
GO
IF OBJECT_ID ( N'dbo.inser', 'P' ) IS NOT NULL
      DROP PROCEDURE dbo.inser
GO

 CREATE PROCEDURE dbo.inser @NameOO varchar(100), @Country varchar(100),  @ServerName varchar(100), @id int
   AS
   BEGIN
    INSERT INTO #timetable (NameO, Country, ServerName, Id) 
       VALUES (@NameOO, @Country,  @ServerName, @id)
   END
GO

CREATE PROCEDURE dbo.ins
   AS
  
   --объявляем переменные
   DECLARE @NameO  varchar(100)
   DECLARE @Country varchar(100)
   DECLARE @ServerName varchar(100)
   DECLARE @Id int
   
   --объявляем курсор
   DECLARE my_cur CURSOR FOR 
     SELECT Organisation.NameO, Organisation.Country, Serverr.ServerName, Organisation.Id
     FROM Serverr join Organisation on Serverr.OrganisationId = Organisation.Id
   
   --открываем курсор
   OPEN my_cur
   --считываем данные первой строки в наши переменные
   FETCH NEXT FROM my_cur INTO @NameO, @Country, @ServerName,  @Id
   --если данные в курсоре есть, то заходим в цикл
   --и крутимся там до тех пор, пока не закончатся строки в курсоре
   WHILE @@FETCH_STATUS = 0
   BEGIN
        --на каждую итерацию цикла запускаем нашу основную процедуру с нужными параметрами   
        exec dbo.inser @NameO, @Country, @ServerName, @Id
        --считываем следующую строку курсора
          FETCH NEXT FROM my_cur INTO @NameO, @Country, @ServerName,  @Id
   END
   
   --закрываем курсор
   CLOSE my_cur
   DEALLOCATE my_cur
   GO


   EXEC dbo.ins

   select * from #timetable

   drop table #timetable