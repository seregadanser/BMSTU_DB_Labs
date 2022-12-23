using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Reflection;



namespace Lab7
{
    [Table(Name = "Serverr")]
    public class ServerTable
    {
        [Column(IsPrimaryKey = true)]
        public int Id { get; set; }
        [Column]
        public int ComputerId { get; set; }
        [Column]
        public int ValueOfComputers { get; set; }
        [Column]
        public int OrganisationId { get; set; }
        [Column]
        public string ServerName { get; set; }
        [Column]
        public int Bandwidth { get; set; }
    }
    [Table(Name = "Computer")]
    public class ComputerTable
    {
        [Column(IsPrimaryKey = true)]
        public int Id { get; set; }
        [Column]
        public int MemoryValue { get; set; }
        [Column]
        public int Furency { get; set; }
        [Column]
        public int NumberOfCores { get; set; }
        [Column]
        public string CoolType { get; set; }
    }
    [Table(Name = "DataCenter")]
    public class DataCenterTable
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = true)]
        public int Id { get; set; }
        [Column]
        public int CostofUsage { get; set; }
        [Column]
        public int Size { get; set; }
        [Column]
        public string LocationCountry { get; set; }
        [Column]
        public string CompanyName { get; set; }
    }
    internal class Program
    {
        static void Print(dynamic res)
        {
            foreach (var t in res)
                Console.WriteLine(t);
            Console.WriteLine();
        }
        static void ReadXML()
        {
            XDocument doc = XDocument.Load("t2.xml");
            foreach (XElement el in doc.Elements("start"))
            {
                foreach (XElement el1 in el.Elements("Lab1.dbo.Computer"))
                // XElement cid =;
                {
                    XAttribute cname = el1.Attribute("MemoryValue");
                   // XElement csurname = el.Element("ClSurname");
                    Console.WriteLine(cname);
                }
                //XElement cphone = el.Element("ClPhone");
                //XElement cage = el.Element("ClAge");

               
          
            }
        }

        static void UpdateXML()
        {
            XDocument doc = XDocument.Load("t2.xml");
            foreach (XElement el in doc.Elements("start"))
            {
                foreach (XElement el1 in el.Elements("Lab1.dbo.Computer"))
                {
                    if (el1.Attribute("Id").Value == "1")
                        el1.Attribute("MemoryValue").Value = "1";
                }
            }
            doc.Save("update.xml");
        }

        static void AddXML()
        {
            XDocument doc = XDocument.Load("t2.xml");
            doc.Element("start").Add(new XElement("Lab1.dbo.Computer",
                new XAttribute("MemoryValue", "121"),
                new XAttribute("Id", "1002"),
                new XAttribute("Furency", "9"),
                new XAttribute("CoolType", "Fan"),
                new XAttribute("NumberOfCores", "20")));
            doc.Save("add.xml");
        }

        public static void LINQToObject()
        {
            List<Client> clients = new List<Client>
            {
                new Client(){id = 1, name = "Kira", surname = "Volkova", age = 43, profession = "dantist"},
                new Client(){id = 2, name = "Nikita", surname = "Nikolaev", age = 18, profession = "programmer"},
                new Client(){id = 3, name = "Veronica", surname = "Stepanova", age= 32,profession = "plumber"},
                new Client(){id = 4, name = "Valentin", surname = "Sokolov", age= 21, profession = "teacher"},
                new Client(){id = 5, name = "Galina", surname = "Volkova", age=76 , profession = "driver"},
                new Client(){id = 6, name = "Sergei", surname = "Sokolov", age= 89, profession = "pilot"}
            };

            List<ConnectTable> ct = new List<ConnectTable>
            {
                new ConnectTable(){id = 1, IdServer = 5, IdSite = 4, IdUser = 2 },
                new ConnectTable(){id = 2, IdServer = 6, IdSite = 3, IdUser = 1 },
                new ConnectTable(){id = 3, IdServer = 3, IdSite = 2, IdUser = 3 },
                new ConnectTable(){id = 4, IdServer = 2, IdSite = 1, IdUser = 5 },
                new ConnectTable(){id = 5, IdServer = 3, IdSite = 7, IdUser = 6 },
                new ConnectTable(){id = 6, IdServer = 2, IdSite = 5, IdUser = 4 }

            };

            Console.WriteLine("1. Выводит клиентов, которые сидят на 7 сайте");
            var res1 = from cl in clients
                       join g in ct on cl.id equals g.IdUser
                       where g.IdSite == 7
                       orderby cl.id
                       select new { Id = cl.id, Name = cl.name };
            Print(res1);
            Console.WriteLine("---------------------------------------");

            Console.WriteLine("2. Выводит группы по серверам");
            var res2 = from g in ct
                       group g by g.IdServer
                       into res22
                       select res22;
            foreach (var gr in res2)
            {
                Console.WriteLine("Genre: {0}", gr.Key);
                foreach (var tit in gr)
                    Console.WriteLine(tit.IdSite);
                Console.WriteLine();
            }
            Console.WriteLine("---------------------------------------");

            Console.WriteLine("3. Выводит учителей");
            var res3 = from g in clients
                       where g.profession == "teacher"
                       select new { Client = g.name, Proff = g.profession };
            Print(res3);
            Console.WriteLine("---------------------------------------");

            Console.WriteLine("4. Количество игр у каждого клиента");
            var res4 = from g in ct
                       join cl in clients on g.IdUser equals cl.id
                       group cl by cl.name
                       into res44
                       select res44;
            foreach (var gr in res4)
            {
                Console.WriteLine("Client: {0}", gr.Key);
                //foreach (var tit in gr)
                Console.WriteLine("{0}", gr.Count());
                Console.WriteLine();
            }
            Console.WriteLine("---------------------------------------");

            Console.WriteLine("5. Клиенты старше 22 и отсортированные по возрастанию");
            var res5 = from cl in clients
                       where cl.age > 22
                       orderby cl.age ascending
                       select new { Client = cl.name, Age = cl.age };
            Print(res5);
        }
        public static void LINQToSQL()
        {
            Console.WriteLine("---------------------------------------");
            string connectionString = @"Server = LAPTOPSERGEY; Database = Lab1; Trusted_Connection = True; ";
            DataContext db = new DataContext(connectionString);

            Console.WriteLine("Однотабличный запрос на выборку\nКомпьютеры с кол-во ядер больше 4");
            var zap1 = from pl in db.GetTable<ComputerTable>()
                       where pl.NumberOfCores>=4
                       select new { Id = pl.Id, Cores = pl.NumberOfCores };
            Print(zap1);


            Console.WriteLine("---------------------------------------");
            Console.WriteLine("Многотабличный запрос на выборку\n");
            var zap2 = from g in db.GetTable<ServerTable>()
                       join dev in db.GetTable<ComputerTable>() on g.ComputerId equals dev.Id
                       where dev.CoolType == "Oil"
                       select new { Na = g.ServerName, Re = dev.Id, Nn = g.ValueOfComputers };
            Print(zap2);


            Console.WriteLine("---------------------------------------");
            Console.WriteLine("\nЗапрос на добавление");
            var country = "Moscow";
            var id = from dev in db.GetTable<DataCenterTable>()
                     select dev.Id;
            int maxId = id.Max() + 1;

            DataCenterTable newDev = new DataCenterTable()
            {
            //    Id = maxId,
                Size = 5500,
                CompanyName = "abcd",
                CostofUsage = 90865,
                LocationCountry = country
            };
            db.GetTable<DataCenterTable>().InsertOnSubmit(newDev);
            db.SubmitChanges();
            Console.WriteLine("Добавление завершено");


            Console.WriteLine("---------------------------------------");
            var change = db.GetTable<ComputerTable>().FirstOrDefault();
            change.CoolType = "AA";
            db.SubmitChanges();
            Console.WriteLine("Изменение завершено");


            Console.WriteLine("---------------------------------------");
            var delete = db.GetTable<ComputerTable>().FirstOrDefault();
            db.GetTable<ComputerTable>().DeleteOnSubmit(delete);
            db.SubmitChanges();
            Console.WriteLine("Элемент удален");

       
            UserDataContext db1 = new UserDataContext(connectionString);
            Console.WriteLine(db1.GetAgeRange(1260, 3400));

            //Console.ReadKey();
        }
        static void Main(string[] args)
        {
            LINQToSQL();
           // ReadXML();
            //UpdateXML();
            //AddXML();
        }
    }
    public class UserDataContext : DataContext
    {
        public UserDataContext(string connectionString)
            : base(connectionString)
        {

        }

        [Function(Name = "gcb")]
        [return: Parameter(DbType = "Int")]
        public int GetAgeRange([Parameter(Name = "a", DbType = "Int")] int a,
            [Parameter(Name = "b", DbType = "Int")] int b)
        {
            IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), a,b);
            return ((int)(result.ReturnValue));
        }
    }

    class Client
    {
        public int id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public int age{ get; set; }
        public string profession { get; set; }
    }
    class ConnectTable
    {
        public int id { get; set; }
        public int IdUser { get; set; }
        public int IdServer { get; set; }
        public int IdSite { get; set; }
    }
}