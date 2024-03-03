using System;
using System.Collections.Generic;
using System.Data.SQLite;
using System.Linq;
using System.Web;

namespace WebForms.Infra
{
    public class UsuarioInfra
    {
        public int ID { get; set; }
        public string Nome { get; set; }

        public void RegistrarUsuario(string nome)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLiteConnection"].ConnectionString;

            string query = "INSERT INTO Usuario (Nome) VALUES (@Nome);";

            using (SQLiteConnection connection = new SQLiteConnection(connectionString))
            {
                using (SQLiteCommand command = new SQLiteCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Nome", nome);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}