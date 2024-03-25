//CREATED BY = B.LOKESH
//DATE = 12-02-2024
//FOR = SELECT AND UPDATE
using Event_management.DAL;
using System;

namespace Event_management.Business.Modules
{
    public class UpdateEvent
    {
        public string E_Name { get; private set; }
        public string E_description { get; private set; }
        public DateTime E_startDate { get; private set; }
        public DateTime E_endDate { get; private set; }
        public DateTime E_stime { get; private set; }
        public DateTime E_etime { get; private set; }
        public string E_venue { get; private set; }
        public string E_location { get; private set; }
        public string E_type { get; private set; }
        public string E_mode { get; private set; }
        public int E_seat { get; private set; }
        public string E_register { get; private set; }
        public string E_banner_Path { get; private set; }
        public string E_icon_Path { get; private set; }
        public string E_floor_Path { get; private set; }

        internal void select(int eId)
        {
            UpdateEventdetailsDAL sel = new UpdateEventdetailsDAL();
            sel.select(eId, out string E_name, out string E_Description, out DateTime E_StartDate, out DateTime E_EndDate, out DateTime E_Stime , out DateTime E_Etime , out string E_Venue, out string E_Location, out string E_Type, out string E_Mode, out int E_Seat, out string E_Register, out string E_Banner_Path, out string E_Icon_Path, out string E_Floor_Path);

            // Initialize properties    
            E_Name = E_name;
            E_description = E_Description;
            E_startDate = E_StartDate;
            E_endDate = E_EndDate;
            E_stime = E_Stime;
            E_etime = E_Etime;
            E_venue = E_Venue;
            E_location = E_Location;
            E_type = E_Type;
            E_mode = E_Mode;
            E_seat = E_Seat;
            E_register = E_Register;
            E_banner_Path = E_Banner_Path;
            E_icon_Path = E_Icon_Path;
            E_floor_Path = E_Floor_Path;
        }

        internal void updatevalues(int eId, string E_name, string E_Description, DateTime E_startDate, DateTime E_endDate, DateTime E_Starttime, DateTime E_Endtime, string E_Venue, string E_Location, string E_Type, string E_Mode, int E_Seat, string E_Register, byte[] E_Banner, byte[] E_Icon, byte[] E_Floor)
        {
            UpdateEventdetailsDAL dd = new UpdateEventdetailsDAL();
            dd.updatevalues(eId, E_name, E_Description, E_startDate, E_endDate, E_Starttime, E_Endtime, E_Venue, E_Location, E_Type, E_Mode, E_Seat, E_Register, E_Banner, E_Icon, E_Floor);
        }
    }
}
