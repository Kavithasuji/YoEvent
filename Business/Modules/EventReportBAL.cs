using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Event_management.DAL
{
    public partial class Report
    {
        public int Report_Id { get; set; }
        public string Event_Name { get; set; }
        public string User_Name { get; set; }
        public string R_description { get; set; }
        public Nullable<System.DateTime> date_column { get; set; }
    }
}