using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebForms
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que é executado na inicialização do aplicativo
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);



            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLiteConnection"].ConnectionString;

            // Criar as tabelas se não existirem
            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                connection.Open();

                // Criar tabela Login
                string createLoginTableQuery = @"
                CREATE TABLE IF NOT EXISTS Login (
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Nome TEXT
                );";

                using (SQLiteCommand command = new SQLiteCommand(createLoginTableQuery, connection))
                {
                    command.ExecuteNonQuery();
                }

                // Criar tabela Usuario
                string createUsuarioTableQuery = @"
                CREATE TABLE IF NOT EXISTS Usuario (
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Nome TEXT
                );";

                using (SQLiteCommand command = new SQLiteCommand(createUsuarioTableQuery, connection))
                {
                    command.ExecuteNonQuery();
                }
            }




        }
    }
}