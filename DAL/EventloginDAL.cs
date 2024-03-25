using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Event_management.DAL
{
    public class UserDAL
    {
        public bool ValidateUser(string email, string password, out string personType)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("ValidateUserLogin", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    SqlParameter userCountParam = new SqlParameter("@UserCount", SqlDbType.Int);
                    userCountParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(userCountParam);

                    SqlParameter personTypeParam = new SqlParameter("@Person_type", SqlDbType.VarChar, 200);
                    personTypeParam.Direction = ParameterDirection.Output;
                    command.Parameters.Add(personTypeParam);

                    connection.Open();
                    command.ExecuteNonQuery();

                    int userCount = Convert.ToInt32(userCountParam.Value);

                    if (userCount > 0 && personTypeParam.Value != DBNull.Value)
                    {
                        personType = personTypeParam.Value.ToString();
                    }
                    else
                    {
                        // If user count is 0 or person type is DBNull, set personType to null
                        personType = null;
                    }

                    return userCount > 0;
                }
            }
        }
    }
}
