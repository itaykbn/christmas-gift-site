using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace regestrationV2.services
{
    public class DBAccesor : IAcessService
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\dev\HTML\christmas-gift-site\App_Data\User_Data.mdf;Integrated Security=True";

        public void read()
        {
            throw new NotImplementedException();
        }

        public int runSqlCommand(String cmdStr)
        {
            using (SqlConnection conObj = new SqlConnection(connectionString))
            {
                SqlCommand cmdObj = new SqlCommand(cmdStr, conObj);
                conObj.Open();
                int rowNum = cmdObj.ExecuteNonQuery();
                return rowNum;
            }
        }

        public DataTable runSelectCmd(String selectCmd)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {

                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(selectCmd, connectionString);
                DataSet ds = new DataSet();
                da.Fill(ds);

                return ds.Tables[0];
            }
        }

        public bool isExist(String checkCmd)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(checkCmd, conn);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                return dr.HasRows;
            }

        }

        public bool updateTable(String selectTable, DataTable updatedDataTable)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(selectTable, connectionString))
                {
                    using (SqlCommandBuilder cmdBuilder = new SqlCommandBuilder(adapter))
                    {
                        adapter.UpdateCommand = cmdBuilder.GetUpdateCommand();
                        adapter.Update(updatedDataTable);
                    }

                }
            }
            return true;
        }
    }
}