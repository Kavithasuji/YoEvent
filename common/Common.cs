using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Eventedmxentites;

namespace Event_management.common
{

    public class Common
    {
        public static EventManagementEntities unifiedEntity = new EventManagementEntities();

        public static DateTime GetServerDate()
        {
            try
            {
                using (EventManagementEntities unifiedEntity = new EventManagementEntities())
                {
                    DateTime ServerDate = unifiedEntity.Database.SqlQuery<DateTime>("SELECT GetDate() ServerDate").ToList<DateTime>()[0];
                    return ServerDate;
                }
            }
            catch (Exception ex)
            {
                throw ex;


            }

        }


    }
}