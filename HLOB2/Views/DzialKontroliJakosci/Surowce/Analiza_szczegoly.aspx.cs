using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Analiza_szczegoly : System.Web.UI.Page
    {
        string specyfikacja;         // zmienna pomocnicza, np do javascript
        string analizaId;
        string s1;
        string s2;
        string s3;
        string s4;
        string s5;
        string s6;
        string s7;
        string s8;
        string s9;
        bool s10;
        bool s11;
        bool s12;
        string s13;
        string s14;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                s1 = s2 = s3 = s4 = s5 = s6 = s7 = "";
                analizaId = Request.QueryString["analizaId"].ToString();
                pobierzDaneZQueryStringa(analizaId);
                wyswietlSzczegolySpecyfikacji(DetailsViewFormularz2.Rows[2].Cells[1].Text);
                LabelSurowiec.Text = (((TextBox)DetailsViewFormularz2.FindControl("TextBoxTytul")).Text).ToString();
                LabelNrSpecyfikacji.Text = DetailsViewFormularz2.Rows[2].Cells[1].Text;
            }

            LabelError.Text = "";


        }


        // ******************************** WYŚWIETL LISTVIEW NAGŁÓWEK *********************************/

        protected void wyswietlNaglowekIPodsumowanie(string analizaId)
        {
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.numerAnalizy, o.oddzialId, ps.punktId, sa.dostawca, " +
                        "sa.ilosc, p.pracownikId, sa.dataPobraniaProby, sa.wykonujacy, sa.dataWykonania, sa.zwolniony, " +
                        "sa.zwolnionyWarunkowo, sa.niezwolniony, sa.orzeczenie, sa.uwagi FROM SurowceAnalizy sa, Oddzialy o, Pracownicy p, " +
                        "PunktySkupowe ps WHERE sa.id=@analizaId AND sa.oddzial=o.oddzialId AND sa.wykonujacy=p.pracownikId AND " +
                        "sa.punktSkupowy=ps.punktId;", con);

                cmd.Parameters.AddWithValue("analizaId", analizaId);
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        s1 = (reader[0].ToString());
                        s2 = (reader[1].ToString());
                        s3 = (reader[2].ToString());
                        s4 = (reader[3].ToString());
                        s5 = (reader[4].ToString());
                        s6 = (reader[5].ToString());
                        s7 = (reader[6].ToString());
                        s8 = (reader[7].ToString());
                        s9 = (reader[8].ToString());
                        s10 = Convert.ToBoolean(reader[9].ToString());
                        s11 = Convert.ToBoolean(reader[10].ToString());
                        s12 = Convert.ToBoolean(reader[11].ToString());
                        s13 = (reader[12].ToString());
                        s14 = (reader[13].ToString());
                        //s1 = ((TextBox)ListViewNaglowek.Items[0].FindControl("numerAnalizyLabel")).Text = (reader[0].ToString());
                        //s2 = ((DropDownList)ListViewNaglowek.Items[0].FindControl("DropDownListOddzial")).SelectedValue = (reader[1].ToString());
                        //s3 = ((DropDownList)ListViewNaglowek.Items[0].FindControl("DropDownListPunktSkupu")).SelectedValue = (reader[2].ToString());
                        //s4 = ((TextBox)ListViewNaglowek.Items[0].FindControl("TextBoxDostawca")).Text = (reader[3].ToString());
                        //s5 = ((TextBox)ListViewNaglowek.Items[0].FindControl("TextBoxWaga")).Text = (reader[4].ToString());
                        //s6 = ((DropDownList)ListViewNaglowek.Items[0].FindControl("DropDownListPobral")).SelectedValue = (reader[5].ToString());
                        //s7 = ((TextBox)ListViewNaglowek.Items[0].FindControl("dataPobraniaProbyLabel")).Text = (reader[6].ToString()); 
                    }
                }
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
                reader.Close();
            }
        }

        /*************************        WYŚWIETL DETAILLIST - SPECYFIKACJA         *********************/

        protected void wyswietlSzczegolySpecyfikacji(string nrSpecyfikacji)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT ss.tytul, ss.numer, ss.przeznaczenie, ss.dataAktualizacji, ss.cecha1, ss.wymagania1, " +
                    "ss.cecha2, ss.wymagania2, ss.cecha3, ss.wymagania3, ss.cecha4, ss.wymagania4, " +
                    "ss.cecha5, ss.wymagania5, ss.cecha6, ss.wymagania6, ss.cecha7, ss.wymagania7, " +
                    "ss.cecha8, ss.wymagania8, ss.cecha9, ss.wymagania9, ss.cecha10, ss.wymagania10, " +
                    "ss.cecha11, ss.wymagania11, ss.cecha12, ss.wymagania12, ss.cecha13, ss.wymagania13, " +
                    "ss.cecha14, ss.wymagania14,ss.cecha15, ss.wymagania15, ss.cecha16, ss.wymagania16, " +
                    "ss.cecha17, ss.wymagania17, ss.cecha18, ss.wymagania18, ss.cecha19, ss.wymagania19, " +
                    "ss.cecha20, ss.wymagania20 FROM " +
                    "SpecyfikacjeSurowcow ss WHERE ss.numer=@nrSpec;", con);

                cmd.Parameters.AddWithValue("nrSpec", nrSpecyfikacji);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsViewSpecyfikacja.DataSource = dt;
                DetailsViewSpecyfikacja.DataBind();
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        //  ********************************* WYŚWIETL FORMULARZ *****************************************************/
        protected void pobierzDaneZQueryStringa(string analizaId)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT ss.surowiec, ss.numerSpecyfikacji, ss.przeznaczenie, ss.specZDnia, ss.cecha1, ss.wymagania1, " +
                    "ss.cecha2, ss.wymagania2, ss.cecha3, ss.wymagania3, ss.cecha4, ss.wymagania4, " +
                    "ss.cecha5, ss.wymagania5, ss.cecha6, ss.wymagania6, ss.cecha7, ss.wymagania7, " +
                    "ss.cecha8, ss.wymagania8, ss.cecha9, ss.wymagania9, ss.cecha10, ss.wymagania10, " +
                    "ss.cecha11, ss.wymagania11, ss.cecha12, ss.wymagania12, ss.cecha13, ss.wymagania13, " +
                    "ss.cecha14, ss.wymagania14,ss.cecha15, ss.wymagania15, ss.cecha16, ss.wymagania16, " +
                    "ss.cecha17, ss.wymagania17, ss.cecha18, ss.wymagania18, ss.cecha19, ss.wymagania19, " +
                    "ss.cecha20, ss.wymagania20 FROM " +
                    "SurowceAnalizy ss WHERE ss.id=@analizaId;", con);

                cmd.Parameters.AddWithValue("analizaId", analizaId);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsViewFormularz2.DataSource = dt;
                DetailsViewFormularz2.DataBind();
            }
            catch (Exception ex)
            {
                LabelError.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }
        }

        /**************************       ZAŁÓŻ NOWY REKORD W TABELI SUROWCEANALIZY      ***********************/

        //cmd.Parameters.AddWithValue("cecha7", DetailsViewFormularz2.Rows[15].Cells[1].Text.ToString());       <---- odczyt z pola DATABIND (do wiadomości)

        protected void zalozRekord()
        {

            LabelError.Text = "";
            OleDbConnection con = MyConnection.getConnStrOle();

            OleDbCommand cmd =
                new OleDbCommand("INSERT INTO SurowceAnalizy (numerAnalizy, tytul, " +
                    "oddzial, punktSkupowy, dostawca, ilosc, " +
                    "dataPobraniaProby, pobral, przeznaczenie" +

                    ", specZDnia, cecha1, wymagania1, cecha2, wymagania2, cecha3, wymagania3" +
                    ", cecha4, wymagania4, cecha5, wymagania5, cecha6, wymagania6, cecha7, wymagania7" +
                    ", cecha8, wymagania8, cecha9, wymagania9, cecha10, wymagania10, cecha11, wymagania11" +
                    ", cecha12, wymagania12, cecha13, wymagania13, cecha14, wymagania14, cecha15, wymagania15" +
                    ", cecha16, wymagania16, cecha17, wymagania17, cecha18, wymagania18, cecha19, wymagania19" +
                    ", cecha20, wymagania20" +

                    ", wykonujacy, orzekajacy, dataWykonania, dataDodania, zwolniony, zwolnionyWarunkowo, niezwolniony, orzeczenie, uwagi) " +

                    "VALUES (" +
                    "@numerAnalizy, @tytul, @oddzial, " +
                    "@punktSkupowy, @dostawca, @ilosc, @dataPobraniaProby, @pobral, @przeznaczenie" +

                    ", @specZDnia, @cecha1, @wymaganie1, @cecha2, @wymaganie2, @cecha3, @wymaganie3" +
                    ", @cecha4, @wymaganie4, @cecha5, @wymaganie5, @cecha6, @wymaganie6, @cecha7, @wymaganie7" +
                    ", @cecha8, @wymaganie8, @cecha9, @wymaganie9, @cecha10, @wymaganie10, @cecha11, @wymaganie11" +
                    ", @cecha12, @wymaganie12, @cecha13, @wymaganie13, @cecha14, @wymaganie14, @cecha15, @wymaganie15" +
                    ", @cecha16, @wymaganie16, @cecha17, @wymaganie17, @cecha18, @wymaganie18, @cecha19, @wymaganie19" +
                    ", @cecha20, @wymaganie20" +

                    ", @wykonujacy, @orzekajacy, @dataWykonania, @dataDodania, @zwolniony, @zwolnionyWar, @niezwolniony, @orzeczenie, @uwagi);", con);

            // wartości z listviewNagłówek
            cmd.Parameters.AddWithValue("numerAnalizy", (((TextBox)ListViewNaglowek.
                                                        Items[0].
                                                        FindControl("numerAnalizyLabel")).Text).ToString());
            cmd.Parameters.AddWithValue("tytul", DetailsViewSpecyfikacja.Rows[0].Cells[1].Text.ToString());
            cmd.Parameters.AddWithValue("oddzial", ((DropDownList)ListViewNaglowek.
                                                        Items[0].FindControl("DropDownListOddzial")).
                                                        SelectedValue);
            cmd.Parameters.AddWithValue("punktSkupowy", ((DropDownList)ListViewNaglowek.
                                                        Items[0].FindControl("DropDownListPunktSkupu")).
                                                        SelectedValue);
            cmd.Parameters.AddWithValue("dostawca", (((TextBox)ListViewNaglowek.Items[0].
                                                        FindControl("TextBoxDostawca")).Text).ToString());
            cmd.Parameters.AddWithValue("ilosc", (((TextBox)ListViewNaglowek.Items[0].
                                                        FindControl("TextBoxWaga")).Text).ToString());
            cmd.Parameters.AddWithValue("dataPobraniaProby", (((TextBox)ListViewNaglowek.Items[0].
                                                        FindControl("dataPobraniaProbyLabel")).Text).ToString());
            cmd.Parameters.AddWithValue("pobral", (((DropDownList)ListViewNaglowek.
                                                        Items[0].FindControl("DropDownListPobral")).
                                                        SelectedValue).ToString());
            cmd.Parameters.AddWithValue("przeznaczenie", DetailsViewSpecyfikacja.Rows[3].Cells[1].Text.ToString());

            ////wartości z formularz2
            cmd.Parameters.AddWithValue("specZDnia", DetailsViewFormularz2.Rows[4].Cells[1].Text);

            cmd.Parameters.AddWithValue("cecha1", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha1")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie1", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania1")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha2", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha2")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie2", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania2")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha3", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha3")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie3", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania3")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha4", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha4")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie4", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania4")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha5", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha5")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie5", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania5")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha6", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha6")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie6", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania6")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha7", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha7")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie7", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania7")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha8", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha8")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie8", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania8")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha9", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha9")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie9", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania9")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha10", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha10")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie10", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania10")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha11", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha11")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie11", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania11")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha12", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha12")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie12", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania12")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha13", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha13")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie13", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania13")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha14", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha14")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie14", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania14")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha15", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha15")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie15", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania15")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha16", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha16")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie16", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania16")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha17", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha17")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie17", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania17")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha18", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha18")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie18", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania18")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha19", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha19")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie19", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania19")).Text).ToString());

            cmd.Parameters.AddWithValue("cecha20", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha20")).Text).ToString());
            cmd.Parameters.AddWithValue("wymaganie20", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania20")).Text).ToString());

            //wartości z orzeczenie
            cmd.Parameters.AddWithValue("wykonujacy", ((DropDownList)ListViewPodsumowanie.Items[0].
                                                        FindControl("DropDownListAnalizeWykonal")).
                                                        SelectedValue);
            cmd.Parameters.AddWithValue("orzekajacy", MySession.Current.imieNazwisko);
            cmd.Parameters.AddWithValue("dataWykonania", (((TextBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("dataWykonaniaBadania")).Text).ToString());
            cmd.Parameters.AddWithValue("dataDodania", DateTime.Now.ToOADate());
            cmd.Parameters.AddWithValue("zwolniony", ((CheckBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("zwolnionyCheckBox")).Checked);
            cmd.Parameters.AddWithValue("zwolnionyWar", ((CheckBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("zwolnionyWarunkowoCheckBox")).Checked);
            cmd.Parameters.AddWithValue("niezwolniony", ((CheckBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("NiezwolnionyCheckBox")).Checked);
            cmd.Parameters.AddWithValue("orzeczenie", (((TextBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("TextBoxOrzeczenie")).Text).ToString());
            cmd.Parameters.AddWithValue("uwagi", (((TextBox)ListViewPodsumowanie.Items[0].
                                                        FindControl("TextBoxUwagi")).Text).ToString());

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (OleDbException err)
            {
                LabelError.Text = err.ToString();
            }
            finally
            {
                con.Close();
            }
        }



        /**************************************** INSERT CLICK DO BAZY DANYCH ********************************/

        protected void ButtonZapisz_Click(object sender, EventArgs e)
        {
            //pobierzIdAliasuIdSurowca(DropDownListSurowce.SelectedValue.ToString());
            //if (walidacja())
            //{
            //    zalozRekord();
            //    Page.Response.Redirect("~/Views/DzialKontroliJakosci/Surowce/Analizy_surowcow.aspx?aliasId=" +
            //                            aliasId);
            //}
            //else
            //{
            //    walidacja();
            //}
        }


        /************ SPRAWDZ CZY ANALIZA ISTNIEJE W BAZIE  CZY DATY ZANZACZONE, CZY ANALIZA WPISANA (WALIDACJA) *********************/

        //protected bool walidacja()
        //{
        //LabelError.Text = "";
        //OleDbConnection conn = MyConnection.getConnStrOle();
        //conn.Open();
        //OleDbCommand sprawdzDane =
        //    new OleDbCommand("SELECT COUNT(*) FROM SurowceAnalizy WHERE numerAnalizy LIKE @analiza" +
        //                        " AND rodzaj LIKE @rodzaj AND aliasId LIKE @aliasId", conn);
        //sprawdzDane.Parameters.AddWithValue("analiza", (((TextBox)ListViewNaglowek.
        //                                                Items[0].
        //                                                FindControl("numerAnalizyLabel")).Text).ToString());
        //sprawdzDane.Parameters.AddWithValue("rodzaj", DropDownListRodzajAnalizy.SelectedValue);
        //sprawdzDane.Parameters.AddWithValue("aliasId", aliasId);

        //int temp = Convert.ToInt32(sprawdzDane.ExecuteScalar().ToString());

        //if (temp == 1)
        //{
        //    LabelError.Visible = true;
        //    LabelError.Text = "Numer analizy istnieje w bazie";
        //    return false;
        //}
        //else if (((((TextBox)ListViewNaglowek.Items[0].FindControl("numerAnalizyLabel")).Text).ToString() == ""
        //    || (((TextBox)ListViewNaglowek.Items[0].FindControl("dataPobraniaProbyLabel")).Text).ToString() == ""
        //    || (((TextBox)ListViewPodsumowanie.Items[0].FindControl("dataWykonaniaBadania")).Text).ToString() == ""))
        //{
        //    LabelError.Visible = true;
        //    LabelError.Text = "Wypełnij wymagane pola: " + "<br />" +
        //                                              "&bull;" + " nr analizy" + "<br />" +
        //                                              "&bull;" + " data pobrania próby" + "<br />" +
        //                                              "&bull;" + " data wykonania analizy" + "<br />";
        //    return false;
        //}
        //else if (((CheckBox)ListViewPodsumowanie.Items[0].
        //                                         FindControl("zwolnionyCheckBox")).Checked == false
        //     && ((CheckBox)ListViewPodsumowanie.Items[0].
        //                                         FindControl("zwolnionyWarunkowoCheckBox")).Checked == false
        //     && ((CheckBox)ListViewPodsumowanie.Items[0].
        //                                         FindControl("NiezwolnionyCheckBox")).Checked == false)
        //{
        //    LabelError.Visible = true;
        //    LabelError.Text = "Zaznacz jedno z pól: " + "<br />" +
        //                                              "&bull;" + " surowiec zwolniony" + "<br />" +
        //                                              "&bull;" + " surowiec zwolniony warunkowo" + "<br />" +
        //                                              "&bull;" + " surowiec nie zwolniony" + "<br />";
        //    return false;
        //}
        //else if (temp != 1)
        //{
        //    return true;
        //}
        //else
        //    return false;
        //}

        //  podczepienie zdarzenia pod checkboxy w celu dodania orzeczenia

        protected void ListViewPodsumowanie_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            CheckBox zwolnionyCheckbox;
            CheckBox warunkowoCheckbox;
            CheckBox nieZwolnionyCheckbox;
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                DropDownList DropDownListAnalizeWykonal = (DropDownList)e.Item.FindControl("DropDownListAnalizeWykonal");
                DropDownListAnalizeWykonal.SelectedValue = s8;

                TextBox dataWykonaniaBadania = (TextBox)e.Item.FindControl("dataWykonaniaBadania");
                dataWykonaniaBadania.Text = Convert.ToDateTime(s9).ToString("dd-MM-yyyy");

                zwolnionyCheckbox = (CheckBox)e.Item.FindControl("zwolnionyCheckBox");
                zwolnionyCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + zwolnionyCheckbox.ClientID + "')");
                zwolnionyCheckbox.Checked = s10;

                warunkowoCheckbox = (CheckBox)e.Item.FindControl("zwolnionyWarunkowoCheckBox");
                warunkowoCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + warunkowoCheckbox.ClientID + "')");
                warunkowoCheckbox.Checked = s11;

                nieZwolnionyCheckbox = (CheckBox)e.Item.FindControl("NiezwolnionyCheckBox");
                nieZwolnionyCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + nieZwolnionyCheckbox.ClientID + "')");
                nieZwolnionyCheckbox.Checked = s12;

                TextBox TextBoxOrzeczenie = (TextBox)e.Item.FindControl("TextBoxOrzeczenie");
                TextBoxOrzeczenie.Text = s13;

                TextBox TextBoxUwagi = (TextBox)e.Item.FindControl("TextBoxUwagi");
                TextBoxUwagi.Text = s14;
            }
        }

        protected void ListViewNaglowek_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            wyswietlNaglowekIPodsumowanie(Request.QueryString["analizaId"].ToString());

            TextBox ddl1 = (TextBox)e.Item.FindControl("numerAnalizyLabel");
            ddl1.Text = (s1);

            DropDownList ddl2 = (DropDownList)e.Item.FindControl("DropDownListOddzial");
            ddl2.SelectedValue = (s2);

            DropDownList ddl3 = (DropDownList)e.Item.FindControl("DropDownListPunktSkupu");
            ddl3.SelectedValue = (s3);

            TextBox ddl4 = (TextBox)e.Item.FindControl("TextBoxDostawca");
            ddl4.Text = (s4);

            TextBox ddl5 = (TextBox)e.Item.FindControl("TextBoxWaga");
            ddl5.Text = (s5);

            DropDownList ddl16 = (DropDownList)e.Item.FindControl("DropDownListPobral");
            ddl16.SelectedValue = (s6);

            TextBox ddl7 = (TextBox)e.Item.FindControl("dataPobraniaProbyLabel");
            ddl7.Text = Convert.ToDateTime(s7).ToString("dd-MM-yyyy");
        }
    }
}