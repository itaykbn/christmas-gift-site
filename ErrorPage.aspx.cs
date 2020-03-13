using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace regestrationV2
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected string errorStr;
        protected void Page_Load(object sender, EventArgs e)
        {
            errorStr = (string)Session["ErrorText"];

            if(errorStr == null)
            {
                errorStr = "טעות במידע";
            }
        }
    }
}