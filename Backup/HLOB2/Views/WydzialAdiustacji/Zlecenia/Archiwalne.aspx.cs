using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class Archiwalne : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {
            Response.Write(e.Index);
            Response.Write(BulletedList1.Items[e.Index].Text); //.Value
        }
    }
}