using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace HLOB2.Views.WydzialAdiustacji.Zlecenia
{
    public partial class Realizacja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (MySession.Current.dzial != "1")
                {
                    CollapsiblePanelExtender1.Collapsed = false;
                    CollapsiblePanelExtender2.Collapsed = true;
                }
                else
                {
                    CollapsiblePanelExtender1.Collapsed = true;
                    CollapsiblePanelExtender2.Collapsed = false;
                }
            
                LabelInfo2.Text = LabelInfo(Request.QueryString["zlecenieId"].ToString());

                DataTable dtWA = LoadFormWydzialAdiustacji();
                ListViewWydzialAdiustacji.DataSource = dtWA;
                ListViewWydzialAdiustacji.DataBind();

                //DataTable dtWAS = LoadFormWydzialAdiustacjiSzczegoly();
                //ListViewWydzialAdiustacjiSzczegoly.DataSource = dtWAS;
                //ListViewWydzialAdiustacjiSzczegoly.DataBind();

                DataTable dtDM = LoadFormViewDzialMagazynow();
                ListViewDzialMagazynow.DataSource = dtDM;
                ListViewDzialMagazynow.DataBind();

                //DataTable dtDMS = LoadFormViewDzialMagazynowSzczegoly();
                //ListViewDzialMagazynowSzczegoly.DataSource = dtDMS;
                //ListViewDzialMagazynowSzczegoly.DataBind();
            }
        }

        protected string LabelInfo(string zlecenieId)
        {
            string zlecenie = "";
            string polprodukt = "";
            string seria = "";
            string status = "";
            OleDbDataReader reader = null;
            OleDbConnection conn = MyConnection.getConnStrOle();
            conn.Open();
            OleDbCommand hasloCommand =
                new OleDbCommand("SELECT z.numer, p.nazwa, z.seria, s.nazwa " +
                    "FROM StatusyZlecen s, Polprodukty p, Zlecenia z WHERE " +
                    "z.polprodukt=p.polproduktId AND z.status=s.statusId AND z.zlecenieId=@zlecenieId", conn);
            hasloCommand.Parameters.AddWithValue("z.zlecenieId", zlecenieId);

            reader = hasloCommand.ExecuteReader();

            while (reader.Read())
            {
                zlecenie = (reader[0].ToString());
                polprodukt = (reader[1].ToString());
                seria = (reader[2]).ToString();
                status = (reader[3]).ToString();
            }

            conn.Close();
            return "Zlec. nr " + zlecenie + "/219 &nbsp;" + "-" + "&nbsp;" + " " + polprodukt + " s. " + seria +
                " " + "(" + status + ")";
        }

        protected DataTable LoadFormWydzialAdiustacji()
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            DataTable dt = new DataTable();
            conn.Open();
            string sql = "SELECT [formularzId], z.numer As zlecenie, d.nazwa As dzialId, [dataRozpoczecia], " +
            "f.dataZakonczenia, f.wagaPolproduktu, f.workiPp, f.palety, f.wagaOdpadu, f.workiOdp, " +
            "f.roboczogodziny, f.maszynogodziny, f.uwagi, f.zakonczone, f.rozpoczete, f.nierozpoczete " +
            "FROM [FormularzeRealizacji] As f, [Dzialy] As d, [Zlecenia] As z WHERE f.dzialId=d.dzialId AND f.zlecenie=z.zlecenieId " +
            "AND zlecenie=@zlecenie AND f.dzialId=@dzial";
            OleDbCommand cmd = new OleDbCommand(sql);
            cmd.Parameters.AddWithValue("zlecenie", Request.QueryString["zlecenieId"].ToString());
            cmd.Parameters.AddWithValue("dzialId", "1");    // 1 - Wydział Adiustacji
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            OleDbDataAdapter sd = new OleDbDataAdapter(cmd);
            sd.Fill(dt);
            conn.Close();
            return dt;
        }
        protected DataTable LoadFormWydzialAdiustacjiSzczegoly()
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            DataTable dt = new DataTable();
            conn.Open();
            //string sql = "SELECT r.realizacjaId, r.formularzId, r.dzialId, r.operacja, " +
            //"r.zmiana, r.wagaPolproduktu, r.workiPp, r.wagaOdpadu, r.workiOdp, r.roboczogodziny, " +
            //"r.maszynogodziny FROM RealizacjeDzienne r" +
            //"AND zlecenie=@zlecenie AND r.dzialId=@dzial";
            //OleDbCommand cmd = new OleDbCommand(sql);
            //cmd.Parameters.AddWithValue("zlecenie", Request.QueryString["zlecenieId"].ToString());
            //cmd.Parameters.AddWithValue("dzialId", "1");    // 1 - Wydział Adiustacji
            //cmd.CommandType = CommandType.Text;
            //cmd.Connection = conn;
            //OleDbDataAdapter sd = new OleDbDataAdapter(cmd);
            //sd.Fill(dt);
            conn.Close();
            return dt;
        }

        protected DataTable LoadFormViewDzialMagazynow()
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            DataTable dt = new DataTable();
            conn.Open();
            string sql = "SELECT [formularzId], z.numer As zlecenie, d.nazwa As dzialId, [dataRozpoczecia], " +
            "f.dataZakonczenia, f.wagaPolproduktu, f.workiPp, f.palety, f.wagaOdpadu, f.workiOdp, " +
            "f.roboczogodziny, f.maszynogodziny, f.uwagi, f.zakonczone, f.rozpoczete, f.nierozpoczete " +
            "FROM [FormularzeRealizacji] As f, [Dzialy] As d, [Zlecenia] As z WHERE f.dzialId=d.dzialId AND f.zlecenie=z.zlecenieId " +
            "AND zlecenie=@zlecenie AND f.dzialId=@dzial";
            OleDbCommand cmd = new OleDbCommand(sql);
            cmd.Parameters.AddWithValue("zlecenie", Request.QueryString["zlecenieId"].ToString());
            cmd.Parameters.AddWithValue("dzialId", "2");    // 2 - Dział Magzynów i Transportu
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            OleDbDataAdapter sd = new OleDbDataAdapter(cmd);
            sd.Fill(dt);
            conn.Close();
            return dt;
        }
        protected DataTable LoadFormViewDzialMagazynowSzczegoly()
        {
            OleDbConnection conn = MyConnection.getConnStrOle();
            DataTable dt = new DataTable();
            conn.Open();
            //string sql = "SELECT [formularzId], z.numer As zlecenie, d.nazwa As dzialId, [dataRozpoczecia], " +
            //"f.dataZakonczenia, f.wagaPolproduktu, f.workiPp, f.palety, f.wagaOdpadu, f.workiOdp, " +
            //"f.roboczogodziny, f.maszynogodziny, f.uwagi, f.zakonczone, f.rozpoczete, f.nierozpoczete " +
            //"FROM [FormularzeRealizacji] As f, [Dzialy] As d, [Zlecenia] As z WHERE f.dzialId=d.dzialId AND f.zlecenie=z.zlecenieId " +
            //"AND zlecenie=@zlecenie AND f.dzialId=@dzial";
            //OleDbCommand cmd = new OleDbCommand(sql);
            //cmd.Parameters.AddWithValue("zlecenie", Request.QueryString["zlecenieId"].ToString());
            //cmd.Parameters.AddWithValue("dzialId", "2");    // 2 - Dział Magzynów i Transportu
            //cmd.CommandType = CommandType.Text;
            //cmd.Connection = conn;
            //OleDbDataAdapter sd = new OleDbDataAdapter(cmd);
            //sd.Fill(dt);
            conn.Close();
            return dt;
        }



        //protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        //{
        //    int Id = 0;
        //    string FirstName = string.Empty;
        //    string LastName = string.Empty;
        //    string ContactType = string.Empty;
        //    Label lbl = (ListView1.Items[e.ItemIndex].FindControl("IDLabel")) as Label;

        //    if (lbl != null)

        //        Id = Convert.ToInt32(lbl.Text);


        //    ListViewItem Item = (ListViewItem)ListView1.Items[e.ItemIndex];
        //    TextBox Txt = (ListView1.Items[e.ItemIndex].FindControl("FirstNameTextBox")) as TextBox;
        //    TextBox txt2 = (ListView1.Items[e.ItemIndex].FindControl("LastNameTextBox")) as TextBox;
        //    TextBox txt3 = (ListView1.Items[e.ItemIndex].FindControl("ContactType")) as TextBox;
        //    SqlConnection con = new SqlConnection(Connection);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("UPDATE [ListView] SET [FirstName] = '" + FirstName + "', [LastName] = '" + LastName + "', [ContactType] = '" + ContactType + "' WHERE [ID] = '" + ID + "'");
        //    ListView1.EditIndex = -1;
        //    con.Close();
        //}

        //protected void ListView1_ItemEditing(object sender, ListViewEditEventArgs e)
        //{
        //    ListView1.EditIndex = e.NewEditIndex;
        //    SqlConnection Con = new SqlConnection(Connection);
        //    Da = new SqlDataAdapter("select * from ListView", Con);
        //    DataTable dt = new DataTable();
        //    ListView1.DataSource = dt;
        //    ListView1.DataBind();
        //}

        //protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        //{
        //    int Id = 0;
        //    string FirstName = string.Empty;
        //    string LastName = string.Empty;
        //    string ContactType = string.Empty;
        //    Label lbl = (ListView1.Items[e.ItemIndex].FindControl("IDLabel")) as Label;

        //    if (lbl != null)

        //        Id = Convert.ToInt32(lbl.Text);


        //    ListViewItem Item = (ListViewItem)ListView1.Items[e.ItemIndex];
        //    TextBox Txt = (ListView1.Items[e.ItemIndex].FindControl("FirstNameTextBox")) as TextBox;
        //    TextBox txt2 = (ListView1.Items[e.ItemIndex].FindControl("LastNameTextBox")) as TextBox;
        //    TextBox txt3 = (ListView1.Items[e.ItemIndex].FindControl("ContactType")) as TextBox;
        //    SqlConnection con = new SqlConnection(Connection);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("UPDATE [ListView] SET [FirstName] = '" + FirstName + "', [LastName] = '" + LastName + "', [ContactType] = '" + ContactType + "' WHERE [ID] = '" + ID + "'");
        //    ListView1.EditIndex = -1;
        //    con.Close();
        //}

        //protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListViewItemType.DataItem)
        //    {
        //        ListViewDataItem dataItem = (ListViewDataItem)e.Item;
        //        if (dataItem.DisplayIndex == ListView1.EditIndex)
        //        {
        //            TextBox tb = e.Item.FindControl("FirstNameTextBox") as TextBox;
        //            TextBox TB = e.Item.FindControl("LastNameTextBox") as TextBox;
        //        }
        //    }
        //}

        //protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        //{
        //    int id = 0;
        //    Label lbl = (ListView1.Items[e.ItemIndex].FindControl("IDLabel")) as Label;
        //    if (lbl.Text != "0")
        //        id = Convert.ToInt32(lbl.Text);
        //    string DeleteQuery = "Delete from ListView WHERE [ID] = '" + ID + "'";
        //    SqlConnection con = new SqlConnection(Connection);
        //    con.Open();
        //    SqlCommand com = new SqlCommand(DeleteQuery, con);
        //    com.ExecuteNonQuery();
        //    con.Close();
        //    ListView1.EditIndex = -1;
        //    Da = new SqlDataAdapter("select * from listview", con);
        //    DataTable dt = new DataTable();
        //    Da.Fill(dt);
        //    ListView1.DataSource = dt;
        //    ListView1.DataBind();
        //}

        protected void button_Click(object sender, EventArgs e)
        {
            //string queryString = Request.QueryString["zlecenieId"].ToString();

            // open a pop up window at the center of the page.
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = " +
                "(screen.width/2)-(645/2);var Mtop = (screen.height/2)-(845/2);" +
                "window.open( 'OEE.aspx?realizacjaId=" + DetailsViewRealizacjaWA.DataKey[0].ToString() + "' " + 
                ", null, 'height=845,width=645,status=yes,toolbar=no," +
                "scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);
        }

    }
}