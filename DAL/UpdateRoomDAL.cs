using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

namespace Event_management.DAL
{
    public class UpdateRoomDAL
    {
        internal void Selct(int roomId, out string E_Name, out string E_Description, out string E_Venue, out string E_Location, out string E_Type, out string E_Equipment, out int E_Seat, out string E_Image)
        {
            E_Name = E_Description = E_Venue = E_Location = E_Type = E_Equipment = E_Image = string.Empty;
            E_Seat = 0;
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectRoom", con);
                cmd.CommandType= CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Room_Id", roomId);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    E_Name = GetValueFromReader(reader, "Name");
                    E_Description = GetValueFromReader(reader, "Description");
                    E_Venue = GetValueFromReader(reader, "Event_Venue");
                    E_Location = GetValueFromReader(reader, "Location_Link");
                    E_Type = GetValueFromReader(reader, "Event_Type");
                    E_Equipment = GetValueFromReader(reader, "Equipment");
                    E_Seat = int.Parse(GetValueFromReader(reader, "Seat"));
                    E_Image = GetValueFromReader(reader, "Room_Img");
                }

                reader.Close();
            }
        }

        internal void Update(int roomId, string E_Name, string E_Description, string E_venue, string E_Location, string E_Type, string E_Equipment, int E_Seat, byte[] E_RoomImage)
        {
            
            {
                string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    con.Open();

                    //string str = "update C_Room set Name=@Name, Description=@Description, Event_Venue=@Venue, Location_Link=@Location, Event_Type=@Type, Equipment=@Equipment, Seat=@Seat, Room_Img=@Room_Img Where Room_ID=@Room_ID";
                    SqlCommand cmd = new SqlCommand("updateroom", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Room_ID", roomId);
                    cmd.Parameters.AddWithValue("@Name", E_Name);
                    cmd.Parameters.AddWithValue("@Description", E_Description);
                    cmd.Parameters.AddWithValue("@Venue", E_venue);
                    cmd.Parameters.AddWithValue("@Location", E_Location);
                    cmd.Parameters.AddWithValue("@Type", E_Type);
                    cmd.Parameters.AddWithValue("@Equipment", E_Equipment);
                    cmd.Parameters.AddWithValue("@Seat", Convert.ToInt32(E_Seat));
                    cmd.Parameters.AddWithValue("@Room_Img", E_RoomImage != null ? (object)SaveUploadedFile(E_RoomImage): DBNull.Value ); 

                    cmd.ExecuteNonQuery();
                }
            }
       
        }

        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            int columnIndex = reader.GetOrdinal(columnName);
            return reader.IsDBNull(columnIndex) ? string.Empty : reader[columnIndex].ToString();
        }
        private string SaveUploadedFile(byte[] file)
        {

            string fileName = Guid.NewGuid().ToString() + ".JPEG";
            string filePath = HttpContext.Current.Server.MapPath("~/Uploads/") + fileName;

            File.WriteAllBytes(filePath, file);

            return filePath;
        }
    }
}