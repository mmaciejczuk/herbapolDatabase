using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace HLOB2
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (MyCookie.czyIstniejeCookie("login"))
            {
                //TextBoxLogin.Text = MyCookie.pobierzCookie("login");
                //TextBoxHaslo.Text = MyCookie.pobierzCookie("haslo");
            }
        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {
            LabelError.Text = "";
            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand sprawdzUzytkownika =
                new OleDbCommand("SELECT COUNT(*) FROM Pracownicy WHERE login LIKE @login", conn);
            sprawdzUzytkownika.Parameters.AddWithValue("login", TextBoxLogin.Text);
            int temp = Convert.ToInt32(sprawdzUzytkownika.ExecuteScalar().ToString());
            if (temp == 1)
            {
                string pracownikId = "";
                string imieNazwisko = "";
                string haslo = "";
                string login = "";
                string stanowisko = "";
                string dzial = "";
                LastLog log = new LastLog();
                OleDbCommand hasloCommand =
                    new OleDbCommand("SELECT pracownikId, imieNazwisko, login, haslo, stanowisko, dzial " +
                        "FROM Pracownicy WHERE login LIKE @login", conn);
                hasloCommand.Parameters.AddWithValue("login", TextBoxLogin.Text);

                reader = hasloCommand.ExecuteReader();

                while (reader.Read())
                {
                    pracownikId = (reader[0].ToString());
                    imieNazwisko = (reader[1].ToString());
                    login = (reader[2]).ToString();
                    haslo = (reader[3]).ToString();
                    stanowisko = (reader[4]).ToString();
                    dzial = (reader[5]).ToString();
                }

                conn.Close();

                if (haslo == md5(TextBoxHaslo.Text))
                {
                    MySession.Current.pracownikId = pracownikId;
                    MySession.Current.imieNazwisko = imieNazwisko;
                    MySession.Current.stanowisko = stanowisko;

                    //wywołaj metodę pobierającą datę ostatniego logowania i zapisz do sesji
                    MySession.Current.ostatnieLogowanie = log.wyswietl(pracownikId);     
   
                    if (CheckBox1.Checked == true && MyCookie.czyIstniejeCookie("login"))
                    {
                        MyCookie.stworzCookie("login", login, 30);
                        MyCookie.stworzCookie("haslo", md5(TextBoxHaslo.Text), 30);
                    }
                    LabelError.Visible = true;
                    LabelError.Text = login + " " + haslo;
                    zapiszDateLogowania(login);
                    Response.Redirect(pobierzAdres(login));
                    //MySession.Current.poprzedniaStrona = Path.GetFileName(Request.Path);
                }
                else
                {
                    LabelError.Visible = true;
                    LabelError.Text = "Nieprawidłowe hasło";
                }
            }
            else
            {
                LabelError.Visible = true;
                LabelError.Text = "Nieprawidłowa nazwa użytkownika";
                conn.Close();
            }
        }

        protected static string md5(string sPassword)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider x =
                new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] bs = System.Text.Encoding.UTF8.GetBytes(sPassword);
            bs = x.ComputeHash(bs);
            System.Text.StringBuilder s = new System.Text.StringBuilder();
            foreach (byte b in bs)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            return s.ToString();
        }

    /************************************POBIERZ ADRES STRONY ŹRÓŁOWEJ******************************************/

        protected string pobierzAdres(string login)
        {
            string adres = "";
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();
            con.Open();
            OleDbCommand cmd = new OleDbCommand("SELECT stronaDomowa FROM Pracownicy WHERE login = @login", con);
            cmd.Parameters.AddWithValue("login", login);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                adres = (reader[0].ToString());
            }
            con.Close();
            reader.Close();
            return adres;
        }

        protected void zapiszDateLogowania(string login)
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand zapiszDate = new OleDbCommand("UPDATE [Pracownicy] SET [ostatnieLogowanie]=@log " +
                "WHERE login LIKE @login", conn);

            zapiszDate.Parameters.AddWithValue("log", DateTime.Now.ToOADate());
            zapiszDate.Parameters.AddWithValue("login", login);

            zapiszDate.ExecuteNonQuery();

            conn.Close();
        }

    }
}
