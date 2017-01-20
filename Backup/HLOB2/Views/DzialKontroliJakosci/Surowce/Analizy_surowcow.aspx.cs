using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using AjaxControlToolkit;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Analizy_surowcow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  jeśli żądanie jest ze strony "Dodaj analizę" - wyświetl dodany rekord i całą resztę
                if (Request.QueryString["aliasId"] != null)
                {
                    DropDownListAliasy.SelectedValue = Request.QueryString["aliasId"].ToString();
                }

                else
                {
                    GridViewAnalizy.DataSourceID = "AnalizySurowcowAccessDataSource";
                    GridViewAnalizy.DataBind();
                }
            }
        }

        protected void GridViewAnalizy_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //  koloruj wiersze
        protected void GridViewAnalizy_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton l = (ImageButton)e.Row.FindControl("ImageButton1");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Potwierdź usunięcie analizy nr " +
                DataBinder.Eval(e.Row.DataItem, "numerAnalizy") + "')");

                bool zwolniony = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "zwolniony"));
                bool zwolnionyWarunkowo = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "zwolnionyWarunkowo"));
                bool niezwolniony = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "niezwolniony"));

                if (zwolniony == true)
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(204, 255, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (zwolnionyWarunkowo == true)
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (niezwolniony == true)
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 153, 153);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
            }
        }

        protected void GridViewAnalizy_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                // get the categoryID of the clicked row
                string id = (e.CommandArgument).ToString();
                // Delete the record 
                DeleteRecordByID(id);
            }
        }

        protected void DeleteRecordByID(string id)
        {
            OleDbConnection con = MyConnection.getConnStrOle();
            OleDbCommand cmd =
                    new OleDbCommand("DELETE FROM [SurowceAnalizy] WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("id", id);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {

            }
            finally
            {
                con.Close();
            }
        }

        protected void ButtonSzczegoly_Click(object sender, EventArgs e)
        {
            if (GridViewAnalizy.SelectedIndex == -1)
            {

            }
            else
            {
                Response.Redirect("~/Views/DzialKontroliJakosci/Surowce/Analiza_podglad.aspx?analizaId=" +
                                    GridViewAnalizy.SelectedDataKey[0].ToString());
            }
        }

        protected void ButtonEdytuj_Click(object sender, EventArgs e)
        {
            if (GridViewAnalizy.SelectedIndex == -1)
            {

            }
            else
            {
                Response.Redirect("~/Views/DzialKontroliJakosci/Surowce/Analiza_edycja.aspx?analizaId=" +
                                    GridViewAnalizy.SelectedDataKey[0].ToString());
            }
        }

        protected void DropDownListAliasy_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void DropDownListRodzajeAnaliz_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListRodzajeAnaliz.SelectedValue == "9")
            {
                GridViewAnalizy.DataSourceID = "AnalizySurowcowAccessDataSource";
                GridViewAnalizy.DataBind();
            }
            else if (DropDownListRodzajeAnaliz.SelectedValue != "9")
            {
                GridViewAnalizy.DataSourceID = "FiltrAccessDataSource";
                GridViewAnalizy.DataBind();
            }
        }

        protected void GridViewAnalizy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string categoryID = GridViewAnalizy.DataKeys[e.RowIndex].Value.ToString();
            DeleteRecordByID(categoryID); 
        }

        //  wyczyść select
        protected void GridViewAnalizy_DataBinding(object sender, EventArgs e)
        {
            GridViewAnalizy.SelectedIndex = -1;
        }



        // wyświetlaj pop up przy rekordach
        //protected void GridViewAnalizy_RowCreated(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        HoverMenuExtender menu = (HoverMenuExtender)e.Row.FindControl("hme");
        //        e.Row.ID = e.Row.RowIndex.ToString();
        //        menu.TargetControlID = e.Row.ID;
        //    }
        //}
    }
}