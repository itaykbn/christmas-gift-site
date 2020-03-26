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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected string userDetailsTable = "";
        public string userStr;
        protected string fullName = "";
        private XMLAccesor xmlAccessor = ServiceLocator.Instance.GetService<XMLAccesor>();
        protected void Page_Load(object sender, EventArgs e)
        {

            userStr = (string)Session["UserName"];
            if(userStr == null  )
            {
                Response.Redirect("Register.aspx");
            }
            if((string)Session["Admin"] == "y")
            {
                Response.Redirect("AdminUserDetails.aspx");
            }

            else
            {
                string cmdString = string.Format("SELECT * FROM UserDetails WHERE ([UserName] = N'{0}')", Session["UserName"]);
                DBAccesor dB = ServiceLocator.Instance.GetService<DBAccesor>();
                DataTable dataTable = dB.runSelectCmd(cmdString);

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    fullName += dataTable.Rows[i]["FirstName"].ToString() + " " + dataTable.Rows[i]["LastName"].ToString();
                    userDetailsTable += "<table style='border:none'><tr><td>User name: "
                        + dataTable.Rows[i]["UserName"] + "</td></tr>" + "<tr><td>Password: "
                        + dataTable.Rows[i]["Password"] + "</td></tr>" + "<tr><td>Mail: "
                        + dataTable.Rows[i]["Mail"] + "</td></tr>" + "<tr><td>Phone: "
                        + dataTable.Rows[i]["Phone"] + "</td></tr>" + "<tr><td>Address: "
                        + dataTable.Rows[i]["Adress"] + "</td></tr>" + "<tr><td>Gender: "
                        + dataTable.Rows[i]["Gender"] + "</td></tr>" + "<tr><td>Date of Birth: "
                        + dataTable.Rows[i]["DateOfBirth"] + "</td></tr>";
                }

                userDetailsTable += "</table>";

            }
        }
    }
}