use Lab1
go

select SiteName, Theme 
into #SitesThems
from Sitee
go

select * from #SitesThems
