using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml;

namespace regestrationV2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected string user;
        protected string password;
        protected string mail;
        protected string phone;
        protected string address;
        protected string gender;
        protected string birthDate;
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
                user = Session["UserName"].ToString();

                

                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\regestrationV2\App_Data\User_Data.mdf;Integrated Security=True";

                string cmdStr = string.Format("SELECT  * FROM  UserDetails WHERE (UserName = N'{0}')", user);

                SqlDataAdapter da = new SqlDataAdapter(cmdStr, connectionString);
                DataSet ds = new DataSet(); 
                da.Fill(ds); 
                password = ds.Tables[0].Rows[0]["Password"].ToString();
                mail = ds.Tables[0].Rows[0]["Mail"].ToString();
                phone = ds.Tables[0].Rows[0]["Phone"].ToString();
                address = ds.Tables[0].Rows[0]["Adress"].ToString();
                gender = ds.Tables[0].Rows[0]["Gender"].ToString();
                birthDate = ds.Tables[0].Rows[0]["DateOfBirth"].ToString();
                lName = ds.Tables[0].Rows[0]["LastName"].ToString();
                fName = ds.Tables[0].Rows[0]["FirstName"].ToString();


                if (Request.Form["updateBtn"] != null)
                {
                    
                    password = Request.Form["pass"].ToString();
                    mail = Request.Form["mail"].ToString();
                    phone = Request.Form["phone"].ToString();
                    address = Request.Form["address"].ToString();
                    gender = Request.Form["gender"].ToString();
                    birthDate = Request.Form["bd"].ToString();
                    lName = Request.Form["lname"].ToString();
                    fName = Request.Form["fname"].ToString();

                    ds.Tables[0].Rows[0]["FirstName"] = fName;
                    ds.Tables[0].Rows[0]["LastName"] = lName;
                    ds.Tables[0].Rows[0]["Password"] = password;
                    ds.Tables[0].Rows[0]["Mail"] = mail;
                    ds.Tables[0].Rows[0]["Phone"] = phone;
                    ds.Tables[0].Rows[0]["Adress"] = address;
                    ds.Tables[0].Rows[0]["Gender"] = gender;
                    ds.Tables[0].Rows[0]["DateOfBirth"] = birthDate;

                    SqlCommandBuilder builder = new SqlCommandBuilder(da);
                    da.UpdateCommand = builder.GetUpdateCommand();
                    da.Update(ds);

                    Response.Redirect("UserDetails.aspx");
                }
            }


        }




    }
}
