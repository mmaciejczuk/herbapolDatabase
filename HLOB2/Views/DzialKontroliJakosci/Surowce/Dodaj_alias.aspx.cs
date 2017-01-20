using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Dodaj_alias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //if (e.RowIndex.ToString() == "91")
            //{

            //}
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            LabelRowIndex.Text = e.ToString();
        }
    }
}