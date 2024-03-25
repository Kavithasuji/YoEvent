using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Event_management.DAL
{
    public class ViewDAL
    {

        internal void Selectedvalue(int eId, out string E_name, out string E_Description, out DateTime E_startDate, out DateTime E_endDate, out DateTime E_Stime, out DateTime E_Etime, out string E_Venue, out string E_Mode, out string E_Banner_Path)
        {
            E_name = "";
            E_Description = "";
            E_startDate = DateTime.MaxValue; // Assign default value
            E_endDate = DateTime.Now; // Assign default value
            E_Stime = DateTime.MaxValue;
            E_Etime = DateTime.Now;
            E_Venue = "";
            E_Mode = "";
            E_Banner_Path = "";

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    con.Open();
                    string query = "SELECT E_Name, E_Sdate, E_Edate, E_Mode, E_Venue, E_Description, E_Stime, E_Etime, E_BannerImg FROM Event_Reg WHERE E_Id = @E_Id";

                    using (SqlCommand com = new SqlCommand(query, con))
                    {
                        com.Parameters.AddWithValue("@E_Id", eId);

                        using (SqlDataReader reader = com.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                E_name = GetValueFromReader(reader, "E_Name");
                                E_startDate = GetValueFromReader<DateTime>(reader, "E_Sdate");
                                E_endDate = GetValueFromReader<DateTime>(reader, "E_Edate");
                                E_Stime = DateTime.Parse(GetValueFromReader(reader, "E_Stime"));
                                E_Etime = DateTime.Parse(GetValueFromReader(reader, "E_Etime"));

                                E_Mode = GetValueFromReader(reader, "E_Mode");
                                E_Venue = GetValueFromReader(reader, "E_Venue");
                                E_Description = GetValueFromReader(reader, "E_Description");

                                string base64String = GetValueFromReader(reader, "E_BannerImg");

                                if (IsValidBase64String(base64String))
                                {
                                    // Handle image logic if needed
                                }
                                else
                                {
                                    // Log or handle the invalid Base64 string as needed
                                    Console.WriteLine("Error: The Base64 string is not valid.");
                                    // Set a default image path or handle accordingly
                                    E_Banner_Path = "~/images/Default_img.png";
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the exception as needed
                Console.WriteLine($"Error retrieving data from the database: {ex.Message}");
                // You might want to throw the exception or handle it in a way that suits your application
            }
        }





        private bool IsValidBase64String(string input)
        {
            if (string.IsNullOrEmpty(input))
                return false;

            if (input.Length % 4 != 0)
                return false;

            foreach (char c in input)
            {
                if (!((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || (c == '+') || (c == '/') || (c == '=')))
                    return false;
            }

            int paddingCount = 0;
            for (int i = input.Length - 1; i >= 0 && input[i] == '='; i--, paddingCount++) { }

            if (paddingCount > 2)
                return false;

            return true;
        }

        private T GetValueFromReader<T>(SqlDataReader reader, string columnName)
        {
            object value = reader[columnName];

            if (value != DBNull.Value)
            {
                if (typeof(T) == typeof(string))
                {
                    return (T)value;
                }
                else
                {
                    try
                    {
                        return (T)Convert.ChangeType(value, typeof(T));
                    }
                    catch (InvalidCastException ex)
                    {
                        // Handle the invalid cast exception appropriately
                        // You may choose to log the exception or take other actions
                        return default(T);
                    }
                }
            }
            else
            {
                return default(T);
            }
        }


        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            return reader[columnName] != DBNull.Value ? reader[columnName].ToString() : string.Empty;
        }

        public void SelectedSchedulevalue(int eId, out string E_name, out string E_Description, out DateTime E_StartDate, out DateTime E_EndDate, out DateTime E_Stime, out DateTime E_Etime, out string E_Venue, out string E_Mode, out string E_Banner_Path)
        {
            E_name = "";
            E_Description = "";
            E_StartDate = DateTime.MaxValue;
            E_EndDate = DateTime.Now;
            E_Stime = DateTime.Now;
            E_Etime = DateTime.Now;
            E_Venue = "";
            E_Mode = "";
            E_Banner_Path = "";

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            //try
            {
                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    con.Open();
                    string query = "SELECT S_Event, S_Sdate, S_Edate, S_Venue, S_Description, S_Stime, S_Etime FROM Schedule_Event WHERE S_Id = @S_Id";

                    using (SqlCommand com = new SqlCommand(query, con))
                    {
                        com.Parameters.AddWithValue("@S_Id", eId);

                        using (SqlDataReader reader = com.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                E_name = GetValueFromReader(reader, "S_Event");
                                E_StartDate = GetValueFromReader<DateTime>(reader, "S_Sdate");
                                E_EndDate = GetValueFromReader<DateTime>(reader, "S_Edate");
                                E_Stime = DateTime.Parse(GetValueFromReader(reader, "S_Stime"));
                                E_Etime = DateTime.Parse(GetValueFromReader(reader, "S_Etime"));

                                E_Venue = GetValueFromReader(reader, "S_Venue");
                                E_Description = GetValueFromReader(reader, "S_Description");

                            }
                        }
                    }
                    //            // Fetching E_BannerImg
                    //            query = "SELECT E_BannerImg FROM Event_Reg WHERE E_Id = @E_Id";

                    //            using (SqlCommand com = new SqlCommand(query, con))
                    //            {
                    //                com.Parameters.AddWithValue("@E_Id", eId);

                    //                object result = com.ExecuteScalar();
                    //                if (result != DBNull.Value && result != null)
                    //                {
                    //                    string base64String = result.ToString();
                    //                    if (IsValidBase64String(base64String))
                    //                    {
                    //                        // Handle image logic if needed
                    //                        E_Banner_Path = ""; // Path to the image
                    //                    }
                    //                    else
                    //                    {
                    //                        // Set a default image path or handle accordingly
                    //                        E_Banner_Path = "~/images/Default_img.png";
                    //                    }
                    //                }
                    //                else
                    //                {
                    //                    // Set a default image path if no image found
                    //                    E_Banner_Path = "~/images/Default_img.png";
                    //                }
                    //            }
                    //        }
                    //    }
                    //    catch (Exception ex)
                    //    {
                    //        // Log or handle the exception as needed
                    //        Console.WriteLine($"Error retrieving data from the database: {ex.Message}");
                    //        // You might want to throw the exception or handle it in a way that suits your application
                    //    }
                    //}

                    //private bool IsValidBase64String(string base64String)
                    //{
                    //    try
                    //    {
                    //        Convert.FromBase64String(base64String);
                    //        return true;
                    //    }
                    //    catch
                    //    {
                    //        return false;
                    //    }
                    //}
                }
            }
        }
    }
}
            




