import faker as f
import csv
import datetime
import random
import string

faker =f.Faker()
countries = ["Russia", "USA", "Ukraine", "Latvia", "German", "France", "Poland"]
end = [".net",".org",".ru",".com",".fi"]
platforms = ["Wix","Tilda","Moguta.Cloud","Ukit","Nethouse"]
thems = ["fishing","auto","books","serials","films", "games"]
cool = ["water","fan", "oil"]
owner = ["Google","Apple","Amazon","Microsoft"]

def GenPeople(n):
    myData = [["First_name", "Second_name", "Proffesion", "DateOfBD", "Id"]]
    for i in range(1,n+1):
        prof = faker.job()
        prof = prof.replace(',','')
        myData.append([faker.first_name(),faker.last_name(),prof,faker.date(pattern="%Y-%m-%d", end_datetime = datetime.date(2000,1,1)),i])
    myFile = open('People.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)

def GenOrganisation(n):
    myData = [["Name", "Country", "INN", "YearSum", "Id"]]
    for i in range(1,n+1):
        myData.append([faker.word(),faker.random_element(countries), faker.random_number(digits=13, fix_len=5),faker.random_number(digits=6, fix_len=6),i])
    myFile = open('Company.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)
        
def GenSite(n):
    myData = [["Name", "Theme", "Platform", "NumOfUsers","Ref" ,"Id"]]
    for i in range(1,n+1):
        myData.append([faker.word()+faker.random_element(end),faker.random_element(thems), faker.random_element(platforms),faker.random_number(digits=5, fix_len=6),random.randint(1,n),i])
    myFile = open('Site.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)
        
def GenComp(n):
    myData = [["MemSize", "Frequency", "TypeOfCooling", "NumOfCore", "Id"]]
    for i in range(1,n+1):
        myData.append([faker.random_number(digits=5, fix_len=6),faker.random_number(digits=1, fix_len=6),faker.random_element(cool),faker.random_number(digits=1, fix_len=6),i])
    myFile = open('Computer.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)

def GenServer(n):
    myData = [["CompId", "NumOfComp", "DataCentId", "OrganisationId", "ServerName", "Bandwidth", "Id"]]
    for i in range(1,n+1):
        myData.append([random.randint(1,n),random.randint(1,100),random.randint(1,n),random.randint(1,1000),faker.word(),faker.random_number(digits=4, fix_len=6),i])
    myFile = open('Server.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)
        
def GenDataServ(n):
    myData = [["Owner", "Place", "Size", "CostOfSave", "Id"]]
    for i in range(1,n+1):
        myData.append([faker.random_element(owner),faker.random_element(countries),random.randint(400,600),random.randint(500,900),i])
    myFile = open('DataServer.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)

def GenConectTable(n):
    myData = [["IdPeople","IdSite","IdServer","Id", "flag", "date"]]
    for i in range(1,n+1):
        myData.append([random.randint(1,n),random.randint(1,n),random.randint(1,n),"","",i])
    myFile = open('ConnectTable.csv', 'w')
    with myFile:
        writer = csv.writer(myFile)
        writer.writerows(myData)

m = 1001
print("start")
print("People")
GenPeople(m)
print("Organisation")
GenOrganisation(m)
print("Site")
GenSite(m)
print("Computer")
GenComp(m)
print("Serv")
GenServer(m)
print("Dataserv")
GenDataServ(m)
print("ConnectTable")
GenConectTable(m)
print("stop")




