use Lab1
go

select Computer.Id, Serverr.Id from Computer join Serverr on Serverr.ComputerId = Computer.Id 
	where exists
	(
		select Computer.Id from Computer right outer join Serverr 
			on Serverr.ComputerId = Computer.Id where Serverr.ValueOfComputers>12 
	)
order by Computer.Id
go