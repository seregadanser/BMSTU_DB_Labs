use Lab1
go

update Computer
set NumberOfCores  = NumberOfCores +1
where CoolType = 'Oil'
go