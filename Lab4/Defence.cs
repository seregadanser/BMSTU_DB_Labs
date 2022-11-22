using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class Triggers
{        
    // Введите существующую таблицу или представление для целевого объекта и раскомментируйте строку атрибута.
    // [Microsoft.SqlServer.Server.SqlTrigger (Name="Trigger", Target="Table1", Event="FOR UPDATE")]
    public static void SafeTrigger ()
    {
           SqlCommand command;
   SqlDataReader reader;
Int32 idc;
string ss;
        SqlTriggerContext triggerContext = SqlContext.TriggerContext;

        if (triggerContext.TriggerAction == TriggerAction.Delete)
            {
                using (SqlConnection connection
         = new SqlConnection(@"context connection=true"))
      {
         connection.Open();

         // Get the inserted row.
         command = new SqlCommand(@"SELECT * FROM deleted;",
                                  connection);

         // Get the user name and real name of the inserted user.
         reader = command.ExecuteReader();
         reader.Read();
         idc = (Int32)reader[0];
         Int32 index = (Int32)reader[6];
         reader.Close();
          command = new SqlCommand(@"DELETE Serverr1 WHERE ID = @val;",
                                  connection);
          command.Parameters.Add(new SqlParameter("@val", index));
           command.ExecuteNonQuery();
        command = new SqlCommand(@"select top 1 min(ValueOfComputers), ServerName from Serverr1 group by ServerName, ValueOfComputers order by ValueOfComputers", connection);
     reader = command.ExecuteReader();
      
       reader.Read();
      Int32 val = (Int32)reader[0];
        ss = (string)reader[1];
         reader.Close();

         command = new SqlCommand(@"SELECT count(*) FROM Serverr1", connection);
         Int32 df = (Int32)command.ExecuteScalar();

         // Insert the user name and real name into the auditing table.
         command = new SqlCommand(@"INSERT [dbo].[Serverr1] (ComputerId, ValueOfComputers, DatacenterId, OrganisationId, ServerName, Bandwidth) "
                  + @"VALUES (@idc , @val, @p1, @p2, @ss, @p3);", connection);

         command.Parameters.Add(new SqlParameter("@idc", idc));
         command.Parameters.Add(new SqlParameter("@val", val+1));
         command.Parameters.Add(new SqlParameter("@p1", null));
         command.Parameters.Add(new SqlParameter("@p2", null));
         command.Parameters.Add(new SqlParameter("@ss", ss));
         command.Parameters.Add(new SqlParameter("@p3", null));

         command.ExecuteNonQuery();

        
      }
            }
    }
}