using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace HLOB2.Views.DzialKontroliJakosci.Surowce
{
    public partial class Analizy : System.Web.UI.Page
    {
        List<int> idParametrow;
        List<string> parametryTekst;
        List<string> parametryWartosci;

        protected void Page_Load(object sender, EventArgs e)
        {
            LabelError.Text = "";
            if (Page.IsPostBack)
            {
                wyswietlListe(DropDownListSurowce.SelectedValue.ToString());
            }
        }

        protected void DropDownListSurowce_SelectedIndexChanged(object sender, EventArgs e)
        {
            wyswietlListe(DropDownListSurowce.SelectedValue.ToString());
        }

        /*********************************WYŚWIETL LISTĘ ANALIZ**********************************/
        protected void wyswietlListe(string id)
        {
            DataTable dt = new DataTable();
            SqlConnection con = MyConnection.getConnStrSQL();
            try
            {
                con.Open();
                SqlCommand cmd =
                    new SqlCommand("SELECT numer, rodzaj, wykonal, dataWykonania " +
                        "FROM SurowceAnalizy WHERE surowiec=@id", con);

                cmd.Parameters.AddWithValue("id", id);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
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

        /********************************* ID WSZYSTKICH PARAMETRÓW**********************************/
        protected List<int> pobierzIdParametrow(string id)
        {
            idParametrow = new List<int>();
            SqlDataReader reader = null;
            SqlConnection con = MyConnection.getConnStrSQL();
            SqlCommand cmd = 
                new SqlCommand("SELECT parametrId FROM SurowceParametry WHERE surowiecId = @id", con);
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
            catch (SqlException err)
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

        /**********************************(TEST) - WYŚWIETL ID********************************/

        protected void wyswietlId(List<int> id)
        {
           
            foreach (int s in id)
            {
                LabelError.Text += s;
            }
        }

        /********************************FUNKCJA WYŚWIETLAJĄCA ID*******************************/

        protected void ButtonUkryjFarm_Click(object sender, EventArgs e)
        {
            pobierzIdParametrow(DropDownListSurowce.SelectedValue.ToString());
            wyswietlId(idParametrow);
            LabelError.Visible = true;
        }

        /**********************POBIERANIE NAZW PARAMETRÓW PO ID*******************************/

        protected void pobierzParametry(string id)
        {
            DataTable dt = new DataTable();
            SqlConnection con = MyConnection.getConnStrSQL();
            try
            {
                con.Open();
                SqlCommand cmd =
                    new SqlCommand("SELECT ps.parametrId, ps.nazwa, ps.wartosc, ps.wymagania, ps.wartoscWymagana, ps.uwagi " +
                        "FROM ParametrySurowcow ps, SurowceParametry sp WHERE sp.surowiecId LIKE @id " +
                        "AND sp.parametrId=ps.parametrId", con);
                cmd.Parameters.AddWithValue("id", id);
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);

                ListViewSpecyfikacjaFarm.DataSource = dt;
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

        protected void ButtonUkryjSpoz_Click(object sender, EventArgs e)
        {
            pobierzParametry(DropDownListSurowce.SelectedValue.ToString());
        }
    }
}