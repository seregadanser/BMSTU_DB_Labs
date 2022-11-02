cd Generator
Gen.py
cd ..
sqlcmd -S LAPTOPSERGEY -i D:\Labs\DataBase\Lab1\Create.sql 
sqlcmd -S LAPTOPSERGEY -i D:\Labs\DataBase\Lab1\Constraint.sql 
sqlcmd -S LAPTOPSERGEY -i D:\Labs\DataBase\Lab1\Fill.sql 
 
TIMEOUT /T -1
