using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using regestrationV2.services;

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
            string cmdStr = string.Format("SELECT * FROM UserDetails WHERE [UserName]=N'{0}' and Password=N'{1}'", username, password);
            DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
            return dbAccessor.isExist(cmdStr);
        }

        private bool IsAdmin(string user)
        {
            XMLAccesor xmlAccessor = ServiceLocator.Instance.GetService<XMLAccesor>();
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