﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HLOB2
{
    public partial class Wyloguj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["__MySession__"] = null;
        }
    }
}