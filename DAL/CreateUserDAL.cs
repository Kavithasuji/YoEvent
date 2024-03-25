using Eventedmxentites;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Event_management.DAL
{
    public class CreateUserDAL
    {
        public string Save(User_Mgt objEntity)
        {
            string message = string.Empty;

            try
            {
                using (EventManagementEntities context = new EventManagementEntities())
                {

                    context.User_Mgt.Add(objEntity);
                    int rowsAffected = context.SaveChanges();
                    if (rowsAffected > 0)
                    {
                        message = "Event registration saved successfully!";
                    }
                    else
                    {
                        message = "Failed to save event registration.";
                    }
                }
            }
            catch (Exception ex)
            {
                message = "Error occurred while saving event registration: " + ex;
            }
            return message;
        }







        internal void SelectValues(int eId, out string UserName, out long Mobile, out string E_mail, out string psd, out string perType, out string perSts)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;
            UserName = E_mail = psd = perType = perSts = string.Empty;
            Mobile = 0;
            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();
                //string str = "select * from User_Mgt where User_id =@User_id";
                using (SqlCommand cmd = new SqlCommand("selectusers", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User_id", eId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            UserName = GetValueFromReader(reader, "user_name");
                            Mobile= long.Parse (GetValueFromReader(reader,"Mobile_Number"));
                            E_mail = GetValueFromReader(reader,"Email");
                            psd = GetValueFromReader(reader, "Password");
                            perType = GetValueFromReader(reader, "Person_Type");
                            perSts = GetValueFromReader(reader, "Per_status");
                        }
                    }

                }

            }

        }

        internal void updatevalues(int eId, string userName, long mobile, string e_mail, string psd, string Cpwd, string perType, string perSts)
        {
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;


            //using (SqlConnection sqlConnection = new SqlConnection(sqlConnectionString))
            //{
            //    sqlConnection.Open();
            //    string srt = "update User_Mgt set " +
            //        "User_Name=@User_Name,Mobile_Number=@Mobile_Number ," +
            //        "Email=@Email,Password=@Password,Person_type=@Person_type," +
            //        "Per_status=@Per_status Where User_Id=@User_Id";
            //    using (SqlCommand cmd = new SqlCommand(srt, sqlConnection))
            //    {
            //        cmd.Parameters.AddWithValue("@User_Id", eId);
            //        cmd.Parameters.AddWithValue("@User_Name", userName);
            //        cmd.Parameters.AddWithValue("@Mobile_Number", mobile);
            //        cmd.Parameters.AddWithValue("@Email", e_mail);
            //        cmd.Parameters.AddWithValue("@Password", psd);
            //        cmd.Parameters.AddWithValue("@Person_type", perType);
            //        cmd.Parameters.AddWithValue("@Per_status", perSts);

            //        cmd.ExecuteNonQuery();
            //    }
            //}

            using (SqlConnection sqlConnection = new SqlConnection(sqlConnectionString))
            {
                sqlConnection.Open();
                using (SqlCommand cmd = new SqlCommand("createusers",sqlConnection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@User_Id", eId);
                    cmd.Parameters.AddWithValue("@User_Name", userName);
                    cmd.Parameters.AddWithValue("@Mobile_Number", mobile);
                    cmd.Parameters.AddWithValue("@Email", e_mail);
                    cmd.Parameters.AddWithValue("@Person_type", perType);
                    cmd.Parameters.AddWithValue("@Password", psd);
                    cmd.Parameters.AddWithValue("@Confirm_Password", Cpwd);
                    cmd.Parameters.AddWithValue("@Per_status", perSts);

                    cmd.ExecuteNonQuery();
                }
            }

        }


        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            object value = reader[columnName];
            return value == DBNull.Value ? string.Empty : value.ToString();
        }
    }
 
}