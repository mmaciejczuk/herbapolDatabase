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
    public partial class Analizy_surowcowe : System.Web.UI.Page
    {
        //przechowuje listę parametrów
        List<int> idParametrow = null;
        //przechowuje indeks zasnaczonego Itema w Listview (zdarzenie selectedItem), 
        //po zmianie indeksu w DropdownList jest zerowany
        string selectedSur;
        //przechowuje wartość specyfikacji zasnaczonego Itema w Listview (zdarzenie selectedItem), 
        //po zmianie indeksu w DropdownList jest zerowany
        string selectedSpec;

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelError.Text = "";
            if (Page.IsPostBack)
            {
                if (TextBoxWyszukajAnalize.Text == "")
                {
                    wyswietlListeDlaAliasu(DropDownListSurowce.SelectedValue.ToString());
                }
                else if(DropDownListSurowce.SelectedIndex.ToString() == "0" && TextBoxWyszukajAnalize.Text != "")
                {
                    wyswietlListeDlaAnalizy(TextBoxWyszukajAnalize.Text);
                }
                else
                {
                    wyswietlListe(DropDownListSurowce.SelectedValue.ToString(), TextBoxWyszukajAnalize.Text);
                }
            }
        }

        /************************     OBSŁUGA ZDARZENIA DROPDOWNLIST - zmiana indeksu    **********************/

        //dodać odznaczenie wszystkich wierszy (unselect) oraz dodać wyświetlanie Labelów - 
        // jeśli ListView1.SelectedDataKey.Value.ToString() == "" to visible = false itd;

        protected void DropDownListSurowce_SelectedIndexChanged(object sender, EventArgs e) 
        {
            selectedSur = "";
            string selectedSpec = "";

            this.ListView1.SelectedIndex = -1;      //odznacza ListView - ale tylko odznacza

            if (TextBoxWyszukajAnalize.Text == "")
            {
                wyswietlListeDlaAliasu(DropDownListSurowce.SelectedValue.ToString());
            }
            else if (DropDownListSurowce.SelectedIndex.ToString() == "0" && TextBoxWyszukajAnalize.Text != "")
            {
                wyswietlListeDlaAnalizy(TextBoxWyszukajAnalize.Text);
            }
            else
            {
                //wyszukaj pod katem numeru aliasId i nrAnalizy
                wyswietlListe(DropDownListSurowce.SelectedValue.ToString(), TextBoxWyszukajAnalize.Text);
            }

            //wyzeruj wszystkie tabele
            wyswietlSpecyfikacje("");
            wyswietlSzczegolyAnalizy("");
            LabelWymaganiaJakosciowe.Text = "";
            LabelWynikiBadania.Text = "";
        }



        /***************************************   WYŚWIETL LISTVIEW DLA ALIASUID i NR ANALIZY  *********************************/

        protected void wyswietlListe(string aliasId, string nrAnalizy)             
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.id, s.surowiecId, (s.indeks + ' ' + s.nazwa) AS surowiec, sa.numerAnalizy, " +
                        "ra.nazwa As rodzajAnalizy, sa.numerSpecyfikacji As numerSpec, ds.nazwa As dostawcaSurowca, " +
                        "sa.ilosc As wagaSurowca, sa.dataWykonania FROM Surowce AS s, SurowceAnalizy AS sa, " +
                        "RodzajeAnaliz ra " +
                        "WHERE (s.alias LIKE @aliasId AND sa.numerAnalizy LIKE @nrAnalizy) " +
                        "And s.surowiecId=sa.surowiec " +
                        "AND ra.analizaId=sa.rodzaj ORDER BY sa.dataWykonania;", con);

                cmd.Parameters.AddWithValue("aliasId", aliasId);
                cmd.Parameters.AddWithValue("nrAnalizy", nrAnalizy);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();
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

        /*****************************************    ID WSZYSTKICH PARAMETRÓW    ********************************************/

        protected List<int> pobierzIdParametrow(string id)
        {
            idParametrow = new List<int>();
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();
            OleDbCommand cmd =
                new OleDbCommand("SELECT parametrId FROM SurowceParametry WHERE surowiecId = @id", con);
            cmd.Parameters.AddWithValue("id", id);

            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    idParametrow.Add(reader.GetInt32(0));
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
            return idParametrow; 
        }

        /***************************************************(TEST) - WYŚWIETL ID Z LISTY*************************************************/

        protected void wyswietlId(List<int> id)
        {
           
            foreach (int s in id)
            {
                LabelError.Text += id + " przerywnik ";
            }
        }

        /************************      WYŚWIETL DETAILVIEW  1 - SPECYFIKACJE (aktywacja w SELECT ListView)     ************************/

        protected void wyswietlSpecyfikacje(string nrSpec)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT ss.tytul, ss.numer, ss.dataAktualizacji, ss.cecha1, ss.wymagania1, " +
                    "ss.cecha2, ss.wymagania2, ss.cecha3, ss.wymagania3, ss.cecha4, ss.wymagania4, " +
                    "ss.cecha5, ss.wymagania5, ss.cecha6, ss.wymagania6, ss.cecha7, ss.wymagania7, " +
                    "ss.cecha8, ss.wymagania8, ss.cecha9, ss.wymagania9, ss.cecha10, ss.wymagania10, " +
                    "ss.cecha11, ss.wymagania11, ss.cecha12, ss.wymagania12, ss.cecha13, ss.wymagania13, " +
                    "ss.cecha14, ss.wymagania14,ss.cecha15, ss.wymagania15, ss.cecha16, ss.wymagania16, " +
                    "ss.cecha17, ss.wymagania17, ss.cecha18, ss.wymagania18 FROM " +
                    "SpecyfikacjeSurowcow ss WHERE ss.numer=@nrSpec", con);

                cmd.Parameters.AddWithValue("nrSpec", nrSpec);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
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


        /****************OBSŁUGA ZDARZEN listview I PRZEKIEROWANIE DO SZCZEGÓŁÓW ANALIZY (TEST)******************/

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //LabelError.Text = "Select";
            }
            else if (e.CommandName == "Sort")
            {
                //LabelError.Text = "Sort";
            }
            else if (e.CommandName == "Delete")
            {
                //LabelError.Text = "Delete";
            }
        }

        /*****************************************    SELECT - ListView (+inne zdarzenia)   ***************************************/

        protected void ListView1_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            ListView1.SelectedIndex = e.NewSelectedIndex;
            
            selectedSur = ListView1.SelectedDataKey[0].ToString();  //pobiera pierwszą wartość DataKeyNames
            selectedSpec = ListView1.SelectedDataKey[1].ToString(); //pobiera drugą wartość DataKeyNames

            //selectedSpec = ((Label)ListView1.Items[Convert.ToInt32(selectedSur)].FindControl("Numer specyfikacji")).ToString();
            //LabelError.Text = selectedSpec;

            //string pid = ListView1.DataKeys[e.NewSelectedIndex].Value.ToString(); 

            //selectedSpec = ListView1.SelectedItems[0].SubItems[2].Text;

            //wywołaj funkcje wyświetlające Specyfikacje i Szczegóły analizy

            if (TextBoxWyszukajAnalize.Text == "")
            {
                wyswietlListeDlaAliasu(DropDownListSurowce.SelectedValue.ToString());
            }
            else if (DropDownListSurowce.SelectedIndex.ToString() == "0" && TextBoxWyszukajAnalize.Text != "")
            {
                wyswietlListeDlaAnalizy(TextBoxWyszukajAnalize.Text);
            }
            else
            {
                //wyszukaj pod katem numeru aliasId i nrAnalizy
                wyswietlListe(DropDownListSurowce.SelectedValue.ToString(), TextBoxWyszukajAnalize.Text);
            }

            wyswietlSpecyfikacje(selectedSpec);
            wyswietlSzczegolyAnalizy(selectedSur);
            LabelWymaganiaJakosciowe.Text = "Wymagania jakościowe";
            LabelWynikiBadania.Text = "Wyniki badania";
        }
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            // Tutaj ustawić kolory wyświetlanych rekordów
        }


        /*************************************    NUMERY STRON   ********************************************/

        protected void CurrentRowTextBox_OnTextChanged(object sender, EventArgs e)
        {
            TextBox t = (TextBox)sender;
            DataPager pager =
                (DataPager)ListView1.FindControl("EmployeesDataPager");
            pager.SetPageProperties(Convert.ToInt32(t.Text) - 1,
                 pager.PageSize, true);
        }

        /***********************************     SORTOWANIE(nie działa)    ******************************/


        protected void ListView1_OnSorting(object sender, ListViewSortEventArgs e)
        {
            ListView1.SelectedIndex = -1; //odznacz zaznaczone rekordy

            if (String.IsNullOrEmpty(e.SortExpression)) { return; }
            string direction = "";
            if (ViewState["SortDirection"] != null)
                direction = ViewState["SortDirection"].ToString();

            if (direction == "ASC")
                direction = "DESC";
            else
                direction = "ASC";

            ViewState["SortDirection"] = direction;

            string[] sortColumns = e.SortExpression.Split(',');
            string sortExpression = sortColumns[0] + " " + direction;
            for (int i = 1; i < sortColumns.Length; i++)
                sortExpression += ", " + sortColumns[i] + " " + direction;
            e.SortExpression = sortExpression;
        }

        /******************      WYŚWIETL DETAILVIEW  2 - SZCZEGÓŁY ANALIZY (aktywacja w SELECT ListView)      *****************/

        protected void wyswietlSzczegolyAnalizy(string id)
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT [id], [numerAnalizy], [rodzaj], [surowiec], [dostawca], [ilosc], " + 
                    "[dataPobraniaProby], [pobral], [cecha1], [parametr1], [cecha2], [parametr2], [cecha3], " +
                    "[parametr3], [cecha4], [parametr4], [cecha5], [parametr5], [cecha6], [parametr6], [cecha7], " + 
                    "[parametr7], [cecha8], [parametr8], [cecha9], [parametr9], [cecha10], [parametr10], [cecha11], " +
                    "[parametr11], [cecha12], [parametr12], [cecha13], [parametr13], [cecha14], [parametr14], " +
                    "[cecha15], [parametr15], [cecha16], [parametr16], [cecha17], [parametr17], " +
                    "[zwolnionyWarunkowo], [zwolniony] FROM [SurowceAnalizy] WHERE [id] = @idAnalizy", con);

                cmd.Parameters.AddWithValue("idAnalizy", id);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                DetailsView2.DataSource = dt;
                DetailsView2.DataBind();
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

        protected void ButtonWyszukaj_Click(object sender, EventArgs e)
        {

        }

        /***************************************   WYŚWIETL LISTVIEW DLA ALIASUID   *********************************************/

        protected void wyswietlListeDlaAliasu(string aliasId)              //dla aliasu i nr analizy
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.id, s.surowiecId, (s.indeks + ' ' + s.nazwa) AS surowiec, sa.numerAnalizy, " +
                        "ra.nazwa As rodzajAnalizy, sa.numerSpecyfikacji As numerSpec, ds.nazwa As dostawcaSurowca, " +
                        "sa.ilosc As wagaSurowca, sa.dataWykonania FROM Surowce AS s, SurowceAnalizy AS sa, " +
                        "RodzajeAnaliz ra " +
                        "WHERE s.alias LIKE @aliasId " +
                        "And s.surowiecId=sa.surowiec " +
                        "AND ra.analizaId=sa.rodzaj ORDER BY sa.dataWykonania;", con);

                cmd.Parameters.AddWithValue("aliasId", aliasId);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();
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


        /***************************************   WYŚWIETL LISTVIEW DLA NR ANALIZY   *********************************************/

        protected void wyswietlListeDlaAnalizy(string analiza)              //dla aliasu i nr analizy
        {
            DataTable dt = new DataTable();
            OleDbConnection con = MyConnection.getConnStrOle();
            try
            {
                con.Open();
                OleDbCommand cmd =
                    new OleDbCommand("SELECT sa.id, s.surowiecId, (s.indeks + ' ' + s.nazwa) AS surowiec, sa.numerAnalizy, " +
                        "ra.nazwa As rodzajAnalizy, sa.numerSpecyfikacji As numerSpec, ds.nazwa As dostawcaSurowca, " +
                        "sa.ilosc As wagaSurowca, sa.dataWykonania FROM Surowce AS s, SurowceAnalizy AS sa, " +
                        "RodzajeAnaliz ra " +
                        "WHERE sa.numerAnalizy LIKE @analiza " +
                        "And s.surowiecId=sa.surowiec " +
                        "AND ra.analizaId=sa.rodzaj ORDER BY sa.dataWykonania;", con);

                cmd.Parameters.AddWithValue("analiza", analiza);
                OleDbDataAdapter sqlDa = new OleDbDataAdapter(cmd);
                sqlDa.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();
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

    }
}