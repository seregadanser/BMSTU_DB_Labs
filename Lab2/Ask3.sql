use Lab1
go

select distinct PlatformWork, SiteName, ConnectTable.IdServer from Sitee
join ConnectTable on ConnectTable.IdSite = Sitee.Id
	where SiteName like '%.org%'
go