using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Event_management.BAL
{
  
    public partial class CreateRoomBAL
    {
        public int Room_ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Event_Venue { get; set; }
        public string Location_Link { get; set; }
        public string Event_type { get; set; }
        public string Equipment { get; set; }
        public Nullable<int> Seat { get; set; }
        public string Room_Img { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
    }
}