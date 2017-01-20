using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace HLOB2.MasterPages
{
    public partial class WydzialAdiustacji : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["__MySession__"] != null)
            {
                Label1.Text = "Jesteś zalogowany jako " + MySession.Current.imieNazwisko;
                LinkButton1.Text = "Wyloguj się";
                LinkButton1.PostBackUrl = "~/Wyloguj.aspx";
                if (!IsPostBack)
                {
                    //aktualizujDatyDoArchiwum();
                }                
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        //protected void aktualizujDatyDoArchiwum()
        //{
        //    OleDbConnection conn = MyConnection.getConnStrOle();
        //    conn.Open();
        //    OleDbCommand sprawdzUzytkownika =
        //        new OleDbCommand("SELECT datyZleceniaAuto FROM DatyArchiwum WHERE id=1", conn);
        //    bool temp = Convert.ToBoolean(sprawdzUzytkownika.ExecuteScalar());
        //    if (temp)
        //    {
        //        OleDbConnection con = MyConnection.getConnStrOle();
        //        OleDbCommand cmd =
        //            new OleDbCommand("UPDATE [DatyArchiwum] SET dataRozpZlecenia = @dataRozpZlecenia " +
        //            "WHERE id=1", con);
        //        cmd.Parameters.AddWithValue("dataRozpZlecenia", DateTime.Now.AddMonths(-2).ToString());
        //        try
        //        {
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //        }
        //        catch (OleDbException err)
        //        {

        //        }
        //        finally
        //        {
        //            con.Close();
        //        }
        //    }
        //    else
        //        conn.Close();
        //}
    }
}