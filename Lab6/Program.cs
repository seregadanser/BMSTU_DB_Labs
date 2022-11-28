
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;

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
                command.CommandText = "SELECT * FROM Sitee";
                command.Connection = connection;

                //SqlDataReader reader = command.ExecuteReader();
                //if (reader.HasRows) // если есть данные
                //{
                //    // выводим названия столбцов
                //    string columnName1 = reader.GetName(0);
                //    string columnName2 = reader.GetName(1);
                //    string columnName3 = reader.GetName(2);
                //    string columnName4 = reader.GetName(3);
                //    string columnName5 = reader.GetName(4);
                //    string columnName6 = reader.GetName(5);

                //    Console.WriteLine($"{columnName1}\t{columnName3}\t{columnName2}\t{columnName3}\t{columnName4}\t{columnName5}");

                //    while (reader.Read()) // построчно считываем данные
                //    {
                //        object  id= reader.GetValue(0);
                //        object name = reader.GetValue(1); 
                //        object age = reader.GetValue(2);
                //        object id1 = reader.GetValue(3);
                //        object name1 = reader.GetValue(4);
                //        object age1 = reader.GetValue(5);

                //        Console.WriteLine($"{id} \t{name} \t{age}\t{id1} \t{name1} \t{age1}");
                //    }

                //}
            }
            Console.WriteLine("Подключение закрыто...");
            Console.WriteLine("Программа завершила работу.");
            Console.Read();
        }
    }
}