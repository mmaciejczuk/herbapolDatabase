using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

namespace HLOB2
{
    public class LastLog
    {
        public string wyswietl(string id)
        {
            string date = "";
            OleDbConnection con = MyConnection.getConnStrOle();
            OleDbDataReader reader = null;
            try
            {
                con.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT ostatnieLogowanie FROM Pracownicy WHERE pracownikId LIKE @id", con);
                cmd.Parameters.AddWithValue("id", id);

                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    date = "Twoje ostatnie logowanie: " + reader[0].ToString();
                }
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
            finally
            {
                con.Close();
                reader.Close();
            }

            return date;
        }
    }
}