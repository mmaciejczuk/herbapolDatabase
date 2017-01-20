using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace HLOB2.Views.WydzialAdiustacji.E_mail
{
    public partial class Nowy : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxNadawca.Text = MySession.Current.imieNazwisko;
            if (!IsPostBack)
            {
                DropDownListTematy.Items.Add(" ");
                DropDownListTematy.Items.Add("Dyspozycja");
                DropDownListTematy.Items.Add("Harmonogram prac");
                DropDownListTematy.Items.Add("Zlecenie");
                DropDownListTematy.Items.Add("Wysyłka");
            }
        }

        protected void ButtonWyslij_Click(object sender, EventArgs e)
        {
            EmailToAdmin eta = new EmailToAdmin();
            eta.SendEmail(TextBoxNadawca.Text, TextBoxTemat.Text, Editor1.Content);
            Editor1.Content = "";
            TextBoxTemat.Text = "";
            DropDownListTematy.SelectedIndex = 0; 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Editor1.Content = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListTematy.SelectedValue.ToString() == "Harmonogram prac")
            {
                TextBoxTemat.Text = DropDownListTematy.SelectedValue.ToString() + " na dzień " + DateTime.Now.ToShortDateString();
            }
            else
            {
                TextBoxTemat.Text = DropDownListTematy.SelectedValue.ToString();
            }
        }
    }
}