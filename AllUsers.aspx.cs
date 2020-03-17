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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected string userTable = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["UserName"] == null)
            {
                Session["ErrorText"] = "לאורח אין גישה לעמוד זה ";
                Response.Redirect("ErrorPage.aspx");
            }

            else
            {
                DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
                string cmdString = string.Format("SELECT * FROM UserDetails");
                DataTable dataTable= dbAccessor.runSelectCmd(cmdString);

                for (int i = 0; i < dataTable.Rows.Count; i++)
                    userTable +=
                        "<table><tr><td>User name: " + dataTable.Rows[i]["UserName"]
                        + "</td></tr>" + "<tr><td>Password: " + dataTable.Rows[i]["Password"]
                        + "</td></tr>" + "<tr><td>Mail: " + dataTable.Rows[i]["Mail"]
                        + "</td></tr>" + "<tr><td>Phone: " + dataTable.Rows[i]["Phone"]
                        + "</td></tr>" + "<tr><td>Address: " + dataTable.Rows[i]["Adress"]
                        + "</td></tr>" + "<tr><td>Gender: " + dataTable.Rows[i]["Gender"]
                        + "</td></tr>" + "<tr><td>Date of Birth: " + dataTable.Rows[i]["DateOfBirth"]
                        + "</td></tr>";
            }

            userTable += "</table>";
        }
    }
}


