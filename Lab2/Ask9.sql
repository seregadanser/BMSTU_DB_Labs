use Lab1
go

select case(LocationCountry) 
	when 'Ukraine' then 'Near'
	when 'Latvia' then 'nearest'
	when 'USA' then 'far'
	when 'German' then 'Europe'
	end as 'fareles', Serverr.ServerName 
	from DataCenter join Serverr on Serverr.DatacenterId = DataCenter.Id
	where DataCenter.LocationCountry = 'German' or DataCenter.LocationCountry = 'Ukraine'
	go