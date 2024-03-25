using System;
using System.Collections.Generic;
using Event_management.DAL;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace Event_management.Business.Modules
{

    public class ViewBAL
    {
        public string E_Name { get; private set; }
        public string E_description { get; private set; }
        public DateTime E_startDate { get; private set; }
        public DateTime E_endDate { get; private set; }
        public DateTime E_stime { get; private set; }
        public DateTime E_etime { get; private set; }
        public string E_venue { get; private set; }
        public string E_mode { get; private set; }
        public string E_banner_Path { get; private set; }



        internal void SelectView(int eId)
        {
            ViewDAL view = new ViewDAL();
            view.Selectedvalue(eId, out string E_name, out string E_Description, out DateTime E_StartDate, out DateTime E_EndDate, out DateTime E_Stime, out DateTime E_Etime, out string E_Venue,out string E_Mode, out string E_Banner_Path);

            E_Name = E_name;
            E_description = E_Description;
            E_startDate = E_StartDate;
            E_endDate = E_EndDate;
            E_stime = E_Stime;
            E_etime = E_Etime;
            E_venue = E_Venue;
            E_mode = E_Mode;
            E_banner_Path = E_Banner_Path;
        }
        internal void SelectScheduleView(int eId)
        {
            ViewDAL view = new ViewDAL();
            view.SelectedSchedulevalue(eId, out string E_name, out string E_Description, out DateTime E_StartDate, out DateTime E_EndDate, out DateTime E_Stime, out DateTime E_Etime, out string E_Venue, out string E_Mode, out string E_Banner_Path);

            E_Name = E_name;
            E_description = E_Description;
            E_startDate = E_StartDate;
            E_endDate = E_EndDate;
            E_stime = E_Stime;
            E_etime = E_Etime;
            E_venue = E_Venue;
            E_mode = E_Mode;
            E_banner_Path = E_Banner_Path;
        }
    }
}