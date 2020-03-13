using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


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
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string cmdString = string.Format("DELETE From Cart Where OrderId in (select c.OrderId from Cart c, UserDetails ud  where c.UserName = ud.UserName and ud.UserName =  N'{0}') Delete FROM UserDetails Where (UserName = N'{0}')", Session["UserName"]);
                    SqlCommand cmd = new SqlCommand(cmdString, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                  
                }
            }
        }
    }
}