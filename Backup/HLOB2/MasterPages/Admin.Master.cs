using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.MasterPages
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["__MySession__"] != null)
            {
                Label1.Text = "Jesteś zalogowany jako " + MySession.Current.imieNazwisko;
                LinkButton1.Text = "Wyloguj się";
                LinkButton1.PostBackUrl = "~/Wyloguj.aspx";
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}