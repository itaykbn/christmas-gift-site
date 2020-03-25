using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace regestrationV2.services
{
    public class XMLAccesor : IAcessService
    {
        public void read()
        {
            

            throw new NotImplementedException();
        }
        public bool isExsists(string user,string path)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(path);
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (user.Equals(r[0]))
                {
                    return true;
                }
            }
            return false;
        }


        public string[] returnTable(string user, string path)
        {
            string table = "";
            DataSet ds = new DataSet();
            string fullName = "";
            string[] output = new string[2];
            ds.ReadXml(path);

            foreach (DataRow rw in ds.Tables[0].Rows)
            {
                if ((string)rw["UserName"] == user) { 
                    table +=  ("<table><tr><td> Username: " + rw["UserName"] + "</td></tr><tr><td> Password: " + rw["Password"] + "</td></tr><tr><td> Email: " + rw["Email"] + "</td></tr><tr><td> Phone: "  + rw["Phone"] + "</td>");
                    table += "</tr>";
                    fullName += rw["FirstName"] + " " + rw["LastName"];
                }
                
            }
            table += "</table>";
            output[0] = table;
            output[1] = fullName;
            return output;
          
            
            
        }

    }
}