using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using regestrationV2.services;

namespace regestrationV2
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = (string)Session["UserName"];
            if (Request.Form["menu"] != null)

            { 
                DBAccesor dB = ServiceLocator.Instance.GetService<DBAccesor>();
                if(user != null)
                {
                    string cmdStr = string.Format("SELECT * FROM TetrisHighScore WHERE [UserName]=N'{0}'", user);
                    int score = int.Parse(Request.Form["scoreDB"]);
                    if (dB.isExist(cmdStr))
                    {
                        var table = dB.runSelectCmd(cmdStr);
                        int highScore = (int)table.Rows[0]["Score"];
                        if(score > highScore)
                        {
                            table.Rows[0]["Score"] = score;
                            dB.updateTable(cmdStr,table);
                        }
                        
                    }
                    else
                    {
                        
                        string cmdStr1 = string.Format($"INSERT INTO TetrisHighScore(UserName, Score) VALUES (N'{user}',{score})");
                        dB.runSqlCommand(cmdStr1);
                    }
                }
                Response.Redirect("tetrisGameOver.aspx");
            }
            

        }
    }
}