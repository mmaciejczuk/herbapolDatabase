using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace HLOB2.Views.WydzialAdustacji
{
    public partial class BOM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewPolprodukty_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            //ClientScriptManager CSM = Page.ClientScript;
            //if (!confirma())
            //{
            //    string strconfirm = "<script>if(!window.confirm('Are you sure?')){}</script>";
            //    CSM.RegisterClientScriptBlock(this.GetType(), "Confirm", strconfirm, false);
            //    e.Cancel = true;
            //}
        }

        //    MessageBox.Show( "Czy na pewno chcesz skasować rekord?");
        //    e.Cancel = true;
              //Response.Write(
        //}
    }
}