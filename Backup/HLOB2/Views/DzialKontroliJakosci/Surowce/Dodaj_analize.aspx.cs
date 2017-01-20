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
    public partial class Dodaj_analize : System.Web.UI.Page
    {
        int count = 0;
        int surowiecId;                                             // deklaracja zmiennych
        int aliasId;

        List<string> specyfikacjeIndeks = null;
        List<string> specyfikacjeAlias = null;
        Dictionary<int, string> punktySkupowe = null;
        bool indeks = true;         //  zmienna do wyświetlania specyfikacji
        string specyfikacja;         // zmienna pomocnicza, np do javascript

        protected void Page_Load(object sender, EventArgs e)                                        // Page Load
        {
            surowiecId = 0;
            aliasId = 0;
            count = 0;
            //specyfikacjeIndeks = null;
            //specyfikacjeAlias = null;
            LabelError.Text = "";
            if (CheckBoxBrakIndeksu.Checked)
            {
                indeks = false;
            }
            else
            {
               indeks = true;
            }
        }

        //  Wybranie rodzaju analizy -> odblokowuje listę z surowcami
        protected void DropDownListRodzajAnalizy_SelectedIndexChanged(object sender, EventArgs e)   // wybierz analizę
        {
            DropDownListSurowce.Enabled = true;
            DropDownListSurowce.Enabled = true;
            CheckBoxBrakIndeksu.Enabled = true;
            DropDownListSpecyfikacje.Enabled = true;
        }

        //  Wybranie surowca -> odblokowuje listę ze specyfikacjami
        protected void DropDownListSurowce_SelectedIndexChanged(object sender, EventArgs e)         // wybierz surowiec/alias
        {
            if (indeks)
            {
                wyswietlSpecyfikacjeIndeks(DropDownListSurowce.SelectedValue.ToString());
                LabelCount.Text = "(" + count.ToString() + ")";
            }
            else if (!indeks)
            {
                wyswietlSpecyfikacjeAlias(DropDownListSurowce.SelectedValue.ToString());
                LabelCount.Text = "(" + count.ToString() + ")";
            }

            //zdarzenia wykonywujace sie zamiast Button_Click
            if (DropDownListSpecyfikacje.SelectedIndex != -1)
            {
                wyswietlSzczegolySpecyfikacji(DropDownListSpecyfikacje.SelectedItem.ToString());
                wyswietlOpisSubstancjiRoslinnej(DropDownListSpecyfikacje.SelectedItem.ToString());
                DetailsViewSpecyfikacja.Visible = true;
                UpdatePanel3.Visible = true;
                DetailsViewFormularz2.Visible = true;
                LabelWymaganiaJakosciowe.Visible = true;
                LabelWynikiBadania.Visible = true;
                LabelWykonawca.Text = MySession.Current.stanowisko + " - " + MySession.Current.imieNazwisko;
                LabelWykonawca.Visible = true;
                ListViewPodsumowanie.Visible = true;
                ButtonZapisz.Visible = true;
                LabelWykonawca.Visible = true;
                //DetailsViewFormularz2.Rows[0].Cells[1].Text = DropDownListSurowce.SelectedItem.ToString();

            }
            else
            {
                DetailsViewSpecyfikacja.Visible = false;
                UpdatePanel3.Visible = false;
                DetailsViewFormularz2.Visible = false;
                LabelWymaganiaJakosciowe.Visible = false;
                LabelWynikiBadania.Visible = false;
                ListViewPodsumowanie.Visible = false;
                ButtonZapisz.Visible = false;
                LabelWykonawca.Visible = false;
            }
        }

        //  Zaznaczenie checkboxa - aliasy, odznaczenie - indeksy
        protected void CheckBoxBrakIndeksu_CheckedChanged(object sender, EventArgs e)               // wybierz brak indeksu
        {
            if (CheckBoxBrakIndeksu.Checked == true)
            {
                wyswietlSurowceAliasy();
                specyfikacjeIndeks = null;
                specyfikacjeAlias = null;
                wyswietlSpecyfikacjeAlias("-1");
                LabelCount.Text = "";
                indeks = false;         
            }
            else if (CheckBoxBrakIndeksu.Checked == false)
            {
                wyswietlSurowceIndeksy();
                specyfikacjeIndeks = null;
                specyfikacjeAlias = null;
                wyswietlSpecyfikacjeIndeks("-1");
                LabelCount.Text = "";
                indeks = true;
            }
        }

        protected void wyswietlSurowceIndeksy()                                                    // połacz liste surowce z AccessDataSourceIndeksy
        {
            DropDownListSurowce.DataSourceID = "AccessDataSourceIndeksy";
            DropDownListSurowce.DataTextField = "nazwa";                    // indeks+nazwa
            DropDownListSurowce.DataValueField = "surowiec";                // nazwa
        }

        protected void wyswietlSurowceAliasy()                                                    // połącz listę z AccessDataSourceAliasy
        {
            DropDownListSurowce.DataSourceID = "AccessDataSourceAliasy";
            DropDownListSurowce.DataTextField = "nazwa";                    // nazwa
            DropDownListSurowce.DataValueField = "nazwa";                   // nazwa
        }


        /*************************        WYŚWIETL SPECYFIKACJE PO WYBORZE SUROWCA         ************************/

        protected void wyswietlSpecyfikacjeIndeks(string surowiec)
        {
            specyfikacjeIndeks = new List<string>();
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();

            OleDbCommand cmd =
                new OleDbCommand("SELECT ss.numer FROM SpecyfikacjeSurowcow ss, " +
                                "AliasySpecyfikacje asp, SurowceAliasy sa, Surowce s " +
                                "WHERE s.nazwa LIKE @surowiec AND s.alias=sa.aliasId " +
                                "AND sa.aliasId=asp.aliasId " +
                                "AND asp.specyfikacjaId=ss.specyfikacjaId;", con);

            cmd.Parameters.AddWithValue("surowiec", surowiec);
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    specyfikacjeIndeks.Add(reader.GetString(0));
                    count++;
                }

                DropDownListSpecyfikacje.DataSource = specyfikacjeIndeks;
                DropDownListSpecyfikacje.DataBind();
                DropDownListSpecyfikacje.Enabled = true;
            }
            catch (OleDbException err)
            {
                LabelError.Text = err.ToString();
            }
            finally
            {
                reader.Close();
                con.Close();
            }
        }

        /*****************************  WYŚWIETL OPIS SUBSTANCJI ROŚLINNEJ ***********************************/

        protected void wyswietlOpisSubstancjiRoslinnej(string nrAnalizy)
        {
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();

            OleDbCommand cmd =
                new OleDbCommand("SELECT opisSubstancji1Tytul, opisSubstancji1, opisSubstancji2Tytul, opisSubstancji2, " +
                    "opisSubstancji3Tytul, opisSubstancji3, opisSubstancji4Tytul, opisSubstancji4, " +
                    "opisSubstancji5Tytul, opisSubstancji5, opisSubstancji6Tytul, opisSubstancji6, opisSubstancji7Tytul, " +
                    "opisSubstancji7, nazwaSubstancji FROM SpecyfikacjeSurowcow " +
                                "WHERE numer LIKE @nrAnalizy;", con);

            cmd.Parameters.AddWithValue("nrAnalizy", nrAnalizy);
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        LabelOpisSubstancji1Tytul.Text = (reader[0]).ToString();
                        LabelOpisSubstancji1.Text = (reader[1]).ToString();
                        LabelOpisSubstancji2Tytul.Text = (reader[2]).ToString();
                        LabelOpisSubstancji2.Text = (reader[3]).ToString();
                        LabelOpisSubstancji3Tytul.Text = (reader[4]).ToString();
                        LabelOpisSubstancji3.Text = (reader[5]).ToString();
                        LabelOpisSubstancji4Tytul.Text = (reader[6]).ToString();
                        LabelOpisSubstancji4.Text = (reader[7]).ToString();
                        LabelOpisSubstancji5Tytul.Text = (reader[8]).ToString();
                        LabelOpisSubstancji5.Text = (reader[9]).ToString();
                        LabelOpisSubstancji6Tytul.Text = (reader[10]).ToString();
                        LabelOpisSubstancji6.Text = (reader[11]).ToString();
                        LabelOpisSubstancji7Tytul.Text = (reader[12]).ToString();
                        LabelOpisSubstancji7.Text = (reader[13]).ToString();
                        string s = LabelNazwaSubstancji.Text = (reader[14]).ToString();
                    }
                }

            }
            catch (OleDbException err)
            {
                LabelError.Text = err.ToString();
            }
            finally
            {
                con.Close();
                reader.Close();
            }
        }

        /*************************        WYŚWIETL SPECYFIKACJE PO WYBORZE ALIASU        ************************/

        protected void wyswietlSpecyfikacjeAlias(string alias)
        {
            specyfikacjeAlias = new List<string>();
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();

            OleDbCommand cmd =
                new OleDbCommand("SELECT ss.numer FROM SpecyfikacjeSurowcow ss, " +
                                "AliasySpecyfikacje asp, SurowceAliasy sa " +
                                "WHERE sa.nazwa LIKE @alias AND sa.aliasId=asp.aliasId " +
                                "AND asp.specyfikacjaId=ss.specyfikacjaId;", con);

            cmd.Parameters.AddWithValue("aliasId", alias);
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    specyfikacjeAlias.Add(reader.GetString(0));
                    count++;
                }

                DropDownListSpecyfikacje.DataSource = specyfikacjeAlias;
                DropDownListSpecyfikacje.DataBind();
                DropDownListSpecyfikacje.Enabled = true;

            }
            catch (OleDbException err)
            {
                LabelError.Text = err.ToString();
            }
            finally
            {
                reader.Close();
                con.Close();
            }
        }


        /*************************          WYŚWIETL DETAILLIST  FORMULARZ (BUTTON CLICK)          *************************/

        protected void WyswietlFormularz_Click(object sender, EventArgs e)       
        {
            if (DropDownListSpecyfikacje.SelectedIndex != -1)
            {
                wyswietlSzczegolySpecyfikacji(DropDownListSpecyfikacje.SelectedItem.ToString());
                wyswietlOpisSubstancjiRoslinnej(DropDownListSpecyfikacje.SelectedItem.ToString());
                DetailsViewSpecyfikacja.Visible = true;
                UpdatePanel3.Visible = true;
                DetailsViewFormularz2.Visible = true;
                LabelWymaganiaJakosciowe.Visible = true;
                LabelWynikiBadania.Visible = true;
                LabelWykonawca.Text = MySession.Current.stanowisko + " - " + MySession.Current.imieNazwisko;
                LabelWykonawca.Visible = true;
            }
            else
            {
                DetailsViewSpecyfikacja.Visible = false;
                DetailsViewFormularz2.Visible = false;
                UpdatePanel3.Visible = false;
                LabelWymaganiaJakosciowe.Visible = false;
                LabelWynikiBadania.Visible = false;
            }
        }


        /***********************      WYŚWIETL INSERT W LABELU (test)   ************************/

        protected void wyswietlLabelError()
        {
            LabelError.Text = " numer analizy: " +
                    (((TextBox)ListViewNaglowek.Items[0].FindControl("numerAnalizyLabel")).Text).ToString() +
                " rodzaj : " + DropDownListRodzajAnalizy.SelectedValue.ToString() +
                " jest indeks: " +
                CheckBoxBrakIndeksu.Checked.ToString() +
                " alias surowca: " +
                DropDownListSurowce.SelectedItem.ToString() +
                " surowiec : " + DropDownListSurowce.SelectedItem.ToString() +
                " oddział : " + ((DropDownList)ListViewNaglowek.
                                                Items[0].FindControl("DropDownListOddzial")).
                                                SelectedValue.ToString() +
                " punktSkupowy: " + ((DropDownList)ListViewNaglowek.
                                                Items[0].FindControl("DropDownListPunktSkupu")).
                                                SelectedValue.ToString() +
                " dostawca: " + (((TextBox)ListViewNaglowek.Items[0].
                                                FindControl("TextBoxDostawca")).Text).ToString() +
                " ilość: " + (((TextBox)ListViewNaglowek.Items[0].
                                                FindControl("TextBoxWaga")).Text).ToString() +
                " data: " + DateTime.Now.ToShortDateString() +
                " pobrał: " + (((DropDownList)ListViewNaglowek.
                                                Items[0].FindControl("DropDownListPobral")).
                                                SelectedValue).ToString() +
                " spec: " + DropDownListSpecyfikacje.SelectedItem.ToString() +
                " ilosc parse: " + Convert.ToDouble((((TextBox)ListViewNaglowek.Items[0].
                                                            FindControl("TextBoxWaga")).Text).ToString());
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
                    "ss.cecha20, ss.wymagania20, ss.cecha21, ss.wymagania21, ss.cecha22, ss.wymagania22 FROM " +
                    "SpecyfikacjeSurowcow ss WHERE ss.numer=@nrSpec", con);

                cmd.Parameters.AddWithValue("nrSpec", nrSpecyfikacji);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsViewSpecyfikacja.DataSource = DetailsViewFormularz2.DataSource = dt;
                DetailsViewSpecyfikacja.DataBind();
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

        /************************       ZMIANA DROPDOWNLIST SPECYFIKACJE      ***************************/

        protected void DropDownListSpecyfikacje_SelectedIndexChanged(object sender, EventArgs e)
        {
            specyfikacja = DropDownListSpecyfikacje.SelectedItem.ToString();
            if (DropDownListSpecyfikacje.SelectedIndex != -1)
            {   
                wyswietlSzczegolySpecyfikacji(DropDownListSpecyfikacje.SelectedItem.ToString());
                wyswietlOpisSubstancjiRoslinnej(DropDownListSpecyfikacje.SelectedItem.ToString());
                DetailsViewSpecyfikacja.Visible = true;
                DetailsViewFormularz2.Visible = true;
                LabelWymaganiaJakosciowe.Visible = true;
                LabelWynikiBadania.Visible = true;
                LabelWykonawca.Text = MySession.Current.stanowisko + " - " + MySession.Current.imieNazwisko;        //podpis osoby wykonujacej
                LabelWykonawca.Visible = true;
                ListViewPodsumowanie.Visible = true;
                ButtonZapisz.Visible = true;
                LabelWykonawca.Visible = true;
                ((TextBox)ListViewPodsumowanie.Items[0].FindControl("TextBoxOrzeczenie")).Text = "";
                ((CheckBox)ListViewPodsumowanie.Items[0].FindControl("zwolnionyCheckBox")).Checked = false;
                ((CheckBox)ListViewPodsumowanie.Items[0].FindControl("zwolnionyWarunkowoCheckBox")).Checked = false;
                ((CheckBox)ListViewPodsumowanie.Items[0].FindControl("NiezwolnionyCheckBox")).Checked = false;
                LabelOrzeczenie.Text = "";
                //DetailsViewFormularz2.Rows[0].Cells[1].Text = DropDownListSurowce.SelectedItem.ToString();
            }
            else
            {
                DetailsViewSpecyfikacja.Visible = false;
                DetailsViewFormularz2.Visible = false;
                LabelWymaganiaJakosciowe.Visible = false;
                LabelWynikiBadania.Visible = false;
                ListViewPodsumowanie.Visible = false;
                ButtonZapisz.Visible = false;
                LabelWykonawca.Visible = false;
            }
        }

        /**************************       ZAŁÓŻ NOWY REKORD W TABELI SUROWCEANALIZY      ***********************/

        //cmd.Parameters.AddWithValue("cecha7", DetailsViewFormularz2.Rows[15].Cells[1].Text.ToString());       <---- odczyt z pola DATABIND (do wiadomości)

        protected void zalozRekord()
        {

                LabelError.Text = "";
                OleDbConnection con = MyConnection.getConnStrOle();

                OleDbCommand cmd =
                    new OleDbCommand("INSERT INTO SurowceAnalizy (numerAnalizy, seria, rodzaj, brakIndeksu, tytul, " +
                        "surowiec, surowiecId, aliasId, oddzial, punktSkupowy, dostawca, ilosc, " +
                        "dataPobraniaProby, pobral, numerSpecyfikacji, przeznaczenie" +

                        ", specZDnia, cecha1, wymagania1, cecha2, wymagania2, cecha3, wymagania3" +
                        ", cecha4, wymagania4, cecha5, wymagania5, cecha6, wymagania6, cecha7, wymagania7" +
                        ", cecha8, wymagania8, cecha9, wymagania9, cecha10, wymagania10, cecha11, wymagania11" +
                        ", cecha12, wymagania12, cecha13, wymagania13, cecha14, wymagania14, cecha15, wymagania15" +
                        ", cecha16, wymagania16, cecha17, wymagania17, cecha18, wymagania18, cecha19, wymagania19" +
                        ", cecha20, wymagania20, cecha21, wymagania21, cecha22, wymagania22" +
                        
                        ", wykonujacy, orzekajacy, stanowisko, dataWykonania, dataDodania, zwolniony, zwolnionyWarunkowo, " +
                        "niezwolniony, orzeczenie, uwagi) " +

                        "VALUES (" +
                        "@numerAnalizy, @seria, @rodzaj, @brakIndeksu, @tytul, @surowiec, @surowiecId, @aliasId, @oddzial, " +
                        "@punktSkupowy, @dostawca, @ilosc, @dataPobraniaProby, @pobral, @nrSpecyfikacji, @przeznaczenie" +

                        ", @specZDnia, @cecha1, @wymaganie1, @cecha2, @wymaganie2, @cecha3, @wymaganie3" +
                        ", @cecha4, @wymaganie4, @cecha5, @wymaganie5, @cecha6, @wymaganie6, @cecha7, @wymaganie7" +
                        ", @cecha8, @wymaganie8, @cecha9, @wymaganie9, @cecha10, @wymaganie10, @cecha11, @wymaganie11" +
                        ", @cecha12, @wymaganie12, @cecha13, @wymaganie13, @cecha14, @wymaganie14, @cecha15, @wymaganie15" +
                        ", @cecha16, @wymaganie16, @cecha17, @wymaganie17, @cecha18, @wymaganie18, @cecha19, @wymaganie19" +
                        ", @cecha20, @wymaganie20, cecha21, wymagania21, cecha22, wymagania22" +
                
                        ", @wykonujacy, @orzekajacy, @stanowisko, @dataWykonania, @dataDodania, @zwolniony, @zwolnionyWar " +
                        ", @niezwolniony, @orzeczenie, @uwagi);", con);

                // wartości z listviewNagłówek
                cmd.Parameters.AddWithValue("numerAnalizy", (((TextBox)ListViewNaglowek.
                                                            Items[0].
                                                            FindControl("numerAnalizyLabel")).Text).ToString());
                cmd.Parameters.AddWithValue("seria", (((TextBox)ListViewNaglowek.
                                                            Items[0].
                                                            FindControl("numerSeriiLabel")).Text).ToString());
                cmd.Parameters.AddWithValue("rodzaj", Convert.ToInt32(DropDownListRodzajAnalizy.SelectedValue));
                cmd.Parameters.AddWithValue("brakIndeksu", CheckBoxBrakIndeksu.Checked);
                cmd.Parameters.AddWithValue("tytul", DetailsViewSpecyfikacja.Rows[0].Cells[1].Text.ToString());
                cmd.Parameters.AddWithValue("surowiec", DropDownListSurowce.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("surowiecId", surowiecId);
                cmd.Parameters.AddWithValue("aliasId", aliasId);
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
                cmd.Parameters.AddWithValue("nrSpecyfikacji", DropDownListSpecyfikacje.SelectedItem.ToString());
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

                cmd.Parameters.AddWithValue("cecha21", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha21")).Text).ToString());
                cmd.Parameters.AddWithValue("wymaganie21", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania21")).Text).ToString());

                cmd.Parameters.AddWithValue("cecha22", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxcecha22")).Text).ToString());
                cmd.Parameters.AddWithValue("wymaganie22", (((TextBox)DetailsViewFormularz2.FindControl("TextBoxWymagania22")).Text).ToString());

                //wartości z orzeczenie
                cmd.Parameters.AddWithValue("wykonujacy", ((DropDownList)ListViewPodsumowanie.Items[0].
                                                            FindControl("DropDownListAnalizeWykonal")).
                                                            SelectedValue);
                cmd.Parameters.AddWithValue("orzekajacy", MySession.Current.imieNazwisko);
                cmd.Parameters.AddWithValue("stanowisko", MySession.Current.stanowisko);
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
            pobierzIdAliasuIdSurowca(DropDownListSurowce.SelectedValue.ToString());
            if (walidacja())
            {
                zalozRekord();
                Page.Response.Redirect("~/Views/DzialKontroliJakosci/Surowce/Analizy_surowcow.aspx?aliasId=" +
                                        aliasId);
            }
            else
            {
                walidacja();
            }
        }


        /**************************************** POBIERZ ID ALIASU I ID SUROWCA *********************************/

        protected void pobierzIdAliasuIdSurowca(string nazwa)
        {
            if (CheckBoxBrakIndeksu.Checked)
            {

                OleDbDataReader reader = null;
                OleDbConnection con = MyConnection.getConnStrOle();

                OleDbCommand cmd =
                    new OleDbCommand("SELECT aliasId FROM SurowceAliasy " +
                        "WHERE nazwa LIKE @nazwa;", con);

                cmd.Parameters.AddWithValue("nazwa", nazwa);
                try
                {
                    con.Open();
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        aliasId = reader.GetInt32(0);
                    }

                }
                catch (OleDbException err)
                {
                    LabelError.Text = err.ToString();
                }
                finally
                {
                    reader.Close();
                    con.Close();
                }
            }

            else if (!CheckBoxBrakIndeksu.Checked)
            {
                OleDbDataReader reader = null;
                OleDbConnection con = MyConnection.getConnStrOle();

                OleDbCommand cmd =
                    new OleDbCommand("SELECT s.surowiecId, sa.aliasId FROM Surowce s, SurowceAliasy sa " +
                        "WHERE s.nazwa LIKE @nazwa AND s.alias=sa.aliasId;", con);

                cmd.Parameters.AddWithValue("nazwa", nazwa);
                try
                {
                    con.Open();
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        surowiecId = reader.GetInt32(0);
                        aliasId = reader.GetInt32(1);
                    }

                }
                catch (OleDbException err)
                {
                    LabelError.Text = err.ToString();
                }
                finally
                {
                    reader.Close();
                    con.Close();
                }
            }
        }

        /************ SPRAWDZ CZY ANALIZA ISTNIEJE W BAZIE  CZY DATY ZANZACZONE, CZY ANALIZA WPISANA (WALIDACJA) *********************/

        protected bool walidacja()
        {
            LabelError.Text = "";
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand sprawdzDane =
                new OleDbCommand("SELECT COUNT(*) FROM SurowceAnalizy WHERE numerAnalizy LIKE @analiza" +
                                    " AND rodzaj LIKE @rodzaj AND aliasId LIKE @aliasId", conn);
            sprawdzDane.Parameters.AddWithValue("analiza", (((TextBox)ListViewNaglowek.
                                                            Items[0].
                                                            FindControl("numerAnalizyLabel")).Text).ToString());
            sprawdzDane.Parameters.AddWithValue("rodzaj", DropDownListRodzajAnalizy.SelectedValue);
            sprawdzDane.Parameters.AddWithValue("aliasId", aliasId);

            int temp = Convert.ToInt32(sprawdzDane.ExecuteScalar().ToString());

            if (temp == 1)
            {
                LabelError.Visible = true;
                LabelError.Text = "Numer analizy istnieje w bazie";
                return false;
            }
            else if (((((TextBox)ListViewNaglowek.Items[0].FindControl("numerAnalizyLabel")).Text).ToString() == ""
                || (((TextBox)ListViewNaglowek.Items[0].FindControl("dataPobraniaProbyLabel")).Text).ToString() == ""
                || (((TextBox)ListViewPodsumowanie.Items[0].FindControl("dataWykonaniaBadania")).Text).ToString() == ""))
            {
                LabelError.Visible = true;
                LabelError.Text = "Wypełnij wymagane pola: " + "<br />" +
                                                          "&bull;" + " nr analizy" + "<br />" +
                                                          "&bull;" + " data pobrania próby" + "<br />" +
                                                          "&bull;" + " data wykonania analizy" + "<br />";
                return false;
            }
            else if (((CheckBox)ListViewPodsumowanie.Items[0].
                                                     FindControl("zwolnionyCheckBox")).Checked == false
                 && ((CheckBox)ListViewPodsumowanie.Items[0].
                                                     FindControl("zwolnionyWarunkowoCheckBox")).Checked == false
                 && ((CheckBox)ListViewPodsumowanie.Items[0].
                                                     FindControl("NiezwolnionyCheckBox")).Checked == false)
            {
                LabelError.Visible = true;
                LabelError.Text = "Zaznacz jedno z pól: " + "<br />" +
                                                          "&bull;" + " surowiec zwolniony" + "<br />" +
                                                          "&bull;" + " surowiec zwolniony warunkowo" + "<br />" +
                                                          "&bull;" + " surowiec nie zwolniony" + "<br />";
                return false;
            }
            else if (temp != 1)
            {
                return true;
            }
            else
                return false;
        }

        //  podczepienie zdarzenia pod checkboxy w celu dodania orzeczenia

        protected void ListViewPodsumowanie_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            CheckBox zwolnionyCheckbox;
            CheckBox warunkowoCheckbox;
            CheckBox nieZwolnionyCheckbox;
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                zwolnionyCheckbox = (CheckBox)e.Item.FindControl("zwolnionyCheckBox");
                zwolnionyCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + zwolnionyCheckbox.ClientID + "')");
                warunkowoCheckbox = (CheckBox)e.Item.FindControl("zwolnionyWarunkowoCheckBox");
                warunkowoCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + warunkowoCheckbox.ClientID + "')");
                nieZwolnionyCheckbox = (CheckBox)e.Item.FindControl("NiezwolnionyCheckBox");
                nieZwolnionyCheckbox.Attributes.Add("onClick", "checkbox_Checked('" + nieZwolnionyCheckbox.ClientID + "')");
            }
        }
    }
}