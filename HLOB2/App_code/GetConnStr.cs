using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;

namespace HLOB2
{
    public class GetConnStr
    {
        public static SqlConnection getConnStr()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["hlobConnectionString"].ConnectionString);
        }
    }
}