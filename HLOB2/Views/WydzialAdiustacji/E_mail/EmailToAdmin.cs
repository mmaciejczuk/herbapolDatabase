using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Data.OleDb;

namespace HLOB2.Views.WydzialAdiustacji.E_mail
{
    class EmailToAdmin
    {
        public SmtpClient client = new SmtpClient();
        public System.Net.NetworkCredential NetworkCred =
        new System.Net.NetworkCredential("herbapolob@gmail.com", "herbapol6946");

        public void SendEmail(string nadawca, string temat, string tresc)
        {
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            NetworkCred.UserName = "herbapolob@gmail.com";
            NetworkCred.Password = "herbapol6946";

            client.Port = 587;
            client.Credentials = NetworkCred;
            client.Send("herbapolob@gmail.com", "herbapolob@gmail.com", temat, tresc);

            OleDbConnection conn = MyConnection.getConnStrOle();

            conn.Open();
            OleDbCommand zapiszEmail = new OleDbCommand("INSERT INTO Emaile (nadawca, temat, tresc, " +
            "dataWyslania) VALUES (@nadawca, @temat, @tresc, @dataWyslania)", conn);

            zapiszEmail.Parameters.AddWithValue("nadawca", nadawca);
            zapiszEmail.Parameters.AddWithValue("temat", temat);
            zapiszEmail.Parameters.AddWithValue("tresc", tresc);
            zapiszEmail.Parameters.AddWithValue("dataWyslania", DateTime.Now.ToOADate());

            zapiszEmail.ExecuteNonQuery();
            conn.Close();
        }  
    }
}
