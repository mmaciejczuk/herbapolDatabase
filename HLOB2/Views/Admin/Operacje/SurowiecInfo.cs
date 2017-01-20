using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HLOB2.Views.Admin.Operacje
{
    public class SurowiecInfo
    {
        public string indeks { get; set; }
        public string nazwa { get; set; }
        public int paleta { get; set; }

        public SurowiecInfo(string indeks, string nazwa, int paleta)
        {
            this.indeks = indeks;
            this.nazwa = nazwa;
            this.paleta = paleta;
        }
    }
}
