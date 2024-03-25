using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Xml.Linq;
using Event_management.DAL;

namespace Event_management.Business.Modules
{
    public class UpdateRoomBAL
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Venue { get; set; }
        public string Location { get; set; }
        public string Type { get; set; }
        public string Equipment { get; set; }
        public int Seat {  get; set; }
        public string Image { get; set; }

        internal void select(int roomId)
        {
            UpdateRoomDAL selectDAL=new UpdateRoomDAL();
            selectDAL.Selct(roomId, out string E_Name, out string E_Description, out string E_Venue, out string E_Location, out string E_Type, out string E_Equipment, out int E_Seat, out string E_Image);
            Name = E_Name;
            Description = E_Description;
            Venue = E_Venue;
            Location = E_Location;
            Type = E_Type;
            Equipment = E_Equipment;
            Seat = E_Seat;
            Image = E_Image;
        }

        internal void Update(int roomId, string E_Name, string E_Description, string E_venue, string E_Location, string E_Type,string E_Equipment, int E_Seat, byte[] E_RoomImage)
        {
            UpdateRoomDAL updateDAL = new UpdateRoomDAL();
            updateDAL.Update(roomId, E_Name, E_Description, E_venue, E_Location, E_Type, E_Equipment, E_Seat, E_RoomImage);

        }
    }
}