using System;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Security.Policy;

namespace Event_management.DAL
{
    public class CreateOrganizerDAL
    {
        internal void selectvalues(int eId, out  string firstName, out string lastName,out string organizerType, out string email,out long phone,out string orgImg)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;
            firstName = lastName = organizerType = email = orgImg= string.Empty;
            phone = 0;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                string str = "SELECT * FROM organizer WHERE F_Id = @F_Id";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@F_Id", eId);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    firstName = reader["First_Name"].ToString();
                    lastName = reader["Last_Name"].ToString();
                    organizerType = reader["Organizer_Type"].ToString();
                    email = reader["Email"].ToString();
                    phone = long.Parse(GetValueFromReader(reader, "Phone"));
                    orgImg = GetValueFromReader(reader, "Org_Image");
                   
                }

                reader.Close();
            }

        }

        internal void updatevalues(int eId, string firstName, string lastName, string organizerType, string email, long phone, byte[] orgImg)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();


                string str = "UPDATE organizer SET First_Name = @fn, Last_Name = @ln, Organizer_Type = @ot, Email = @em, Phone = @ph, Org_Image=@OI WHERE F_Id = @F_Id";
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@F_Id", eId);
                cmd.Parameters.AddWithValue("@fn", firstName);
                cmd.Parameters.AddWithValue("@ln", lastName);
                cmd.Parameters.AddWithValue("@ot", organizerType);
                cmd.Parameters.AddWithValue("@em", email);
                cmd.Parameters.AddWithValue("@ph", phone);
                cmd.Parameters.AddWithValue("@OI", orgImg != null ? (object)SaveUploadedFile(orgImg) : DBNull.Value);



                cmd.ExecuteNonQuery();


            }
        }
        private string SaveUploadedFile(byte[] file) // Changed parameter type to byte[]
        {
            string fileName = Guid.NewGuid().ToString() + ".bin";
            string filePath = HttpContext.Current.Server.MapPath("~/Uploads/") + fileName;

            File.WriteAllBytes(filePath, file);

            return filePath;
        }
        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            object value = reader[columnName];
            return value == DBNull.Value ? string.Empty : value.ToString();
        }
    }
}

