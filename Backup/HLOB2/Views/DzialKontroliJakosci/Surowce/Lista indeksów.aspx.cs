using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Lista_indeksów : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CurrentRowTextBox_OnTextChanged(object sender, EventArgs e)
        {
            TextBox t = (TextBox)sender;
            DataPager pager =
                (DataPager)ListView1.FindControl("EmployeesDataPager");
            pager.SetPageProperties(Convert.ToInt32(t.Text) - 1,
                 pager.PageSize, true);
        }
    }
}