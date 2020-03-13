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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected int id = 0;
        protected int total;
        protected int totalAmount;
        protected string cartTable = "<table>";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Session["ErrorText"] = "לאורח אין גישה לעמוד זה - כדי להזמין עליך להירשם ";
                Response.Redirect("ErrorPage.aspx");
            }

            if (Request.Form["submit"] != null)
            {
                id = int.Parse(Request.Form["delId"]);
                if (isExist((string)Session["UserName"], int.Parse(Request.Form["delId"])) == false)
                {
                    Session["ErrorText"] = "הזמנה זו לא שלך הכנס את המספר המתאים בבקשה";
                    Response.Redirect("ErrorPage.aspx");
                }

            }
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {


                string cmdString1 = string.Format("SELECT * FROM Cart WHERE ([UserName] = N'{0}')", Session["UserName"]);
                SqlCommand cmd1 = new SqlCommand(cmdString1, conn);


                string cmdString2 = string.Format($"delete from Cart where OrderId = {id}");

                SqlCommand cmd2 = new SqlCommand(cmdString2, conn);

                conn.Open();

                SqlDataAdapter da = new SqlDataAdapter(cmdString1, connectionString);
                DataSet ds = new DataSet();
                da.Fill(ds);




                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    cartTable +=
                        "<tr><td> Item: " + ds.Tables[0].Rows[i]["OrderName"] + "</td>"
                        + "<td> ItemNum: " + ds.Tables[0].Rows[i]["OrderId"] + " </td ></tr> "
                        + "<td> Price: " + ds.Tables[0].Rows[i]["Price"] + " </td >";

                    totalAmount += (int)ds.Tables[0].Rows[i]["Price"];
                }

                cartTable += "</table>";
                if (Request.Form["submit"] != null)
                {
                    cmd2.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");
                }
                Session["TotalPrice"] = totalAmount;




            }
        }

        private bool isExist(string user, int id)
        {
            string cmdString = string.Format($"SELECT * FROM  Cart WHERE UserName = N'{user}' and OrderId = {id} ");
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(cmdString, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                return dr.HasRows;
            }

        }
    }
}