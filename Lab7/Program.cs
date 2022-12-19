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
    [Table(Name = "Client")]
    public class ClientTable
    {
        [Column(IsPrimaryKey = true)]
        public int Clid { get; set; }
        [Column]
        public string Clname { get; set; }
        [Column]
        public string Clsurname { get; set; }
        [Column]
        public string Clphone { get; set; }
        [Column]
        public int Clage { get; set; }
    }
    internal class Program
    {
        static void Print(dynamic res)
        {
            foreach (var t in res)
                Console.WriteLine(t);
            Console.WriteLine();
        }
        static void Main(string[] args)
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