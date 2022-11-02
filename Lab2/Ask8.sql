use Lab1
go

select ServerName, Bandwidth, 
(select CompanyName from DataCenter 
where Serverr.DatacenterId = DataCenter.Id) as Ownerr
from Serverr
go