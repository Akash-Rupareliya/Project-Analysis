using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace StudentInformationManagementApplication.Domains
{
    public class BaseDomain
    {
        public SqlConnection SqlConnection { get; set; }
        public SqlCommand SqlCommand { get; set; }

        public BaseDomain()
        {
            this.SqlConnection = new SqlConnection(@"Data Source=Akash-Rupareliy;Initial Catalog=StudentInformationManagementSystemDb;Integrated Security=True");
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
