using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace regestrationV2
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["Password"] = null;
            Session["Admin"] = null;

            if (Request.Form["submit"] != null)
            {      
                string user = Request.Form["un"];
                string pass = Request.Form["pass"];
                
                if (IsAdmin(user) == true)
                {
                    Session["Admin"] = "y";
                }

                if (IsExist(user, pass))
                {
                    Session["UserName"] = user;
                    Session["Password"] = pass;
                    Response.Redirect("UserDetails.aspx");
                }
                else
                {
                    Session["ErrorText"] = "שגיאה בשם המשתמש או בסיסמה";
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }
        /**
         * Validates user details against DB
         * returns true if user details exist.
         */
        private bool IsExist(string username, string password)
        {
         
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";

            using (SqlConnection conObj = new SqlConnection(connectionString))
            {
                string cmdStr = string.Format("SELECT * FROM UserDetails WHERE [UserName]=N'{0}' and Password=N'{1}'", username, password);

                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();

                SqlDataReader dr = cmdObj.ExecuteReader();

                return dr.HasRows;
            }
        }

        private bool IsAdmin(string user)
        {

            DataSet ds = new DataSet();
            ds.ReadXml(System.Web.HttpContext.Current.Server.MapPath("AdminList.xml"));
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (user.Equals(r[0]))
                {
                    return true;
                }
            }

            return false;
        }
    }
}