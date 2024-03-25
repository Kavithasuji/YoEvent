using Event_management.DAL;
using Event_management.UI.Module.dashboard;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Event_management.Business.Modules
{
    public class ScheduleBAL
    {
        public string S_Ename { get; set; }
        public string S_Description { get; set; }
        public DateTime S_Sdate { get; set; }
        public DateTime S_Stime { get; set; }
        public DateTime S_Edate { get; set; }
        public DateTime S_ETime { get; set; }
        public string S_Venue { get; set; }
        public string S_Room { get; set; }
        public string S_Sponcer { get; set; }
        public string S_Organizer { get; set; }

        internal void SelectSchedule(int eId)
        {
            ScheduleDAL selDAL = new ScheduleDAL();
            selDAL.GetEventDetails(eId, out string S_ename, out string S_description, out DateTime S_sdate, out DateTime S_edate, out DateTime S_stime, out DateTime S_etime, out string S_venue);

            S_Ename = S_ename;
            S_Description = S_description;
            S_Sdate = S_sdate;
            S_Edate = S_edate;
            S_Stime = S_stime;
            S_ETime = S_etime;
            S_Venue = S_venue;
        }

        internal void SelectScheduledEvent(int eId)
        {
            ScheduleDAL selDAL = new ScheduleDAL();
            selDAL.GetScheduledEventDetails(eId, out string S_ename, out string S_description, out DateTime S_sdate, out DateTime S_edate, out DateTime S_stime, out DateTime S_etime, out string S_venue,out string s_room,out string s_sponcer,out string s_organizer);

            S_Ename = S_ename;
            S_Description = S_description;
            S_Sdate = S_sdate;
            S_Edate = S_edate;
            S_Stime = S_stime;
            S_ETime = S_etime;
            S_Venue = S_venue;
            S_Room = s_room;
            S_Sponcer = s_sponcer;
            S_Organizer = s_organizer;
        }

        
    }
}


public class ScheduleUpdate
{
    public static void UpdateSchedule(int eId, string s_Sname, string s_Sdescription, DateTime s_Ssdate, DateTime s_Sedate, DateTime s_Sstime, DateTime s_Setime, string s_Svenue, string s_room, string s_sponcer, string s_organizer)
    {
        UpdateScheduleEvent selDAL = new UpdateScheduleEvent();
        selDAL.UpdateSchedule(eId, s_Sname, s_Sdescription, s_Ssdate, s_Sedate, s_Sstime, s_Setime, s_Svenue, s_room, s_sponcer, s_organizer);
    }
}


public partial class sch_event
    {
          public int S_Id { get; set; }
             public string S_Event { get; set; }
            public string S_Description { get; set; }
            public System.DateTime S_Sdate { get; set; }
            public System.DateTime S_Edate { get; set; }
            public System.TimeSpan S_Stime { get; set; }
            public System.TimeSpan S_Etime { get; set; }
            public string S_Venue { get; set; }
            public string S_Room { get; set; }
            public string S_Sponsor { get; set; }
            public string S_Organizer { get; set; }
        }
    
