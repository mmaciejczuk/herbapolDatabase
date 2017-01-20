using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Test.ListView
{
    public partial class Select : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void ContactsListView_SelectedIndexChanged(Object sender, EventArgs e)
        {
            if (ContactsListView.SelectedIndex >= 0)
                ViewState["SelectedKey"] = ContactsListView.SelectedValue;
            else
                ViewState["SelectedKey"] = null;
        }

        void ContactsListView_DataBound(Object sender, EventArgs e)
        {
            for (int i = 0; i < ContactsListView.Items.Count; i++)
            {
                // Ignore values that cannot be cast as integer.
                try
                {
                    if ((int)ContactsListView.DataKeys[i].Value == (int)ViewState["SelectedKey"])
                        ContactsListView.SelectedIndex = i;
                }
                catch { }
            }
        }

        void ContactsListView_PagePropertiesChanged(Object sender, EventArgs e)
        {
            ContactsListView.SelectedIndex = -1;
        }

        void ContactsListView_Sorting(Object sender, ListViewSortEventArgs e)
        {
            ContactsListView.SelectedIndex = -1;
        }

        void ClearButton_Click(Object sender, EventArgs e)
        {
            ViewState["SelectedKey"] = null;
            ContactsListView.SelectedIndex = -1;
        }
    }
}