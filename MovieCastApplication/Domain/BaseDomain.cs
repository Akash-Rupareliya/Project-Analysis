using System;
using System.Data.SqlClient;

namespace MovieCastApplication.Domain
{
    abstract class BaseDomain
    {
        public SqlConnection SqlConnection { get; set; }
        public SqlCommand SqlCommand { get; set; }

        public BaseDomain()
        {
            this.SqlConnection = new SqlConnection(@"Data Source=Akash-Rupareliy;Initial Catalog=MovieDb;Integrated Security=True");
            this.SqlConnection.Open();
        }

        public void ExecuteNonQuery(string command)
        {
            SqlCommand = new SqlCommand(command, SqlConnection);
            SqlCommand.ExecuteNonQuery();
        }

        public SqlDataReader GetReader(string command)
        {
            this.SqlCommand = new SqlCommand(command, SqlConnection);
            return this.SqlCommand.ExecuteReader();
        }

        public void CloseConnection()
        {
            SqlConnection.Close();
        }
    }
}
