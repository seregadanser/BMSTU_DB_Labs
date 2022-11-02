
select Computer.MemoryValue, Computer.Id, Serverr.ServerName,Serverr.ValueOfComputers,Serverr.ComputerId 
from Computer join Serverr on  Serverr.ComputerId = Computer.Id
	where Computer.Id in (select Computer.Id from Computer right outer join Serverr 
			on Serverr.ComputerId = Computer.Id where Serverr.ValueOfComputers>12 )
order by Computer.Id
go