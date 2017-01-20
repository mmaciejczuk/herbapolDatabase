using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace HLOB2.Views.WydzialAdustacji
{
    public partial class WydzialAdiustacji : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReadRecords();
        }

        private void ReadRecords()
        {
            OleDbConnection conn = null;
            OleDbDataReader reader = null;

            try
            {
                conn = GetConnStr.getConnStr();
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("SELECT * FROM NazwyPolproduktow", conn);
                reader = cmd.ExecuteReader();

                GridView1.DataSource = reader;
                GridView1.DataBind();
            }

            catch (Exception e)
            {
                Response.Write(e.Message);
                Response.End();
            }

            finally
            {
                if (reader != null) reader.Close();
                if (conn != null) conn.Close();
            }
        }
    }
}