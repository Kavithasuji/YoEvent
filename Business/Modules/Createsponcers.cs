using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Eventedmxentites;

namespace Event_management.Business.Modules
{
    public class Createsponcers
    {
        public string First_name { get; set; }
        public string Last_name { get; set; }
        public string Description{ get; set; }
        public string Website { get; set; }
        public string Email { get; set; }
        public long Phone { get; set; }
        public string Logo { get; set; }
       
    }
}