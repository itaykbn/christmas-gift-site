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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected int id = 0;
        protected int total;
        protected int totalAmount;
        protected string cartTable = "<table  style='border:none'>";
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
       
            DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
            string cmdString1 = string.Format("SELECT * FROM Cart WHERE ([UserName] = N'{0}')", Session["UserName"]);

            DataTable dataTable = dbAccessor.runSelectCmd(cmdString1);
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                cartTable +=
                    "<tr><td> Item: " + dataTable.Rows[i]["OrderName"] + "</td>"
                    + "<td> Item number: " + dataTable.Rows[i]["OrderId"] + " </td ></tr> "
                    + "<td> Price: " + dataTable.Rows[i]["Price"] + " </td >";

                totalAmount += (int)dataTable.Rows[i]["Price"];
            }

            cartTable += "</table>";

            if (Request.Form["submit"] != null)
            {
                string delCmd = string.Format($"delete from Cart where OrderId = {id}");
                dbAccessor.runSqlCommand(delCmd);

                Response.Redirect("Cart.aspx");
            }
            Session["TotalPrice"] = totalAmount;

            //   }
        }

        private bool isExist(string user, int id)
        {
            string cmdString = string.Format($"SELECT * FROM  Cart WHERE UserName = N'{user}' and OrderId = {id} ");
    
            DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
            return dbAccessor.isExist(cmdString);

        }
    }
}