using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected string userDetailsTable = "";
        public string userStr;
        protected string fullName = "";
        private XMLAccesor xmlAccessor = ServiceLocator.Instance.GetService<XMLAccesor>();
        protected void Page_Load(object sender, EventArgs e)
        {


                string path = MapPath("AdminList.xml");
                string[] output = xmlAccessor.returnTable((string)Session["UserName"], path);
                userDetailsTable = output[0];
                fullName = output[1];

            
        }
    }
}