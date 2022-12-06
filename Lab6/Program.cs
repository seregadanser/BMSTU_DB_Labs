
using Microsoft.SqlServer.Server;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Reflection.PortableExecutable;
using System.Xml.Linq;

namespace Lab6
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=LAPTOPSERGEY;Database=Lab1;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;

                command.CommandText = "SELECT COUNT(*) FROM Sitee";
                object count = command.ExecuteScalar();
                Console.WriteLine($"В таблице {count} объектов");


                command.CommandText = "select Computer.MemoryValue, Computer.Id, Serverr.ServerName,Serverr.ValueOfComputers,Serverr.ComputerId" +
                    " from Computer join Serverr on  Serverr.ComputerId = Computer.Id" +
                " where Computer.Id in (select Computer.Id from Computer right outer join Serverr" +
                " on Serverr.ComputerId = Computer.Id where Serverr.ValueOfComputers > 12 ) order by Computer.Id";

                //command.CommandText = "SELECT * FROM Sitee";
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);
                    string columnName3 = reader.GetName(2);
                    string columnName4 = reader.GetName(3);
                    string columnName5 = reader.GetName(4);
                    Console.WriteLine($"{columnName1}\t{columnName3}\t{columnName2}\t{columnName3}\t{columnName4}\t{columnName5}");
                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                        object age = reader.GetValue(2);
                        object id1 = reader.GetValue(3);
                        object name1 = reader.GetValue(4);
                        Console.WriteLine($"{id} \t{name} \t{age}\t{id1} \t{name1} ");
                    }

                }



            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;

                command.CommandText = "WITH Sales_CTE (SalesPersonID, SalesOrderID) AS (select AVG(YearProfit) over (partition by Organisation.NameO) as 'avgy'" +
                               " , Country from Organisation where Country = 'Poland') SELECT * from Sales_CTE";
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);

                    Console.WriteLine($"{columnName1}\t{columnName2}");
                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);

                        Console.WriteLine($"{id} \t{name}");
                    }

                }
                           }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "SELECT dbo.MaxCost()";
                object count = command.ExecuteScalar();
                Console.WriteLine($"{count}");

                command.CommandText = " SELECT * FROM dbo.FPC()";
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);
                    string columnName3 = reader.GetName(2);
                    string columnName4 = reader.GetName(3);

                    Console.WriteLine($"{columnName1}\t{columnName2}\t{columnName3}\t{columnName4}");
                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                        object id1 = reader.GetValue(2);
                        object name1 = reader.GetValue(3);
                        Console.WriteLine($"{id} \t{name}\t{id1} \t{name1}");
                    }

                }
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "EXEC  dbo.SelectC  @Theme = \"Games\";";
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);
                    string columnName3 = reader.GetName(2);
                    string columnName4 = reader.GetName(3);
                    string columnName5 = reader.GetName(4);
                    string columnName6 = reader.GetName(5);

                    Console.WriteLine($"{columnName1}\t{columnName2}\t{columnName3}\t{columnName4}\t{columnName5}\t{columnName6}");
                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                        object id1 = reader.GetValue(2);
                        object name1 = reader.GetValue(3);
                        object id2 = reader.GetValue(4);
                        object name2 = reader.GetValue(5);
                        Console.WriteLine($"{id} \t{name}\t{id1} \t{name1}\t{id2} \t{name2}");
                    }

                }

            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "select object_id, name from sys.all_columns";
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows) // если есть данные
                {
                    // выводим названия столбцов
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);
               

                    Console.WriteLine($"{columnName1}\t{columnName2}");
                    while (reader.Read()) // построчно считываем данные
                    {
                        object id = reader.GetValue(0);
                        object name = reader.GetValue(1);
                
                        Console.WriteLine($"{id} \t{name}");
                    }

                }

            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "SELECT NEWID();";
                object count = command.ExecuteScalar();
                Console.WriteLine($"{count}");
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                Console.WriteLine("Подключение открыто");

                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandText = "CREATE TABLE City (Id INT PRIMARY KEY IDENTITY, Name NVARCHAR(100))";
                command.Connection = connection;
                command.ExecuteNonQuery();

                command.CommandText = "INSERT INTO City(Name) VALUES('Tomsk')";
                int number = command.ExecuteNonQuery();
                Console.WriteLine($"Добавлено объектов: {number}");

                Console.WriteLine("Таблица  создана");
            }



            Console.WriteLine("Подключение закрыто...");
            Console.WriteLine("Программа завершила работу.");
            Console.Read();
        }
    }
}