using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.Linq;



namespace regestrationV2.services
{
    public class XMLAccesor : IAcessService
    {
        public void read()
        {


            throw new NotImplementedException();
        }
        public bool isExsists(string user, string path)
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
                if ((string)rw["UserName"] == user)
                {
                    table += ("<table  style='border:none'><tr><td> Username: " + rw["UserName"] + "</td></tr><tr><td> Password: " + rw["Password"] + "</td></tr><tr><td> Email: " + rw["Email"] + "</td></tr><tr><td> Phone: " + rw["Phone"] + "</td>");
                    table += "</tr>";
                    fullName += rw["FirstName"] + " " + rw["LastName"];
                }
            }
            table += "</table>";
            output[0] = table;
            output[1] = fullName;
            return output;
        }
        public string[] returnValues(string path, string user)
        {
            DataSet ds = new DataSet();
            string[] output = new string[6];
            ds.ReadXml(path);

            foreach (DataRow rw in ds.Tables[0].Rows)
            {
                if ((string)rw["UserName"] == user)
                {
                    output[0] = (string)rw["UserName"];
                    output[1] = (string)rw["Password"];
                    output[2] = (string)rw["Email"];
                    output[3] = (string)rw["Phone"];
                    output[4] = (string)rw["FirstName"];
                    output[5] = (string)rw["LastName"];
                    
                }
            }
            return output;
        }

        public void update(string path, string[] updateValues, string[] orderOfElements)
        {
            var doc = XDocument.Load(path);
            var node = doc.Descendants("CD").FirstOrDefault(cd => cd.Element(orderOfElements[0]).Value == updateValues[0]);
            for (int i = 1; i < updateValues.Length; i++)
            {
                node.SetElementValue(orderOfElements[i], updateValues[i]);
            }
            doc.Save(path);
        }
    }
}