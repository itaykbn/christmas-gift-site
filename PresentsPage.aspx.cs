﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace regestrationV2
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ((string)Session["Admin"] == "y")
            {
                Session["ErrorText"] = "This account is for business only";
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}