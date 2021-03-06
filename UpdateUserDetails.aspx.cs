﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml;
using regestrationV2.services;

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

                string cmdStr = string.Format("SELECT  * FROM  UserDetails WHERE (UserName = N'{0}')", user);
                DBAccesor dbAccesor = ServiceLocator.Instance.GetService<DBAccesor>();
                DataTable dataTable = dbAccesor.runSelectCmd(cmdStr);

                
                password = dataTable.Rows[0]["Password"].ToString();
                mail = dataTable.Rows[0]["Mail"].ToString();
                phone = dataTable.Rows[0]["Phone"].ToString();
                address = dataTable.Rows[0]["Adress"].ToString();
                birthDate = dataTable.Rows[0]["DateOfBirth"].ToString();
                lName = dataTable.Rows[0]["LastName"].ToString();
                fName = dataTable.Rows[0]["FirstName"].ToString();


                if (Request.Form["updateBtn"] != null)
                {

                    password = Request.Form["pass"].ToString();
                    mail = Request.Form["mail"].ToString();
                    phone = Request.Form["phone"].ToString();
                    address = Request.Form["address"].ToString();
                   
                    birthDate = Request.Form["bd"].ToString();
                    lName = Request.Form["lname"].ToString();
                    fName = Request.Form["fname"].ToString();
                    gender = "Rather not say";
                    if (Request.Form["gender"] != null)
                    {
                        gender = Request.Form["gender"].ToString();
                    }


                    if (gender == "")
                        {
                            gender = "No Data";
                        }
                        if (phone == "")
                        {
                            phone = "No Data";
                        }
                        if (address == "")
                        {
                        address = "No Data";
                        }


                    
                    dataTable.Rows[0]["FirstName"] = fName;
                    dataTable.Rows[0]["LastName"] = lName;
                    dataTable.Rows[0]["Password"] = password;
                    dataTable.Rows[0]["Mail"] = mail;
                    dataTable.Rows[0]["Phone"] = phone;
                    dataTable.Rows[0]["Adress"] = address;
                    dataTable.Rows[0]["Gender"] = gender;
                    dataTable.Rows[0]["DateOfBirth"] = birthDate;

                    dbAccesor.updateTable(cmdStr, dataTable);
                    Response.Redirect("UserDetails.aspx");
                }
            }


        }

    }
}
