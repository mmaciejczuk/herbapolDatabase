using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace HLOB2.Views.Admin.Operacje
{
    public partial class OleToSql : System.Web.UI.Page
    {
        List<SurowiecInfo> surowce = new List<SurowiecInfo>();
        int liczbaSurowcow = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAccess_Click(object sender, EventArgs e)
        {
            PobierzSurowce();
        }

        protected void ButtonSQL_Click(object sender, EventArgs e)
        {
            zapisz();
        }

        /**************************************POBIERZ DANE O SUROWCACH Z ACCESSA*******************************/

        public List<SurowiecInfo> PobierzSurowce()
        {
            OleDbConnection con = MyConnection.getConnStrOle();
            OleDbCommand cmd = new OleDbCommand("SELECT IndeksPolproduktu, NazwaPolproduktu, WagaPalety FROM NazwyPolproduktow", con);

            try
            {
                con.Open();
                OleDbDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    SurowiecInfo sur = new SurowiecInfo(
                    (string)reader["IndeksPolproduktu"],
                    (string)reader["NazwaPolproduktu"],
                    Convert.ToInt32(reader["WagaPalety"]));
                    surowce.Add(sur);
                }

                reader.Close();
                return surowce;
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }

        /**********************************PRZELICZ SUROWCE*******************************************/

        public int przeliczSurowce()
        {
            OleDbConnection con = MyConnection.getConnStrOle();
            OleDbCommand cmd = new OleDbCommand("SELECT COUNT (IndeksPolproduktu) FROM NazwyPolproduktow", con);

            try
            {
                con.Open();
                liczbaSurowcow = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                return liczbaSurowcow;
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }
        }

        /************************WYPISZ WSZYSTKIE SUROWCE Z LISTY (TEST) ****************************************/
        public void wypiszSurowce()
        {
            List<SurowiecInfo> surowce = PobierzSurowce();
            foreach (SurowiecInfo sur in surowce)
            {
                Label1.Text += sur.indeks + sur.nazwa;
            }
        }

        /***************************ZAPIS DO BAZY SQL (FORMATKA)****************************************/
        public void wstawDaneDoSql(string indeks, string nazwa, int paleta)
        {
            SqlConnection con = MyConnection.getConnStrSQL();
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Polprodukty (indeks, nazwa, paleta) VALUES (@indeks, @nazwa, @paleta)", con);

            cmd.Parameters.AddWithValue("indeks", indeks);
            cmd.Parameters.AddWithValue("nazwa", nazwa);
            cmd.Parameters.AddWithValue("paleta", paleta);
            cmd.ExecuteNonQuery();

            con.Close();
        }

        /*****************************ZAPIS DO BAZY SQL Z WYKORZYSTANIEM FUNKCJI*********************/

        public void zapisz()
        {
            List<SurowiecInfo> surowce = PobierzSurowce();
            foreach (SurowiecInfo sur in surowce)
            {
                wstawDaneDoSql(sur.indeks.ToString(), sur.nazwa.ToString(), Convert.ToInt32(sur.paleta));
            }
        }
    }
}