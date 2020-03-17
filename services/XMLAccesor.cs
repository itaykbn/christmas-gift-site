using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace regestrationV2.services
{
    public class XMLAccesor : IAcessService
    {
        public void read()
        {

            throw new NotImplementedException();
        }

       /* private bool IsAdmin(string user)
        {
            XMLAccesor xmlAccessor = ServiceLocator.Instance.GetService<XMLAccesor>();
            DataSet ds = new DataSet();
            ds.ReadXml(System.Web.HttpContext.Current.Server.MapPath("AdminList.xml"));
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (user.Equals(r[0]))
                {
                    return true;
                }
            }

            return false;
        }*/
    }
}