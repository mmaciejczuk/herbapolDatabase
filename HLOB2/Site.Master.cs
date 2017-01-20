using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["__MySession__"] == null)
            //{
            //    Label1.Text = "";
            //    LinkButton1.Text = "";
            //}
            //else
            //{
                Session["__MySession__"] = null;
            //}
        }
    }
}
