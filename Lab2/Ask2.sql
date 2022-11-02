use Lab1 
go

select distinct NumberOfCores, MemoryValue from Computer
	where MemoryValue between  10000 and 20000
go