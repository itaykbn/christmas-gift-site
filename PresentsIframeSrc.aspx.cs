using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace regestrationV2
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        private string item;
        private int price;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                bool chocolate = Request.Form["cartChocolate"] != null;
                bool bush = Request.Form["cartBush"] != null;
                bool mug = Request.Form["smartMug"] != null;
                if (bush || chocolate || mug)
                {

                    if (chocolate)
                    {
                        item = "chocolate";
                        price = 20;
                        InsertToDB(item,price);

                    }
                    if (bush)
                    {
                        item = "christmas wreath";
                        price = 30;
                        InsertToDB(item, price);
                    }
                    if(mug)
                    {
                        item = "smart mug";
                        price = 60;
                        InsertToDB(item, price);
                    }

                }
            }
            
        }

        private void InsertToDB(string item, int price)
        {

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";
            string cmdStr = string.Format($"INSERT INTO Cart(OrderName, UserName, Price) VALUES (N'{item}', N'{Session["UserName"]}', {price})");

            using (SqlConnection conObj = new SqlConnection(connectionString))
            {
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                cmdObj.ExecuteNonQuery();

            }
        }

    }
}