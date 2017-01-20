using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.Admin.Operacje
{
    public partial class Wydruk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ////Chosen cell to change in subheader
            //TableCell cell = new TableCell();

            ////Ascending sort Button
            //ImageButton imgBtn = new ImageButton();

            //imgBtn.ID = "NameAscImageButton";
            //imgBtn.ImageUrl = @"/Images/asc.gif";
            //imgBtn.Width = Unit.Pixel(50);
            //imgBtn.Click += new ImageClickEventHandler(imgBtn_Click);

            ////Descending sort Button
            //ImageButton imgBtn2 = new ImageButton();
            //imgBtn2.ID = "NameDescImageButton";
            //imgBtn2.ImageUrl = @"/Images/triangle_desc.jpg";
            //imgBtn2.Width = Unit.Pixel(50);
            //imgBtn2.Click += new ImageClickEventHandler(imgBtn2_Click);

            ////Add controls to cell in asc-desc order
            //cell.Controls.Add(imgBtn);
            //cell.Controls.Add(imgBtn2);
        }

        

    }
}