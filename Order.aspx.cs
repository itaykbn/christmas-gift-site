using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace regestrationV2
{
    
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected int total;

        protected void Page_Load(object sender, EventArgs e)
        {
            total = (int)Session["TotalPrice"];
            if(total == 0)
            {
                Session["ErrorText"] = "כדי להזמין צריך שיהיה מוצרים בעגלה";
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}