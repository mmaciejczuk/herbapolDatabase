using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.Admin.Pracownicy
{
    public partial class Pracownicy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                this.Label1.Text = e.Exception.Message;
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                this.Label1.Text = e.Exception.Message;
            }
        }
        protected void SqlDataSource_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                this.Label1.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // DO DropdownList1

            //if ((e.Row.RowState == DataControlRowState.Edit) ||
            //     (e.Row.RowState == (DataControlRowState.Alternate |
            //                        DataControlRowState.Edit)))
            //{
            //    System.Data.DataRowView drv = (System.Data.DataRowView)e.Row.DataItem;

            //    DropDownList ddl = (DropDownList)e.Row.Cells[4].FindControl("DropDownList1");
            //    ListItem li = ddl.Items.FindByValue(drv["Dzial"].ToString());
            //    li.Selected = true;
            //}

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the title of courtesy for the item that's being created.
                bool aktywny = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "Aktywny"));
                // If the title of courtesy is "Ms.", "Mrs.", or "Mr.",
                // change the item's colors.
                if (aktywny == false)
                {
                    e.Row.BackColor = System.Drawing.Color.LightPink;
                    e.Row.ForeColor = System.Drawing.Color.Maroon;
                }
                else if (aktywny == true)
                {
                    e.Row.BackColor = System.Drawing.Color.LightCyan;
                    e.Row.ForeColor = System.Drawing.Color.DarkBlue;
                }
            }
        }
    }
}