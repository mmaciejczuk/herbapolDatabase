using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.Admin
{
    public partial class Startowa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelLog.Text = MySession.Current.ostatnieLogowanie;
        }
    }
}