use Lab1
go

delete from Computer
where Computer.Id in (select Serverr.ComputerId from Serverr where ValueOfComputers < 30)