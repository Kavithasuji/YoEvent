using Event_management.Business.Modules;
using Event_management.UI.Module.dashboard;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Services.Description;
using Org_anizer = Eventedmxentites.organizer;


namespace Event_management.DAL
{
    public class org_DAL
    {
        public string save(Org_anizer org)
        {
            string msg = string.Empty;
            try
            {
                using (EventManagementEntities context = new EventManagementEntities())
                {

                    context.organizers.Add(org);
                    int rowsAffected = context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        msg = " successfully!";
                    }
                    else
                    {
                        msg = "Failed ";
                    }
                }
            }
            //try
            //{
            //    using (EventManagementEntities context = new EventManagementEntities())
            //    {
            //        context. .Add(organizer);
            //    }
            //    int rowsAffected = context.SaveChanges();

            //    if (rowsAffected > 0)
            //    {
            //        msg = "registrated successfully!";
            //    }
            //    else
            //    {
            //        msg = " Sregistration  Failed.";
            //    }


            //}
            catch (Exception ex)
            {
                msg =" error occured" +ex.Message;
            }
            return msg;
        }
    }
}