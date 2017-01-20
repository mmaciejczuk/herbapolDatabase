using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.Admin.Operacje
{
    public partial class DetailsViewExamples : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView2_DataBound(object sender, EventArgs e)
        {
            DetailsView myDetailsView = (DetailsView)sender;
            if (myDetailsView.CurrentMode == DetailsViewMode.Edit)
            {
                ((TextBox)myDetailsView.FindControl("nazwa")).Text = DateTime.Now.ToString("d");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DetailsView1.BackColor = System.Drawing.Color.CornflowerBlue;
            DetailsView1.ForeColor = System.Drawing.Color.AliceBlue;
            DetailsView1.BorderColor = System.Drawing.Color.LightBlue;
            DetailsView1.GridLines = GridLines.Horizontal;
            DetailsView1.HeaderStyle.BackColor = System.Drawing.Color.DarkBlue;
            DetailsView1.HeaderStyle.Font.Bold = true;
            DetailsView1.HeaderStyle.Font.Italic = false;
            DetailsView1.Font.Italic = true; 
        }
    }
}