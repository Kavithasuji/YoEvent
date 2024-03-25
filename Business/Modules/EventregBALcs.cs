//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Event_management.Business.Modules
{
    public class EventregBALcs
    {

    }
    public class Eventregpage
    {
        public int User_Id { get; set; }
        public string User_Type { get; set; }
        public string User_Name { get; set; }
        public long Mobile_Number { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Confirm_Password { get; set; }
        public string Person_type { get; set; }
        public string Createdby { get; set; }
        public Nullable<System.DateTime> Createdon { get; set; }
        public string Updateby { get; set; }
        public Nullable<System.DateTime> Updatedon { get; set; }
        public string Per_status { get; set; }
    }
}