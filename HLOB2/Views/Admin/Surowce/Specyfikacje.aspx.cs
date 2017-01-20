using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace HLOB2.Views.Admin.Surowce
{
    public partial class Speyfikacje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    wyswietlListe(DropDownListSurowce.SelectedValue.ToString());         //odśwież listę analiz po zdarzeniu
            //    LabelError.Visible = true;
            //    LabelError.Text = DropDownListSurowce.SelectedValue.ToString();
            //}
        }

        protected void wyswietlListe(string idAliasu)
        {
            //DataTable dt = new DataTable();
            //OleDbConnection con = MyConnection.getConnStrOle();
            ////try
            ////{
            //    con.Open();
            //    OleDbCommand cmd =
            //        new OleDbCommand("SELECT * FROM SpecyfikacjeSurowcow ss, AliasySpecyfikacje asp " +
            //            "WHERE asp.aliasId LIKE @idAliasu AND asp.specyfikacjaId=ss.specyfikacjaId;", con);

            //    cmd.Parameters.AddWithValue("idAliasu", idAliasu);
            //    OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
            //    sqlDa.Fill(dt);

            //    DetailsView1.DataSource = dt;
            //    DetailsView1.DataBind();

            //    con.Close();
                
            //}
            //catch (Exception ex)
            //{
            //    LabelError.Text = ex.ToString();
            //}
            //finally
            //{
            //    con.Close();
            //}
        }

        //protected void DropDownListSurowce_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //wyswietlListe(DropDownListSurowce.SelectedValue.ToString());
        //}
    }
}