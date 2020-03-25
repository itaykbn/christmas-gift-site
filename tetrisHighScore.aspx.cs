using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        protected string highScores = "<tr><th>Player</th><th>Score</th></tr>";
        protected void Page_Load(object sender, EventArgs e)
        {
            DBAccesor dB = ServiceLocator.Instance.GetService<DBAccesor>();

            string cmdStr = string.Format("Select * From TetrisHighScore ORDER BY Score");
            var table = dB.runSelectCmd(cmdStr);
            for (int i = 0; i < table.Rows.Count; i++)
            {
                if (i < 10)
                {
                    highScores += "<tr><td>" + table.Rows[i]["UserName"] + "</td>" + "<td>"
                    + table.Rows[i]["Score"] + "</td></tr>";
                }
            }

        }
    }
}
