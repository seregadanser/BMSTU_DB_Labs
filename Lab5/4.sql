EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE

use Lab1
go

EXEC xp_cmdshell 'bcp "SELECT * FROM [Lab1].[dbo].[Computer] FOR XML Auto" queryout "D:\Study\DataBase\Lab5\t2.xml" -T -c -r'

DECLARE @XmlFile XML
SELECT @XmlFile = BulkColumn
FROM  OPENROWSET(bulk 'D:\Study\DataBase\Lab5\t2.xml',  SINGLE_BLOB) as x;

select @XmlFile
select xxm.query('..') as result
from @XmlFile.nodes('Lab1.dbo.Computer') as XTbl(xxm)

select @XmlFile
select Mem = xxm.value('@MemoryValue', 'int'), Fu = xxm.value('@Furency', 'int'),
Co = xxm.value('@CoolType', 'varchar(100)'), Nu = xxm.value('@NumberOfCores', 'int')
from @XmlFile.nodes('Lab1.dbo.Computer') as XTbl(xxm)

select Mem = xxm.value('@MemoryValue', 'int'), Fu = xxm.value('@Furency', 'int'),
Co = xxm.value('@CoolType', 'varchar(100)'), Nu = xxm.value('@NumberOfCores', 'int')
from @XmlFile.nodes('Lab1.dbo.Computer') as XTbl(xxm) where xxm.value('@NumberOfCores', 'int') = 1

SET @XmlFile.modify('  
  replace value of (/Lab1.dbo.Computer/@NumberOfCores)[1]
  with (  
       if (/Lab1.dbo.Computer/@CoolType = "fan") then  
         "null"  
        else
         "null"
      )  
')  
SELECT @XmlFile



