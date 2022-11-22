use Lab1
go

select * from Computer where Computer.NumberOfCores = 1 
for xml raw

select * from Computer where Computer.NumberOfCores = 1 
for xml auto, elements

  select 1 as tag, 0 as parent,
    Computer.CoolType as'computers!1!Cool',Computer.NumberOfCores as'computers!1!Number', 
	Computer.MemoryValue as'computers!1!Mem!element'
from Computer where Computer.NumberOfCores = 1 for xml explicit

select * from Computer where Computer.NumberOfCores = 1 
for xml path