use Lab1
go

with PowServ(NumberofComp, Bandwidth, numberofcores)
as( select Serverr.ValueOfComputers, Serverr.Bandwidth, Computer.NumberOfCores from Serverr join Computer 
on Serverr.ComputerId = Computer.Id 
where ValueOfComputers > 70)
select numberofcores from PowServ 