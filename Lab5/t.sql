DECLARE @myDoc XML  
SET @myDoc = '<Lab1.dbo.Computer MemoryValue="35693"
 Furency="2" CoolType="fan"
  NumberOfCores="2" 
  Id="1"/>
  <Lab1.dbo.Computer MemoryValue="25986"
   Furency="6" CoolType="fan" NumberOfCores="8"
    Id="2"/><Lab1.dbo.Computer MemoryValue="69577" 
    Furency="4" CoolType="water" NumberOfCores="2"
     Id="3"/>'  
SELECT @myDoc  
  
SET @myDoc.modify('  
  replace value of (/Lab1.dbo.Computer/@NumberOfCores)[1]
  with (  
       if (/Lab1.dbo.Computer/@CoolType = "fan") then  
         "null"  
        else
            "null"
      )  
')  
SELECT @myDoc  
DECLARE @f BIT;
SET @f = @myDoc.exist('/Lab1.dbo.Computer[(@CoolType)[1] eq "fan" ]')  
SELECT @f;  