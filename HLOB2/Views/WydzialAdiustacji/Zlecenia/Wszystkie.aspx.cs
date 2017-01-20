using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


namespace HLOB2.Views.WydzialAdustacji.Zlecenia
{
    public partial class Wszystkie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //DropDownListStatus.AppendDataBoundItems = true;
                //DropDownListStatus.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                //DropDownListStatus.SelectedIndex = 0;
                //dodajDataSourceGridView1();
                GridView1.DataSourceID = "AccessDataSourceZlecenia";
                GridView1.DataBind();
                GridView1.PageIndex = Int32.MaxValue;   //ustawienie page na ostatnią stronę
            }
        }

        protected void DropDownListPolprodukty_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelError.Text = "";
            DropDownListStatus.SelectedIndex = -1;

        }

        protected void DropDownListStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelError.Text = "";
            DropDownListPolprodukty.SelectedIndex = -1;

        }

        protected void ImageButtonDelPp_Click(object sender, ImageClickEventArgs e)
        {
            LabelError.Text = "";
            GridView1.EditIndex = -1;
            DropDownListPolprodukty.SelectedIndex = -1;
        }

        protected void ImageButtonDelSt_Click(object sender, ImageClickEventArgs e)
        {
            LabelError.Text = "";
            GridView1.EditIndex = -1;
            DropDownListStatus.SelectedIndex = -1;
        }

        //  koloruj wiersze
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
                //polprodukt.SelectedValue = polprodukt.ToString();

                ImageButton l = (ImageButton)e.Row.FindControl("ImageButton1");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Potwierdź usunięcie zlecenia nr " +
                DataBinder.Eval(e.Row.DataItem, "numer") + "/219" + "')");

                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                bool uzdatnianie = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "uzdatnianie"));

                if (status == "oczekiwanie")        // 1 - oczekiwanie
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 255);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "adiustacja")        // 2 - adiustacja
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(204, 255, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "kwarantanna")       // 5 - kwarantanna
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(153, 204, 255);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "w magazynie")       // 6 - w magazynie
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 204, 153);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "wysłano")       // 7 - wysłano
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(204, 204, 204);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (status == "sanityzacja")       // 8 - sanityzacja
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 153);
                    e.Row.ForeColor = System.Drawing.Color.Black;
                }
                else if (uzdatnianie == true)       // 8 - sanityzacja
                {
                    e.Row.BackColor = System.Drawing.Color.Red;
                    e.Row.ForeColor = System.Drawing.Color.Red;
                    //CheckBox cb = e.Row.FindControl("CheckBoxU0") as CheckBox;
                    //cb.BackColor = System.Drawing.Color.Black;
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Edit)
            {
                //DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt2") as DropDownList;
                //polprodukt.SelectedValue = (DataBinder.Eval(e.Row.DataItem, "polprodukt")).ToString();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Realizacja.aspx?zlecenieId=" +
                                    GridView1.SelectedDataKey[0].ToString());
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            wstawNumerZlecenia();
            LabelError.Text = "";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "InsertNew")
            {
                if (walidacjaFooter())
                {
                    TextBox numerZlecenia = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
                    DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
                    TextBox seria = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
                    TextBox wagaSurowca = GridView1.FooterRow.FindControl("TextBoxWagaSur") as TextBox;
                    CheckBox uzdatnianie = GridView1.FooterRow.FindControl("CheckBoxU") as CheckBox;

                    AccessDataSourceZlecenia.InsertParameters["numer"].DefaultValue = numerZlecenia.Text;
                    AccessDataSourceZlecenia.InsertParameters["polprodukt"].DefaultValue = polprodukt.SelectedValue.ToString();
                    AccessDataSourceZlecenia.InsertParameters["seria"].DefaultValue = seria.Text;
                    AccessDataSourceZlecenia.InsertParameters["wagaSurowca"].DefaultValue = wagaSurowca.Text;
                    AccessDataSourceZlecenia.InsertParameters["uzdatnianie"].DefaultValue = uzdatnianie.Checked.ToString();
                    AccessDataSourceZlecenia.InsertParameters["status"].DefaultValue = "1"; // 1 - oczekiwanie

                    AccessDataSourceZlecenia.InsertParameters["dataZalozenia"].DefaultValue = DateTime.Now.ToString();
                    AccessDataSourceZlecenia.InsertParameters["zalozyl"].DefaultValue = MySession.Current.pracownikId;
                    AccessDataSourceZlecenia.InsertParameters["uwagi"].DefaultValue = "";

                    AccessDataSourceZlecenia.Insert();
                    // odśwież stronę
                    Page.Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Wszystkie.aspx");
                }
                else
                    walidacjaFooter();
            }
            else if (e.CommandName.ToString() == "Update")
            {

                if (walidacjaEdit())
                {
                    //TextBox numerZlecenia = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
                    //DropDownList polprodukt = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
                    //TextBox seria = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
                    //TextBox wagaSurowca = GridView1.FooterRow.FindControl("TextBoxWagaSur") as TextBox;

                    //AccessDataSourceZlecenia.InsertParameters["numer"].DefaultValue = numerZlecenia.Text;
                    //AccessDataSourceZlecenia.InsertParameters["polprodukt"].DefaultValue = polprodukt.SelectedValue.ToString();
                    //AccessDataSourceZlecenia.InsertParameters["seria"].DefaultValue = seria.Text;
                    //AccessDataSourceZlecenia.InsertParameters["wagaSurowca"].DefaultValue = wagaSurowca.Text;
                    //AccessDataSourceZlecenia.InsertParameters["status"].DefaultValue = "oczekiwanie";

                    //AccessDataSourceZlecenia.InsertParameters["dataEdycji"].DefaultValue = DateTime.Now.ToString();
                    //AccessDataSourceZlecenia.InsertParameters["edytowal"].DefaultValue = MySession.Current.pracownikId;
                    //AccessDataSourceZlecenia.InsertParameters["uwagi"].DefaultValue = "";

                    //AccessDataSourceZlecenia.Update();
                    //// odśwież stronę
                    //Page.Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Wszystkie.aspx");
                }
                
                else
                    walidacjaEdit();
            }
        }

        protected void CheckBoxGeneratorSerii_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxGeneratorSerii.Checked != true)
            {
                TextBox ser = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
                ser.Text = "";
                LabelError.Text = "";
            }
            else
                LabelError.Text = "";
        }

        protected void DropDownListEditChanged(object sender, EventArgs e)
        {
            generujIndeksEdit();
        }

        protected void DropDownListFooterChanged(object sender, EventArgs e)
        {
            LabelError.Text = "";
            if (CheckBoxGeneratorSerii.Checked == true)
            {
                generujSerieFooter();
                GridView1.EditIndex = -1;
            }
            generujIndeksFooter();
            GridView1.EditIndex = -1;
        }


        protected void wstawNumerZlecenia()
        {
            TextBox zlecenieTextBox = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
            string numerZlecenia = "";
            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                    new OleDbCommand("SELECT MAX(numer) + 1 " +
                        "FROM Zlecenia", conn);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                numerZlecenia = "0" + (reader[0].ToString());

            }

            zlecenieTextBox.Text = numerZlecenia;
            conn.Close();
        }

        protected void dodajDataSourceGridView1()
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand cmd = new OleDbCommand("SELECT z.zlecenieId, z.numer, p.nazwa As polprodukt, " +
                        "p.indeks As indeks, z.seria, z.wagaSurowca, z.wagaPolproduktu, z.uwagi, " +
                        "z.status, z.dataZalozenia " +
                        "FROM Zlecenia z, Polprodukty p WHERE p.polproduktId=z.polprodukt " +
                        "ORDER BY z.numer", conn);

            OleDbDataAdapter adapter = new OleDbDataAdapter(cmd);

            DataSet myDataSet = new DataSet();

            adapter.Fill(myDataSet);

            GridView1.DataSource = myDataSet;
            GridView1.DataBind();

            conn.Close();
        }

        protected void generujIndeksFooter()
        {
            DropDownList drdList;
            drdList = (DropDownList)(GridView1.FooterRow.FindControl("DropDownListPolprodukt"));
            string polprodukt = drdList.SelectedValue.ToString();

            Label indeks = GridView1.FooterRow.FindControl("LabelIndeks") as Label;

            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                    new OleDbCommand("SELECT indeks FROM Polprodukty WHERE polproduktId=@polprodukt", conn);

            hasloCommand.Parameters.AddWithValue("polprodukt", polprodukt);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                indeks.Text = (reader[0].ToString());

            }
            conn.Close();
        }

        protected void generujSerieFooter()
        {
            DropDownList drdList;
            drdList = (DropDownList)(GridView1.FooterRow.FindControl("DropDownListPolprodukt"));
            string polprodukt = drdList.SelectedValue.ToString();
            char[] numerSeriiChar = new char[8];
            string dzien1 = "";
            char[] dzien;
            string miesiac1 = "";
            char[] miesiac;
            string rok1 = "";
            char[] rok;
            string najwiekszyNumerSerii = "";
            char[] temp = new char[2];
            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                    new OleDbCommand("SELECT MAX(seria) FROM Zlecenia WHERE polprodukt=@polprodukt", conn);

            hasloCommand.Parameters.AddWithValue("polprodukt", polprodukt);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                najwiekszyNumerSerii = (reader[0].ToString());

            }
            conn.Close();

            // działania wstępne - stworzenie tablic miesiąca i roku:

            TextBox seria = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
            char[] znakiSeria = najwiekszyNumerSerii.ToCharArray();
            if (Convert.ToInt32(DateTime.Now.Month) <= 9)
                miesiac1 = "0" + DateTime.Now.Month.ToString();
            else
                miesiac1 = DateTime.Now.Month.ToString();
            miesiac = miesiac1.ToCharArray();
            rok1 = DateTime.Now.Year.ToString();
            rok = rok1.ToCharArray();


            if (najwiekszyNumerSerii == "")         //    przydziel nowy numer serii 01.....
            {
                numerSeriiChar[0] = '0';
                numerSeriiChar[1] = '1';
                numerSeriiChar[2] = miesiac[0];
                numerSeriiChar[3] = miesiac[1];
                numerSeriiChar[4] = rok[0];
                numerSeriiChar[5] = rok[1];
                numerSeriiChar[6] = rok[2];
                numerSeriiChar[7] = rok[3];
                seria.Text = new String(numerSeriiChar);

            }
            else                                    //  seria istnieje - wykonaj na niej operacje porównania
            {
                if ((rok[0] != znakiSeria[4]) || (rok[1] != znakiSeria[5])          // jesli rok nie istnieje - stwórz nową serię
                    || (rok[2] != znakiSeria[6]) || (rok[3] != znakiSeria[7]))
                {
                    numerSeriiChar[0] = '0';
                    numerSeriiChar[1] = '1';
                    numerSeriiChar[2] = miesiac[0];
                    numerSeriiChar[3] = miesiac[1];
                    numerSeriiChar[4] = rok[0];
                    numerSeriiChar[5] = rok[1];
                    numerSeriiChar[6] = rok[2];
                    numerSeriiChar[7] = rok[3];
                    seria.Text = new String(numerSeriiChar);
                }
                else                                                                // kontynuuj porównanie
                {
                    numerSeriiChar[4] = znakiSeria[4];                              // przypisz do serii rok i sprawdz miesiąc
                    numerSeriiChar[5] = znakiSeria[5];
                    numerSeriiChar[6] = znakiSeria[6];
                    numerSeriiChar[7] = znakiSeria[7];

                    if ((miesiac[0] != znakiSeria[2]) || (miesiac[1] != znakiSeria[3]))     //  jesli miesiąc różny, wstaw aktualny i dodaj 0 i 1
                    {
                        numerSeriiChar[2] = miesiac[0];
                        numerSeriiChar[3] = miesiac[1];
                        numerSeriiChar[1] = '1';
                        numerSeriiChar[0] = '0';
                        seria.Text = new String(numerSeriiChar);
                    }
                    else                                                                    //  jeśli miesiąc pasuje, wstaw ten miesiąc i powiększ dzień o 1
                    {
                        numerSeriiChar[2] = znakiSeria[2];
                        numerSeriiChar[3] = znakiSeria[3];
                        temp[0] = znakiSeria[0];
                        temp[1] = znakiSeria[1];
                        string temp2 = new String(temp);
                        int temp3 = Convert.ToInt32(temp2) + 1;
                        if (temp3 <= 9)
                            dzien1 = "0" + temp3.ToString();
                        else
                            dzien1 = temp3.ToString();
                        dzien = dzien1.ToCharArray();
                        numerSeriiChar[0] = dzien[0];
                        numerSeriiChar[1] = dzien[1];
                        seria.Text = new String(numerSeriiChar);
                    }
                }
            }
        }

        protected bool walidacjaFooter()
        {
            bool isValid = true;
            DropDownList pp = GridView1.FooterRow.FindControl("DropDownListPolprodukt") as DropDownList;
            TextBox zlec = GridView1.FooterRow.FindControl("TextBoxNumer") as TextBox;
            TextBox ser = GridView1.FooterRow.FindControl("TextBoxSeria") as TextBox;
            string polprodukt = pp.SelectedItem.ToString();
            string nrZlecenia = zlec.Text;
            string nrSerii = ser.Text;

            //  sprawdź numer zlecenia
            if (nrZlecenia != "")       //  jeśli nie są to "próby technologiczne"
            {
                OleDbConnection conn = MyConnection.getConnStrOle();
                conn.Open();
                OleDbCommand sprawdzZlecenie =
                    new OleDbCommand("SELECT COUNT(numer) FROM Zlecenia WHERE numer=@numer", conn);
                sprawdzZlecenie.Parameters.AddWithValue("numer", nrZlecenia);
                int temp = Convert.ToInt32(sprawdzZlecenie.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    isValid = false;
                    LabelError.Text = "Numer zlecenia istnieje w bazie";
                }
                conn.Close();
            }

            if (nrSerii == "")
            {
                isValid = false;
                LabelError.Text = "Wpisz numer serii";
            }

            if (pp.SelectedItem.ToString() == "")
            {
                isValid = false;
                LabelError.Text = "Wybierz półprodukt z listy";
            }


            OleDbConnection conn2 = MyConnection.getConnStrOle();
            conn2.Open();
            OleDbCommand sprawdzPolprISerie =
                new OleDbCommand("SELECT COUNT(*) FROM Zlecenia z, Polprodukty p WHERE " +
                    "p.nazwa=@polprodukt AND z.seria=@seria AND z.polprodukt=p.polproduktId", conn2);
            sprawdzPolprISerie.Parameters.AddWithValue("polprodukt", polprodukt);
            sprawdzPolprISerie.Parameters.AddWithValue("seria", nrSerii);
            int temp2 = Convert.ToInt32(sprawdzPolprISerie.ExecuteScalar().ToString());
            if (temp2 == 1)
            {
                isValid = false;
                LabelError.Text = "Półprodukt tej serii istnieje w bazie";
            }
            conn2.Close();

            return isValid;
        }

        protected bool walidacjaEdit()
        {
            return true;
        }

        protected void generujIndeksEdit()
        {
            DropDownList drdList;
            drdList = GridView1.Rows[GridView1.EditIndex].FindControl("DropDownListPolprodukt2") as DropDownList;
            string polprodukt = drdList.SelectedValue.ToString();

            Label indeks = GridView1.Rows[GridView1.EditIndex].FindControl("LabelIndeks2") as Label;

            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                    new OleDbCommand("SELECT indeks FROM Polprodukty WHERE polproduktId=@polprodukt", conn);

            hasloCommand.Parameters.AddWithValue("polprodukt", polprodukt);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                indeks.Text = (reader[0].ToString());

            }
            conn.Close();
        }

        //protected void podlaczDataSourceFiltrPp()
        //{
        //    AccessDataSourceZleceniaFiltrPp.SelectParameters["polproduktId"].DefaultValue = 
        //        DropDownListPolprodukty.SelectedValue.ToString();
        //    AccessDataSourceZleceniaFiltrPp.Select();
        //    // odśwież stronę
        //    Page.Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Wszystkie.aspx");
        //}

        //protected void podlaczDataSourceFiltrSt()
        //{
        //    AccessDataSourceZleceniaFiltrSt.SelectParameters["polproduktId"].DefaultValue =
        //        DropDownListPolprodukty.SelectedValue.ToString();
        //    AccessDataSourceZleceniaFiltrSt.Select();
        //    // odśwież stronę
        //    Page.Response.Redirect("~/Views/WydzialAdiustacji/Zlecenia/Wszystkie.aspx");
        //}
    }
}