using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm23 : System.Web.UI.Page
    {
        protected string user;
        protected string password;
        protected string mail;
        protected string phone;
        protected string lName;
        protected string fName;
        
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["UserName"] == null)
            {
                Session["ErrorText"] = "לאורח אין גישה לעמוד זה ";
                Response.Redirect("ErrorPage.aspx");
            }


            else
            {
                string path = MapPath("AdminList.xml");
                user = Session["UserName"].ToString();
                XMLAccesor xmlAccesor = ServiceLocator.Instance.GetService<XMLAccesor>();
                string[] values = xmlAccesor.returnValues(path, user);
                password = values[1];
                mail = values[2];
                phone = values[3];
                fName = values[4];
                lName = values[5];


                if (Request.Form["updateBtn"] != null)
                {

                    password = Request.Form["pass"].ToString();
                    mail = Request.Form["mail"].ToString();
                    phone = Request.Form["phone"].ToString();
                    lName = Request.Form["lname"].ToString();
                    fName = Request.Form["fname"].ToString();
                    string[] updatedValues = new string[] {user,password,mail,phone,fName,lName};
                    string[] order = new string[] { "UserName" , "Password" , "Email", "Phone", "FirstName", "LastName" };
                    xmlAccesor.update(path, updatedValues, order);
                    Response.Redirect("AdminUserDetails.aspx");
                }
            }


        }
    }
}