EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE

use Lab1
go

EXEC xp_cmdshell 'bcp "SELECT * FROM [Lab1].[dbo].[Computer] FOR XML Auto" queryout "D:\Study\DataBase\Lab5\t2.xml" -T -c -r'

DECLARE @XmlFile XML
SELECT @XmlFile = BulkColumn
FROM  OPENROWSET(bulk 'D:\Labs\DataBase\Lab5\t2.xml',  SINGLE_BLOB) as x;


select Mem = xxm.value('@MemoryValue', 'int'), Fu = xxm.value('@Furency', 'int'),
Co = xxm.value('@CoolType', 'varchar(100)'), Nu = xxm.value('@NumberOfCores', 'int')
from @XmlFile.nodes('Lab1.dbo.Computer') as XTbl(xxm)

select Mem = xxm.value('@MemoryValue', 'int'), Fu = xxm.value('@Furency', 'int'),
Co = xxm.value('@CoolType', 'varchar(100)'), Nu = xxm.value('@NumberOfCores', 'int')
from @XmlFile.nodes('Lab1.dbo.Computer') as XTbl(xxm) where xxm.value('@NumberOfCores', 'int') = 1

