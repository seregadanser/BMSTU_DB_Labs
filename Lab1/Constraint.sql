use Lab1
go

alter table Computer add
primary key(Id),
check (NumberOfCores > 0 and  NumberOfCores < 10)
go

alter table Organisation add
primary key(Id),
unique(Inn)
go

alter table  DataCenter add
primary key(Id)
go

alter table Sitee add
primary key(Id),
foreign key(Ref) references Sitee(Id) 
go

alter table Persons add
primary key(Id)
go


alter table Serverr add
primary key(Id),
foreign key(ComputerId) references  Computer (Id) on delete cascade,
foreign key(DatacenterId) references  DataCenter (Id) on delete cascade,
foreign key(OrganisationId) references  Organisation (Id) on delete cascade
go

alter table ConnectTable add
primary key(Id),
foreign key(IdUser) references  Persons (Id) on delete cascade,
foreign key(IdSite) references  Sitee (Id) on delete cascade,
foreign key(IdServer) references  Serverr (Id) on delete cascade
go

