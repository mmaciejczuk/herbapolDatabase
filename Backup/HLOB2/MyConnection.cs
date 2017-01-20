using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;

namespace HLOB2
{
    public static class MyConnection
    {
        public static SqlConnection getConnStrSQL()
        {
            SqlConnection conn =
                new SqlConnection(ConfigurationManager.
                    ConnectionStrings["hlobConnectionString"].ConnectionString);
            return conn;
        }

        public static OleDbConnection getConnStrOle()
        {
            OleDbConnection conn =
                new OleDbConnection(ConfigurationManager.
                    ConnectionStrings["BazaHLOBConnectionString"].ConnectionString);
            return conn;
        }
    }
}