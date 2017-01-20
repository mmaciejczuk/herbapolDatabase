using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class Proby_technologiczne : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.AppendDataBoundItems = true;
                DropDownList1.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                DropDownList1.SelectedIndex = 0;
            }
        }

        //  koloruj wiersze
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton l = (ImageButton)e.Row.FindControl("ImageButton1");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Potwierdź usunięcie zlecenia nr " +
                DataBinder.Eval(e.Row.DataItem, "numer") + "')");

                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();

                if (status == "oczekiwanie")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "adiustacja")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(204, 255, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "kwarantanna")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(153, 204, 255);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "w magazynie")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 204, 153);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "wysłano")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(204, 204, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "sanityzacja")
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 153);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Realizacja.aspx?zlecenieId=" +
                                    GridView1.SelectedDataKey[0].ToString());
        }

        protected void DropDownListChanged(object sender, EventArgs e)
        {
            TextBox customerID = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
            customerID.Text = "costam";

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "InsertNew")
            {
                TextBox numerZlecenia = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
                DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
                TextBox seria = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
                TextBox wagaSurowca = GridView1.FooterRow.FindControl("TextBoxWagaSur") as TextBox;
                //TextBox status = GridView1.FooterRow.FindControl("status") as TextBox;

                AccessDataSource1.InsertParameters["numer"].DefaultValue = numerZlecenia.Text;
                AccessDataSource1.InsertParameters["polprodukt"].DefaultValue = polprodukt.SelectedValue.ToString();
                AccessDataSource1.InsertParameters["seria"].DefaultValue = seria.Text;
                AccessDataSource1.InsertParameters["wagaSurowca"].DefaultValue = wagaSurowca.Text;
                //AccessDataSource1.InsertParameters["status"].DefaultValue = "oczekiwanie";

                //AccessDataSource1.InsertParameters["wagaPolproduktu"].DefaultValue = wagaPolproduktu.Text;
                //AccessDataSource1.InsertParameters["uwagi"].DefaultValue = "";
                //AccessDataSource1.InsertParameters["data_rozp"].DefaultValue = "2012-07-01";
                //AccessDataSource1.InsertParameters["data_zak"].DefaultValue = "2012-07-01";
                //AccessDataSource1.InsertParameters["status"].DefaultValue = "";
                //AccessDataSource1.InsertParameters["zakonczone"].DefaultValue = "false";
                //AccessDataSource1.InsertParameters["rozpoczete"].DefaultValue = "false";
                //AccessDataSource1.InsertParameters["nierozpoczete"].DefaultValue = "false";

                AccessDataSource1.Insert();
            }
            else if (e.CommandName.ToString() == "Edit")
            {
                //DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
                //polprodukt.SelectedValue = ["polprodukt"].ToString();
            }
        }

        //dodanie pustego pola do dropdownlist
        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            DropDownList pp = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
            pp.AppendDataBoundItems = true;
            pp.Items.Insert(0, new ListItem(String.Empty, String.Empty));
            pp.SelectedIndex = 0;
        }
    }
}