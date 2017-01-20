using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace HLOB2
{
    public class GetConnStr
    {
        public static OleDbConnection getConnStr()
        {
            return new OleDbConnection(ConfigurationManager.ConnectionStrings["BazaHLOBConnectionString"].ConnectionString);
        }
    }
}