using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace HLOB2.Views.DzialKontroliJakosci.Polprodukty
{
    public partial class Specyfikacje : System.Web.UI.Page
    {
        List<string> specyfikacjeAlias = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            wyswietlDropDownListSpecyfikacjeAlias("7");
            foreach (string s in specyfikacjeAlias)
                Label1.Text += s;
        }

        protected void wyswietlDropDownListSpecyfikacjeAlias(string id)
        {
            specyfikacjeAlias = new List<string>();
            OleDbDataReader reader = null;
            OleDbConnection con = MyConnection.getConnStrOle();

            OleDbCommand cmd =
                new OleDbCommand("SELECT ss.numer FROM SpecyfikacjeSurowcow ss, " +
                                "AliasySpecyfikacje asp, SurowceAliasy sa " +
                                "WHERE sa.aliasId LIKE @aliasId AND sa.aliasId=asp.aliasId " +
                                "AND asp.specyfikacjaId=ss.specyfikacjaId;", con);

            cmd.Parameters.AddWithValue("aliasId", id);
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    specyfikacjeAlias.Add(reader.GetString(0));
                }

            }
            catch (OleDbException err)
            {
                Label1.Text = err.ToString();
            }
            finally
            {
                reader.Close();
                con.Close();
            }
        }
    }
}