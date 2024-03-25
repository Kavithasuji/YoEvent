using Eventedmxentites;
using System;

public class CreateRoomDAL
{
    public string Save(C_Room Room)
    {
        string message = string.Empty;

        try
        {
            using (EventManagementEntities context = new EventManagementEntities())
            {

                context.C_Room.Add(Room);
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
