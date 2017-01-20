using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace HLOB2.Views.WydzialAdustacji
{
    public partial class WydzialAdiustacji : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelLog.Text = MySession.Current.ostatnieLogowanie;
        }

    }
}