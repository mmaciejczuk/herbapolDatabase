using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HLOB2
{
    public class MySession
    {
        private MySession()
        {
        }

        public static MySession Current
        {
            get
            {
                MySession session =
                (MySession)HttpContext.Current.Session["__MySession__"];
                if (session == null)
                {
                    session = new MySession();
                    HttpContext.Current.Session["__MySession__"] = session; 
                }
                return session;
            }
        }
        public string pracownikId { get; set; }
        public string imieNazwisko { get; set; }
        public string stanowisko { get; set; }
        public string dzial { get; set; }
        public string ostatnieLogowanie { get; set; }
        public int analizaId { get; set; }
    }
}