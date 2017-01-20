using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class Zlecenie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                TextBox txtFname = (TextBox)e.Item.FindControl("txtFname");
                TextBox txtLname = (TextBox)e.Item.FindControl("txtLname");
                TextBox txtCtype = (TextBox)e.Item.FindControl("txtCtype");
                string insertCommand = "Insert into [Contacts] ([FirstName],[LastName],[ContactType]) Values('" + txtFname.Text + "', '" + txtLname.Text + "', '" + txtCtype.Text + "');";
                SqlDataSource1.InsertCommand = insertCommand;
            }
            else if (e.CommandName == "Update")
            {
                TextBox txtId = (TextBox)e.Item.FindControl("txtUpId");
                TextBox txtFname = (TextBox)e.Item.FindControl("txtUpFname");
                TextBox txtLname = (TextBox)e.Item.FindControl("txtUpLname");
                TextBox txtCtype = (TextBox)e.Item.FindControl("txtUpCtype");
                string updateCommand = "Update [Contacts] set [FirstName]='" + txtFname.Text + "', [LastName]='" + txtLname.Text + "', [ContactType]='" + txtCtype.Text + "' where Id=" + Convert.ToInt32(txtId.Text) + ";";
                SqlDataSource1.UpdateCommand = updateCommand;
            }
            else if (e.CommandName == "Delete")
            {
                TextBox txtId = (TextBox)e.Item.FindControl("txtUpId");
                string deleteCommand = "delete from [Contacts] where Id=" + Convert.ToInt32(txtId.Text);
                SqlDataSource1.DeleteCommand = deleteCommand;
            }
        }
    }
}