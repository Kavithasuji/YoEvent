//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT 

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Event_management.Business.Modules
{
  
    public  class EventRegistration
    {
        public int E_Id { get; set; }
        public string E_Name { get; set; }
        public string E_Description { get; set; }
        public Nullable<System.DateTime> E_Sdate { get; set; }
        public Nullable<System.DateTime> E_Edate { get; set; }
        public string E_Venue { get; set; }
        public string E_LocationLink { get; set; }
        public string E_Type { get; set; }
        public string E_Mode { get; set; }
        public int E_Seat { get; set; }
        public string E_RegisterLink { get; set; }
        public string E_BannerImg { get; set; }
        public string E_Icon { get; set; }
        public string E_FloorMap { get; set; }
        public System.TimeSpan E_Stime { get; set; }
        public System.TimeSpan E_Etime { get; set; }

        internal DataTable Eventbindrequest()
        {
            CEventRegisterDAL obj = new CEventRegisterDAL();

             try
                {
                    return obj.bindeventlist();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            
        }
    }
}