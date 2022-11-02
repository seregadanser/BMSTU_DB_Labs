use Lab1
go

select CompanyName, CV.ServerName from DataCenter 
join 
( 
select ComputerId, Bandwidth, DatacenterId, ServerName from Serverr join  Organisation 
on Serverr.OrganisationId = Organisation.Id 
) as CV on CV.DatacenterId = DataCenter.Id
order by CompanyName
