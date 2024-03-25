using Eventedmxentites;
using System;
using System.Threading.Tasks;


namespace Event_management.DAL
{
    public class SponcerRegisterDAL
    {
        public string Save(sponcer Sponcers)
        {
            string message = string.Empty;

            try
            {
                using (EventManagementEntities context = new EventManagementEntities())
                {

                    context.sponcers.Add(Sponcers);
                    int rowsAffected = context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        message = "Sponcer registrated successfully!";
                    }
                    else
                    {
                        message = " Sponcer registration  Failed.";
                    }
                }
            }
            catch (Exception ex)
            {
                message = "Error occurred while saving event registration: " + ex.Message;
            }

            return message;
        }
    }
}
