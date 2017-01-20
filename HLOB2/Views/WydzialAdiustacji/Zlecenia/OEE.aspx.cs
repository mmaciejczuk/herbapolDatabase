using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class OEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                zaladujLabel(Request.QueryString["realizacjaId"].ToString());
            }
        }

        protected void zaladujLabel(string realizacjaId)
        {
            string numer = "";
            string nazwa = "";
            string seria = "";
            string wagaPp = "";
            string wagaOdp = "";
            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                new OleDbCommand("SELECT z.numer, p.nazwa, z.seria, rd.wagaPolproduktu, rd.wagaOdpadu " + 
                    "FROM Polprodukty p, Zlecenia z, FormularzeRealizacji fr, RealizacjeDzienne rd " +
                    "WHERE p.polproduktId=z.polprodukt AND z.zlecenieId=fr.zlecenie AND " +
                    "fr.formularzId=rd.formularzId AND rd.realizacjaId=2", conn);

            //hasloCommand.Parameters.AddWithValue("realizacjaId", realizacjaId);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                numer = (reader[0].ToString());
                nazwa = (reader[1].ToString());
                seria = (reader[2]).ToString();
                wagaPp = (reader[3]).ToString();
                wagaOdp = (reader[4]).ToString();
            }

            conn.Close();
            LabelAsortyment.Text = numer + "/219&nbsp;-&nbsp;" + nazwa + "&nbsp;s.&nbsp;" + seria;
            LabelPp.Text = wagaPp;
            Label11.Text = "/";
            LabelO.Text = wagaOdp;
        }

        //protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Control chk = ((Control)sender).FindControl("CheckBoxListPracownicy");
        //    CheckBoxList ch = (CheckBoxList)CheckBoxListPracownicy;
        //    if (ch.Items[ch.SelectedIndex].Selected)
        //        ch.Items[ch.SelectedIndex].Attributes.Add("Style", "background-color: red;");

        //}



        protected void DetailsViewOEE_Przestoje_DataBound(object sender, EventArgs e)
        {
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxOdprawa")).Attributes.Add("onChange", "sumuj();");
//            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxOdprawa")).Attributes.Add("onBlur", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxZmianaAsort")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxRozpProd")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxZakProd")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxCzyszczenie")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxPraceZlecone")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Przestoje.FindControl("TextBoxSzkolenie")).Attributes.Add("onChange", "sumuj();");
        }

        protected void DetailsViewOEE_RegulacjeAwarie_DataBound(object sender, EventArgs e)
        {
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxAwariaZszyw")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxBlokadaNoz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxAwariaElektr")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxAwariaMech")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxZmianaUst")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxWymianaNoz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxCzyszczenieSit")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxCzyszczenieFiltrow")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_RegulacjeAwarie.FindControl("TextBoxCzyszczenieRot")).Attributes.Add("onChange", "sumuj();");
        }

        protected void DetailsView_Przerwy_DataBound(object sender, EventArgs e)
        {
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxProbyTechn")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxPrzegladMasz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxModernMasz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxRemontMasz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxKonserwMasz")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxWeryfikacjaPp")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxPrzerwaSniad")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsView_Przerwy.FindControl("TextBoxInne")).Attributes.Add("onChange", "sumuj();");
        }

        protected void DetailsViewOEE_Braki_DataBound(object sender, EventArgs e)
        {
            ((TextBox)DetailsViewOEE_Braki.FindControl("TextBoxBrakMechanika")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Braki.FindControl("TextBoxBrakSur")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Braki.FindControl("TextBoxBrakObsady")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Braki.FindControl("TextBoxBrakZwolnienia")).Attributes.Add("onChange", "sumuj();");
            ((TextBox)DetailsViewOEE_Braki.FindControl("TextBoxInne2")).Attributes.Add("onChange", "sumuj();");
        }

        protected void DetailsViewPodsumowanie_DataBound(object sender, EventArgs e)
        {
            ((TextBox)DetailsViewPodsumowanie.FindControl("TextBoxInneCzasPracyM")).Attributes.Add("onChange", "sumuj();");
        }

        protected void ButtonZapisz2_Click(object sender, EventArgs e)
        {
            //LabelTest.Text = "A= " + varA.Value.ToString() + "B= " + varB.Value.ToString() + "C= " + varC.Value.ToString() +
            //    "D= " + varD.Value.ToString() + "I= " + varI.Value.ToString() + "M= " + varM.Value.ToString() + "O= " + varO.Value.ToString() +
            //    "OEE= " + varOEE.Value.ToString();
            //foreach (ListItem item in ((CheckBoxList)Form.FindControl("CheckBoxListPracownicy")).Items)
            //{
            //    if (item.Selected)
            //    {
            //        LabelTest.Text += item.Value.ToString();                      
            //    }
            //}

            //ListBox1.Items.Clear();
            //int x = CheckBoxListPracownicy.Items.Count;
            //for (int i = 0; i < x; i++)
            //{
            //    if (CheckBoxListPracownicy.Items[i].Selected)
            //    {
            //        ListBox1.Items.Add(CheckBoxListPracownicy.Items[i].Value);
            //    }
            //}
            Response.Write("<script language='javascript'>self.close();</script>");
        }
    }
}