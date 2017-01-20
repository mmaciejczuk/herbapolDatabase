using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownListStatus.AppendDataBoundItems = true;
            DropDownListStatus.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListStatus.SelectedIndex = 0;

            DropDownListPolprodukty.AppendDataBoundItems = true;
            DropDownListPolprodukty.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            DropDownListPolprodukty.SelectedIndex = 0;

            GridView1.PageIndex = Int32.MaxValue;   //ustawienie page na ostatnią stronę
        }


        protected void GridView1_PreRender1(object sender, EventArgs e)
        {
            DropDownList pp = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
            pp.AppendDataBoundItems = true;
            pp.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            pp.SelectedIndex = 0;
        }
    }
}