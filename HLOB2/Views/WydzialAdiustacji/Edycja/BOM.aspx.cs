using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace HLOB2.Views.WydzialAdustacji.Inne
{
    public partial class BOM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListViewPolprodukty_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                LinkButton btn = e.CommandSource as LinkButton;
                string find = btn.Text;
            }
        }

    }
}