using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace HLOB2.Views.Admin.Operacje
{
    public partial class GeneratorSerii : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonWypelnij_Click(object sender, CommandEventArgs e)
        {

        }

        protected void ButtonSeria_Click(object sender, CommandEventArgs e)
        {
            TextBoxSeria.Text = TextBoxDzien.Text + TextBoxMiesiac.Text + TextBoxRok.Text;
        }

        protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string polprodukt = DropDownListPp.SelectedValue.ToString();
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
                TextBoxSeria2.Text = new String(numerSeriiChar);
               
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
                    TextBoxSeria2.Text = new String(numerSeriiChar);
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
                        TextBoxSeria2.Text = new String(numerSeriiChar);
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
                        TextBoxSeria2.Text = new String(numerSeriiChar);
                    }
                }
            }
        }
    }
}