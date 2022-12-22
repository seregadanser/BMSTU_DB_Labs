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
            string connectionString = @"Server = DESKTOP-TPNKBFP; Database = Lab1; Trusted_Connection = True; ";
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


            //Console.WriteLine("---------------------------------------");
            //var delete = db.GetTable<DeveloperTable>().Where(d => d.Devid == maxId).FirstOrDefault();
            //db.GetTable<DeveloperTable>().DeleteOnSubmit(delete);
            //db.SubmitChanges();
            //Console.WriteLine("Элемент удален");

            ///////////////////////////////////////////////////////////////////
            /////
            //// Получение доступа к данным, выполнчч только хранимую процедуру
            //UserDataContext db1 = new UserDataContext(connectionString);
            //int count = 0, avg = 0;
            //string name = "Kira";
            //db1.GetAgeRange(name, ref count, ref avg);
            //Console.WriteLine("Для пользователей с именем {0} средний возраст: {1}, количество клиентов с этим именем: {2}", name, avg, count);

            //Console.ReadKey();
        }
        static void Main(string[] args)
        {
            LINQToSQL();
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