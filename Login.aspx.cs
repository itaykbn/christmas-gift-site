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
        private XMLAccesor xmlAccessor = ServiceLocator.Instance.GetService<XMLAccesor>();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.Form["submit"] != null)
            {
                Session["UserName"] = null;
                Session["Password"] = null;
                Session["Admin"] = null;

                string user = Request.Form["un"];
                string pass = Request.Form["pass"];
                string path = MapPath("AdminList.xml");
                if (xmlAccessor.isExsists(user, path)) 
                {
                    Session["Admin"] = "y";
                    Session["UserName"] = user;
                    Session["Password"] = pass;
                    Response.Redirect("AdminUserDetails.aspx");
                }

               else if (IsExist(user, pass))
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

    }
}