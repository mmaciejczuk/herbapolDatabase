using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void ContactsListView_Sorting(Object sender, ListViewSortEventArgs e)
        {
            // Check the sort direction to set the image URL accordingly.
            string imgUrl;
            if (e.SortDirection == SortDirection.Ascending)
                imgUrl = "~/images/ascending.gif";
            else
                imgUrl = "~/images/descending.gif";

            // Check which field is being sorted
            // to set the visibility of the image controls.
            Image sortImage1 = (Image)ContactsListView.FindControl("SortImage1");
            Image sortImage2 = (Image)ContactsListView.FindControl("SortImage2");
            Image sortImage3 = (Image)ContactsListView.FindControl("SortImage3");
            switch (e.SortExpression)
            {
                case "FirstName":
                    sortImage1.Visible = true;
                    sortImage1.ImageUrl = imgUrl;
                    sortImage2.Visible = false;
                    sortImage3.Visible = false;
                    break;
                case "LastName":
                    sortImage1.Visible = false;
                    sortImage2.Visible = true;
                    sortImage2.ImageUrl = imgUrl;
                    sortImage3.Visible = false;
                    break;
                case "EmailAddress":
                    sortImage1.Visible = false;
                    sortImage2.Visible = false;
                    sortImage3.Visible = true;
                    sortImage3.ImageUrl = imgUrl;
                    break;
            }
        }
    }
}