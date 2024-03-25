using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Event_management.Business.Modules
{
    public class createorg
    {
        public int F_Id { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public string Organizer_Type { get; set; }
        public string Email { get; set; }
        public Nullable<long> Phone { get; set; }
        public string Org_Image { get; set; }
    }
}