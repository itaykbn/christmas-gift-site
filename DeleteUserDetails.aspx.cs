using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm2 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if ((string)Session["UserName"] == null)
            {
                Session["ErrorText"] = "לאורח אין גישה לעמוד זה ";
                Response.Redirect("ErrorPage.aspx");
            }
            string btn = Request.Form["DelUsr"];
            if (btn != null)
            {
                string cmdString = string.Format("DELETE From Cart Where OrderId in (select c.OrderId from Cart c, UserDetails ud  where c.UserName = ud.UserName and ud.UserName =  N'{0}') Delete FROM UserDetails Where (UserName = N'{0}')", Session["UserName"]);
                DBAccesor adbAccesor = ServiceLocator.Instance.GetService<DBAccesor>();
                adbAccesor.runSqlCommand(cmdString);
                Response.Redirect("Login.aspx");
                
            }
        }
    }
}