using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Analiza_podglad : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            wyswietlDetailView1(Request.QueryString["analizaId"].ToString());
            wyswietlDetailView2(Request.QueryString["analizaId"].ToString());
            wyswietlDetailView3(Request.QueryString["analizaId"].ToString());
            wyswietlDetailView4a(Request.QueryString["analizaId"].ToString());
            wyswietlDetailView6(Request.QueryString["analizaId"].ToString());
            pobierzPodsumowanie(Request.QueryString["analizaId"].ToString());
        }

        protected void wyswietlDetailView1(string id)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.numerAnalizy FROM " +
                    "SurowceAnalizy sa, RodzajeAnaliz ra WHERE sa.id=@id " +
                    "AND ra.analizaId=sa.rodzaj", con);

                cmd.Parameters.AddWithValue("nrSpec", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsViewNaglowek1.DataSource = dt;
                DetailsViewNaglowek1.DataBind();
            }
            catch (Exception ex)
            {
                //LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void wyswietlDetailView2(string id)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.surowiec, sa.seria, sa.dataPobraniaProby As data, " +
                    "p.imieNazwisko As pobral FROM " +
                    "SurowceAnalizy sa, Pracownicy p WHERE sa.id=@id AND " +
                    "p.pracownikId=sa.pobral", con);

                cmd.Parameters.AddWithValue("nrSpec", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView2.DataSource = dt;
                DetailsView2.DataBind();
            }
            catch (Exception ex)
            {
                //LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void wyswietlDetailView3(string id)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT o.nazwa As nazwaOddzialu, ps.nazwa As nazwaPunktu, sa.dostawca, sa.ilosc FROM " +
                    "SurowceAnalizy sa, Oddzialy o, PunktySkupowe ps WHERE sa.id=@id AND " +
                    "o.oddzialId=sa.oddzial AND ps.punktId=sa.punktSkupowy", con);

                cmd.Parameters.AddWithValue("nrSpec", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView3.DataSource = dt;
                DetailsView3.DataBind();
            }
            catch (Exception ex)
            {
                //LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void wyswietlDetailView4a(string id)
        {
            // pobieram nr specyfikacji z tabeli SurowceAnalizy
            string nrSpec = "";
            OleDbDataReader reader = null;
            OleDbConnection con1 = MyConnection.getConnStrOle();
            con1.Open();
            OleDbCommand cmd1 = new OleDbCommand("SELECT numerSpecyfikacji FROM SurowceAnalizy WHERE id = @id", con1);
            cmd1.Parameters.AddWithValue("id", id);
            reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                nrSpec = (reader[0].ToString());
            }
            con1.Close();
            reader.Close();

            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT ss.cecha1, ss.wymagania1, sa.wymagania1 As wymagania1a, " +
                        "ss.cecha2, ss.wymagania2, sa.wymagania2 As wymagania2a, ss.cecha3, ss.wymagania3, sa.wymagania3 As wymagania3a, ss.cecha4, " +
                        "ss.wymagania4, sa.wymagania4 As wymagania4a, ss.cecha5, ss.wymagania5, sa.wymagania5 As wymagania5a, ss.cecha6, ss.wymagania6, " +
                        "sa.wymagania6 As wymagania6a, ss.cecha7, ss.wymagania7, sa.wymagania7 As wymagania7a, ss.cecha8, ss.wymagania8, " +
                        "sa.wymagania8 As wymagania8a, ss.cecha9, ss.wymagania9, sa.wymagania9 As wymagania9a, ss.cecha10, ss.wymagania10, " +
                        "sa.wymagania10 As wymagania10a, ss.cecha11, ss.wymagania11, sa.wymagania11 As wymagania11a, ss.cecha12, ss.wymagania12, " +
                        "sa.wymagania12 As wymagania12a, " +
                        "ss.cecha13, ss.wymagania13, sa.wymagania13 As wymagania13a, " +
                        "ss.cecha14, ss.wymagania14, sa.wymagania14 As wymagania14a, ss.cecha15, ss.wymagania15, sa.wymagania15 As wymagania15a, ss.cecha16, " +
                        "ss.wymagania16, sa.wymagania16 As wymagania16a, ss.cecha17, ss.wymagania17, sa.wymagania17 As wymagania17a, ss.cecha18, ss.wymagania18, sa.wymagania18 As wymagania18a, ss.cecha19, ss.wymagania19, sa.wymagania19 As wymagania19a, ss.cecha20, ss.wymagania20, sa.wymagania20 As wymagania20a, " +
                        "ss.cecha21, ss.wymagania21, sa.wymagania21 As wymagania21a, ss.cecha22, ss.wymagania22, sa.wymagania22 As wymagania22a " +
                        "FROM SpecyfikacjeSurowcow ss, SurowceAnalizy sa WHERE ss.numer=@numer AND sa.id=@id", con);

                cmd.Parameters.AddWithValue("numer", nrSpec);
                cmd.Parameters.AddWithValue("id", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView4a.DataSource = dt;
                DetailsView4a.DataBind();
            }
            catch (Exception ex)
            {
                //LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void wyswietlDetailView6(string id)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.orzeczenie, p.imieNazwisko As wykonal FROM " +
                    "SurowceAnalizy sa, Pracownicy p WHERE sa.id=@id AND sa.wykonujacy=p.pracownikId", con);

                cmd.Parameters.AddWithValue("nrSpec", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView6.DataSource = dt;
                DetailsView6.DataBind();
            }
            catch (Exception ex)
            {
                //LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        protected void pobierzPodsumowanie(string id)
        {
            bool zw =false;
            bool zwar = false;
            bool nzw = false;
            OleDbDataReader reader = null;
            OleDbConnection con1 = MyConnection.getConnStrOle();
            con1.Open();
            OleDbCommand cmd1 = new OleDbCommand("SELECT zwolniony, zwolnionyWarunkowo, " +
                "niezwolniony FROM SurowceAnalizy WHERE id = @id", con1);
            cmd1.Parameters.AddWithValue("id", id);
            reader = cmd1.ExecuteReader();
            while (reader.Read())
            {
                zw = (Convert.ToBoolean(reader[0]));
                zwar = (Convert.ToBoolean(reader[1]));
                nzw = (Convert.ToBoolean(reader[2]));
            }
            if (zw)
            {
                LabelOrzeczenie.Text = "SUROWIEC ZWOLNIONY";
                LabelOrzeczenie.ForeColor = System.Drawing.Color.Green;
            }
            else if (zwar)
            {
                LabelOrzeczenie.Text = "SUROWIEC ZWOLNIONY WARUNKOWO";
                LabelOrzeczenie.ForeColor = System.Drawing.Color.FromArgb(255, 127, 36);
            }
            else if (nzw)
            {
                LabelOrzeczenie.Text = "SUROWIEC NIE ZWOLNIONY";
                LabelOrzeczenie.ForeColor = System.Drawing.Color.Red;
            }
            else
                LabelOrzeczenie.Text = "niewyszlo";
            con1.Close();
            reader.Close();
        }

        protected void DetailsView4a_DataBound(object sender, EventArgs e)
        {
            //DetailsView4a.Rows[20].BorderColor = System.Drawing.Color.Red;

            //Label objLabel = (Label)DetailsView4a.FindControl("Label111");
            //if (objLabel.Text != "")
            //{
            //    string decValue = Convert.ToString(objLabel.Text);
            //    if (decValue != "")
            //    {
            //        objLabel.ForeColor = System.Drawing.Color.Green;
            //    }
            //    else if (decValue != "")
            //    {
            //        objLabel.ForeColor = System.Drawing.Color.Red;
            //    }
            //    else
            //        //objLabel.ForeColor = System.Drawing.Color.Red;
            //        DetailsView4a.Rows[18].BorderColor = System.Drawing.Color.Red;
            //}

            if (DetailsView4a.Rows.ToString() != "")
            {
                DetailsView4a.Rows[3].Cells[1].CssClass = "changefont";

            }
   
        }

        protected void DetailsView4a_PreRender(object sender, EventArgs e)
        {

            //ChangeColor(this.Controls);
 
            //base.OnPreRender(e);
 
        }


        private void ChangeColor(ControlCollection controls)
        {

            foreach (Control c in controls)
            {
                if (c.HasControls())
                    ChangeColor(c.Controls);
                else if (c is DetailsView)
                {
                    DetailsView view = c as DetailsView;
                    foreach (DetailsViewRow row in view.Rows)
                    {
                        ChangeColor(row.Controls);
                    }
                }
                else
                {
                    if (c is WebControl) ((WebControl)c).ForeColor =
                    System.Drawing.Color.DeepPink;
                }


            }
        }
        
    }
}