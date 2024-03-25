using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Xml.Linq;
namespace Event_management.DAL
{
    public class CalendarDAL
    {
        public DataTable Save(DateTime da)
        {
          
   
                string message = string.Empty;

            try
            {
                string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;
                DataSet ds = new DataSet();
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    con.Open();

                    string str = "select S_Event,S_Stime,S_Etime,S_Id from Schedule_Event where S_Sdate = @EventDate;";
                    SqlCommand cmd = new SqlCommand(str, con);
                    cmd.Parameters.AddWithValue("@EventDate", da);
                    cmd.CommandTimeout = 240;
                    SqlDataAdapter objadp = new SqlDataAdapter(cmd);
                    objadp.Fill(ds);
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            if (row["S_Stime"] != DBNull.Value && DateTime.TryParse(row["S_Stime"].ToString(), out DateTime startTime))
                            {
                                row["S_Stime"] = startTime.ToString("HH:mm");
                            }

                            if (row["S_Etime"] != DBNull.Value && DateTime.TryParse(row["S_Etime"].ToString(), out DateTime endTime))
                            {
                                row["S_Etime"] = endTime.ToString("HH:mm");
                            }
                        }
                        return ds.Tables[0];
                    }
                    else
                    {
                       
                        return null;
                    }
                }
            }


            catch (Exception ex)
            {
                message = "Error occurred while retrieving event names: " + ex.Message;
            }
            return null;

        }
    }
}

