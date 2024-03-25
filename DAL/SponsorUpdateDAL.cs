using System;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Data;

namespace Event_management.DAL
{
    public class SponsorUpdateDAL
    {
        internal void Select(int eId, out string FirstName, out string LastName, out string Description, out string Website, out long Phone, out string Email, out string logo)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;
            FirstName = LastName = Description = Website = Email = logo = string.Empty;
            Phone = 0;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                string str = "SELECT * FROM sponcer WHERE S_Id = @S_Id";
                using (SqlCommand cmd = new SqlCommand("selectsponcers", con))
                {
                    cmd.CommandType=CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@S_Id", eId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            FirstName = GetValueFromReader(reader, "First_name");
                            LastName = GetValueFromReader(reader, "Last_name");
                            Description = GetValueFromReader(reader, "Description");
                            Website = GetValueFromReader(reader, "Website");
                            Email = GetValueFromReader(reader, "Email");
                            Phone = long.Parse(GetValueFromReader(reader, "Phone"));
                            logo = GetValueFromReader(reader, "Logo");
                        }
                    }
                }
            }



        }

        internal void updatesponsor(int eId, string FirstName, string LastName, string Description, string Website, string Email, long Phone, byte[] logoFile)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                //string str = "UPDATE sponcer SET First_name = @First_name, Last_name = @Last_name, Description = @Description, Website = @Website, Email = @Em, Phone = @Phone, Logo = @Logo WHERE S_Id = @S_Id";

                using (SqlCommand cmd = new SqlCommand("updatesponcer", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@S_Id", eId);
                    cmd.Parameters.AddWithValue("@First_name", FirstName);
                    cmd.Parameters.AddWithValue("@Last_name", LastName);
                    cmd.Parameters.AddWithValue("@Description", Description);
                    cmd.Parameters.AddWithValue("@Website", Website);
                    cmd.Parameters.AddWithValue("@Em", Email);
                    cmd.Parameters.AddWithValue("@Phone", Phone);
                    cmd.Parameters.AddWithValue("@Logo", logoFile != null ? (object)SaveUploadedFile(logoFile) : DBNull.Value);

                    cmd.ExecuteNonQuery();
                }
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
