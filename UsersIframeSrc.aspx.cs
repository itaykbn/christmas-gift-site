using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        public string deleteWhere = "";
        public string filterWhere = "";
        protected string userTable = " <tr><th>שם פרטי</th><th>שם משפחה</th><th>שם משתמש</th><th>סיסמה</th><th>מייל</th><th>טלפון</th><th>בחר</th><th>עדכן</th></tr>  ";
        protected void Page_Load(object sender, EventArgs e)
        {


            string cmdString = "SELECT  FirstName, LastName, UserName, Password, Mail, Phone  FROM UserDetails";

            bool @continue = true;
            if (Request.Form["sub"] != null)
            {
                string field1 = Request.Form["where1"].ToString();
                string field2 = Request.Form["where2"].ToString();
                string field1Value = Request.Form["txt1"].ToString();
                string field2Value = Request.Form["txt2"].ToString();


                if (field1Value != "" && field2Value != "")
                {
                    if (field1 != field2)
                    {
                        filterWhere = " WHERE (" + field1 + " = N'" + field1Value + "')";
                        filterWhere += " AND (" + field2 + " = N'" + field2Value + "')";
                    }
                    else
                    {
                        userTable += "<tr><td td colspan= '6' style='color:red ; font-weight:bold; text-align:center'>על שני החתכים להיות שונים</td></tr>";
                        @continue = false;
                    }
                }

                else if (field1Value != "" && field2Value == "")
                {
                    filterWhere = " WHERE (" + field1 + " = N'" + field1Value + "')";
                }
                else if (field1Value == "" && field2Value != "")
                {
                    filterWhere = " WHERE (" + field2 + " = N'" + field2Value + "')";
                }
                if (filterWhere != "")
                {
                    cmdString += filterWhere;
                }

            }

            if (@continue)
            {
                DBAccesor dbAccessor = ServiceLocator.Instance.GetService<DBAccesor>();
                DataTable dataTable = dbAccessor.runSelectCmd(cmdString);
                if (dataTable.Rows.Count == 0)
                {
                    userTable += "<tr><td colspan= '6' style='color:red ; font-weight:bold; text-align:center'>אין התאמות</td></tr>";
                }
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    userTable += "<tr><td>" + dataTable.Rows[i]["FirstName"] + "</td>" + "<td>"
                        + dataTable.Rows[i]["LastName"] + "</td>" + "<td>" + dataTable.Rows[i]["UserName"]
                        + "</td>" + "<td>" + dataTable.Rows[i]["password"] + "</td>" + "<td>"
                        + dataTable.Rows[i]["Mail"] + "</td>" + "<td>" + dataTable.Rows[i]["Phone"]
                        + "</td><td>" + "<input type=\"checkbox\" name =\"chk" + i + "\" id =\"chk" + i + "\""
                        + "/> " + "</td><td>" + $"<input onClick='checkUpdate({i})' type=\"checkbox\" name =\"" + i + "\" id =\"" + i + "\"" + "/> " + "</td> </tr>";
                }
            }

        }


    }
}