using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Data;
using System.Linq;
using System.Web;
using Eventedmxentites;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Configuration;

/*BY:B.LOKESH DATE:23-12-2023*/

namespace Event_management.DAL
{
    public class EventRegisterDAL
    {
        internal string Save(User_Mgt objEntity)
        {
            try
            {
                using (EventManagementEntities objRecUnifiedPortalEntities = new EventManagementEntities())
                {
                    var Id = objRecUnifiedPortalEntities.User_Mgt.Where(x => x.User_Id ==objEntity.User_Id  && x.Email == objEntity.Email).Select(x => x.User_Id).FirstOrDefault();
                    if (Id > 0)
                    {
                        if (Id != objEntity.User_Id)
                        {
                            return "Already Exists!";

                        }


                    }
                    if (objEntity.User_Id <= 0)
                    {
                        objRecUnifiedPortalEntities.Entry(objEntity).State = (System.Data.Entity.EntityState)System.Data.EntityState.Added;
                    }
                    else
                    {
                        objRecUnifiedPortalEntities.Entry(objEntity).State = System.Data.Entity.EntityState.Modified;
                    }
                    objRecUnifiedPortalEntities.SaveChanges();

                }
            }
            catch (DbEntityValidationException ex)
            {
                dynamic errorMessages = ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage);
                dynamic fullErrorMessage = string.Join("; ", errorMessages);
                dynamic exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);
            }
            return "S";
        }
        public bool CheckEmailExists(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM User_Mgt WHERE Email = @Email";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email",email);

                try
                {
                    connection.Open();

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        public List<string> GetOrganizationTypes(string prefix)
        {
            List<string> organizationTypes = new List<string>();

            string connectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT User_Type FROM User_Mgt WHERE User_Type LIKE @prefix";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@prefix", prefix + "%");

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        string userType = reader["User_Type"].ToString();
                        organizationTypes.Add(userType);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    // Handle any exceptions here
                    throw ex;
                }
            }

            return organizationTypes;
        }
    }
}

