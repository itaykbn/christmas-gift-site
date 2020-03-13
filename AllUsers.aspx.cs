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






                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string cmdString = string.Format("SELECT * FROM UserDetails");
                    SqlCommand cmd = new SqlCommand(cmdString, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmdString, connectionString);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        userTable += 
                            "<table><tr><td>User name: " + ds.Tables[0].Rows[i]["UserName"]
                            + "</td></tr>" + "<tr><td>Password: " + ds.Tables[0].Rows[i]["Password"] 
                            + "</td></tr>" + "<tr><td>Mail: " + ds.Tables[0].Rows[i]["Mail"]
                            + "</td></tr>" + "<tr><td>Phone: " + ds.Tables[0].Rows[i]["Phone"] 
                            + "</td></tr>" + "<tr><td>Address: " + ds.Tables[0].Rows[i]["Adress"] 
                            + "</td></tr>" + "<tr><td>Gender: " + ds.Tables[0].Rows[i]["Gender"] 
                            + "</td></tr>" + "<tr><td>Date of Birth: " + ds.Tables[0].Rows[i]["DateOfBirth"] 
                            + "</td></tr>" ;
                    }

                    userTable += "</table>";
                }
            }
        }
    }