using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Event_management.DAL;
using Event_management.Business.Modules;
using Eventedmxentites;
using Report1= Eventedmxentites.Report;


namespace Event_management.UI.Module.dashboard
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateSuccessPanel.Visible = false;

        }
        [WebMethod]
        public static string SaveReportMaster(Report1 Course)
        {
            string msg = string.Empty;
            try
            {
                Report1 Rep = new Report1();
                Rep.Event_Name = Course.Event_Name;
                Rep.User_Name = Course.User_Name;
                Rep.R_description = Course.R_description;
                EventReport dal = new EventReport();


                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg=dal.Save(Rep);
                    DataTable dt = new DataTable();
                }
                JavaScriptSerializer json = new JavaScriptSerializer();
                return json.Serialize(msg);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = User_name.Text;
            Head.InnerText = $"Report sent successfully {username} !";

            updateSuccessPanel.Visible=true;
        }

       
    }
}