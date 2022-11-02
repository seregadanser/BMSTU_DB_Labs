use Lab1
go

select ConnectTable.IdSite , Sitee.SiteName from ConnectTable join Sitee on Sitee.Id = ConnectTable.IdSite
where ConnectTable.IdServer in (select Serverr.Id from Serverr 
		where Serverr.DatacenterId in (select DataCenter.Id from DataCenter where DataCenter.CostofUsage> 700) )
