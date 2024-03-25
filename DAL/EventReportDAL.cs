//CREATED BY : B.LOKESH
//ON:17-01-2024
//FOR: REPORT EVENT 
using Eventedmxentites;
using System;

public class EventReport
{
    public string Save(Report eventRep)
    {
        string message = string.Empty;

        try
        {
            using (EventManagementEntities context = new EventManagementEntities())
            {

                context.Reports.Add(eventRep);
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
            message = "Error occurred while saving event registration: " + ex.Message;
        }

        return message;
    }
}




