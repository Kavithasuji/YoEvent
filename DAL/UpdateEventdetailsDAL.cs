//CREATED BY = B.LOKESH
//DATE = 12-02-2024
//FOR = SELECT AND UPDATE
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;

namespace Event_management.DAL
{
    public class UpdateEventdetailsDAL
    {
        internal void select(int eId, out string E_name, out string E_Description, out DateTime E_startDate, out DateTime E_endDate, out DateTime E_Stime, out DateTime E_Etime, out string E_Venue, out string E_Location, out string E_Type, out string E_Mode, out int E_Seat, out string E_Register, out string E_Banner_Path, out string E_Icon_Path, out string E_Floor_Path)
        {
            E_name = "";
            E_Description = "";
            E_startDate = DateTime.MaxValue; // Assign default value
            E_endDate = DateTime.Now; // Assign default value
            E_Stime = DateTime.MaxValue;
            E_Etime = DateTime.Now;
            E_Venue = "";
            E_Location = "";
            E_Type = "";
            E_Mode = "";
            E_Seat = 0; // Assign default value
            E_Register = "";
            E_Banner_Path = "";
            E_Icon_Path = "";
            E_Floor_Path = "";

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                //string str = "SELECT * FROM Event_Reg WHERE E_Id = @E_Id";
                SqlCommand cmd = new SqlCommand("selecteventt", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@E_Id", eId);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    E_name = GetValueFromReader(reader, "E_Name");
                    E_Description = GetValueFromReader(reader, "E_Description");
                    string startDateString = GetValueFromReader(reader, "E_SDate");
                    string endDateString = GetValueFromReader(reader, "E_EDate");
                    string StartTime = GetValueFromReader(reader, "E_Stime");
                    string Endtime = GetValueFromReader(reader, "E_Etime");


                    // Convert date strings to DateTime
                    DateTime startDate, endDate, Starttime, endtime;
                    if (DateTime.TryParse(startDateString, out startDate) && DateTime.TryParse(endDateString, out endDate) && DateTime.TryParse(StartTime, out Starttime) && DateTime.TryParse(Endtime, out endtime))
                    {
                        // Assign dates to properties
                        E_startDate = startDate;
                        E_endDate = endDate;
                        E_Stime = Starttime;
                        E_Etime = endtime;

                    }
                    E_Venue = GetValueFromReader(reader, "E_Venue");
                    E_Location = GetValueFromReader(reader, "E_LocationLink");
                    E_Type = GetValueFromReader(reader, "E_Type");
                    E_Mode = GetValueFromReader(reader, "E_Mode");
                    E_Seat = int.Parse(GetValueFromReader(reader, "E_Seat"));
                    E_Register = GetValueFromReader(reader, "E_RegisterLink");
                    E_Banner_Path = GetValueFromReader(reader, "E_BannerImg");
                    E_Icon_Path = GetValueFromReader(reader, "E_Icon");
                    E_Floor_Path = GetValueFromReader(reader, "E_FloorMap");
                }

                else
                {
                    E_name = E_Description = E_Venue = E_Location = E_Type = E_Mode = E_Register = E_Banner_Path = E_Icon_Path = E_Floor_Path = null;
                    E_Seat = 0;
                }
                reader.Close();
            }

        }

        internal void updatevalues(int eId, string E_name, string E_Description, DateTime E_startDate, DateTime E_endDate, DateTime E_Starttime, DateTime E_Endtime ,string E_Venue, string E_Location, string E_Type, string E_Mode, int E_Seat, string E_Register, byte[] E_Banner, byte[] E_Icon, byte[] E_Floor)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();


                using (SqlCommand cmd = new SqlCommand("updateevent",con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@E_Id", eId);
                    cmd.Parameters.AddWithValue("@E_Name", E_name);
                    cmd.Parameters.AddWithValue("@E_Description", E_Description);

                    {
                        cmd.Parameters.AddWithValue("@E_Sdate", E_startDate);
                        cmd.Parameters.AddWithValue("@E_Edate", E_endDate);
                        cmd.Parameters.AddWithValue("@E_Stime", E_Starttime);
                        cmd.Parameters.AddWithValue("@E_Etime",E_Endtime);
                    }
                    cmd.Parameters.AddWithValue("@E_Venue", E_Venue);
                    cmd.Parameters.AddWithValue("@E_LocationLink", E_Location);

                    cmd.Parameters.AddWithValue("@E_Type", E_Type);
                    cmd.Parameters.AddWithValue("@E_Mode", E_Mode);

                    cmd.Parameters.AddWithValue("@E_Seat", E_Seat);
                    cmd.Parameters.AddWithValue("@E_RegisterLink", E_Register);

                    cmd.Parameters.AddWithValue("@E_BannerImg", E_Banner != null ? (object)SaveUploadedFile(E_Banner) : DBNull.Value);
                    cmd.Parameters.AddWithValue("@E_Icon", E_Icon != null ? (object)SaveUploadedFile(E_Icon) : DBNull.Value);
                    cmd.Parameters.AddWithValue("@E_FloorMap", E_Floor != null ? (object)SaveUploadedFile(E_Floor) : DBNull.Value);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private string SaveUploadedFile(byte[] file)
        {

            string fileName = Guid.NewGuid().ToString() + ".JPEG";
            string filePath = HttpContext.Current.Server.MapPath("~/Uploads/") + fileName;

            File.WriteAllBytes(filePath, file);

            return filePath;
        }

        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            return reader[columnName] != DBNull.Value ? reader[columnName].ToString() : string.Empty;
        }

        private string FormatDateTime(string dateTimeString)
        {
            DateTime dateTime;
            if (DateTime.TryParse(dateTimeString, out dateTime))
            {
                return dateTime.ToString("dd/MM/yyyy");
            }
            return "";
        }
    }
}
