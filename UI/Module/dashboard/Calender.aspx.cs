using System;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Event_management.Business.Modules;
using Event_management.DAL;
using System.Data;
using Eventedmxentites;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Event_management.UI.Module.dashboard
{
    public partial class Calender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("C_Event.aspx");
        }

        [WebMethod]
        public static string SaveEventDate(String EventDate,String EventMonth,String EventYear)
        {
            string msg = string.Empty;
            try
            {
                DataTable dds=new DataTable();
                string eventmon = "";
                int evenmonthcheck = EventMonth.Length;
                if (evenmonthcheck == 1)
                {
                    eventmon = "0" + (Convert.ToInt32(EventMonth) + 1).ToString();
                }
                else
                {
                    eventmon = (Convert.ToInt32(EventMonth) + 1).ToString();
                }
                String datevalue = EventYear + "-" + eventmon + "-" + EventDate;
                DateTime da = Convert.ToDateTime(datevalue);
                
                CalendarDAL DMY = new CalendarDAL();
                if (EventDate != null)
                {
                   // DataSet ds = new DataSet();
                     dds = DMY.Save(da);

                    //DataTable dt = new DataTable();
                }
                JavaScriptSerializer json = new JavaScriptSerializer();
                return JsonConvert.SerializeObject(dds, new IsoDateTimeConverter { DateTimeFormat = "dd-MM-yyyy" });
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}