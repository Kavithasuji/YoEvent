//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT 

using Event_management.Business.Shared.Class_Object;
using Eventedmxentites; 
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using System.Linq;

public class CEventRegisterDAL
{
    public string Save(Event_Reg eventReg)
    {
        string message = string.Empty;

        try
        {
            using (EventManagementEntities context = new EventManagementEntities())
            {
                
                context.Event_Reg.Add(eventReg); 
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

    internal DataTable bindeventlist()
    {
        using (EventManagementEntities rec = new EventManagementEntities())
        {
            var PdId = (from rs in rec.Event_Reg
                        select new { rs.E_Name,rs.E_Description,rs.E_Sdate,rs.E_Edate,rs.E_Venue,rs.E_LocationLink }).Distinct();
            DataTable dtPeriod = DBCommunicator.ListToDataTable(PdId.ToList());
            return dtPeriod;
        }
    }
}
