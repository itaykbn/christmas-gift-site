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
    public partial class WebForm5 : System.Web.UI.Page
    {
        /**
         * Get form params by name and remove speial characters
         */
        private string getNCleanRequestParamByName(string paramName)
        {
            string request = Request.Form[paramName].Replace("'", "");
            if (request == "")
            {
                request = "No data";
            }
            return request;
        }

        /**
         * Logic behind the page check if account exists 
         * Creates record for new users
         * Redirect for Login or error pages.
         */
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Form["submit"] != null)
            {
                string Fname = getNCleanRequestParamByName("fname");
                string Lname = getNCleanRequestParamByName("lname");
                string DOB = getNCleanRequestParamByName("bd");
                string user = getNCleanRequestParamByName("un");
                string pass = getNCleanRequestParamByName("pass");
                string address = getNCleanRequestParamByName("address");
                string mail = getNCleanRequestParamByName("mail");
                string gender = getNCleanRequestParamByName("gender");
                string phone = getNCleanRequestParamByName("phone");

                Session["UserName"] = user;
                if (mail != "" && user != "")
                {
                    if (isExistsMail(mail))
                    {
                        Session["ErrorText"] = mail + " כבר קיים";
                        Response.Redirect("ErrorPage.aspx");
                        Response.End();
                    }

                    if (isExistsUserName(user))
                    {
                        Session["ErrorText"] = user + " כבר קיים";
                        Response.Redirect("ErrorPage.aspx");
                        Response.End();
                    }


                    string cmdStr = string.Format("INSERT INTO UserDetails(FirstName, LastName, UserName , Password , Mail ,  Phone, Adress, Gender, DateOfBirth) VALUES (N'{0}', N'{1}', N'{2}', N'{3}', N'{4}', N'{5}',  N'{6}',N'{7}',N'{8}')", Fname, Lname, user, pass, mail, phone, address, gender, DOB);
                    
                    DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
                    if (dbAccessor.runSqlCommand(cmdStr) == 1)
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }

        /**
         * Check  if input mail is exist
         * returns true if exist
         */
        private bool isExistsMail(string mail)
        {
            string cmdString = string.Format("SELECT * FROM UserDetails WHERE (Mail = N'{0}')", mail);
            return checkDB(cmdString);
        }

        /**
          * Check  if input user name is exist
          * returns true if exist
         */
        private bool isExistsUserName(string user)
        {
            string cmdString = string.Format("SELECT * FROM  UserDetails WHERE ([UserName] = N'{0}')", user);
            return checkDB(cmdString);
        }

        /**
         * Run query against DB
         * return true if result exist otherwise false.
         */
        private bool checkDB(string query)
        {
            DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
            return dbAccessor.isExist(query);
        }
    }
}

