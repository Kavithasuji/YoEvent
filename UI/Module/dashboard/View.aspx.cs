using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using Event_management.Business.Modules;
using System.Security.Cryptography;

namespace Event_management.UI.Module.dashboard
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["E_Id"] != null)
                {
                    int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
                    ViewBAL view = new ViewBAL();
                    view.SelectView(eId);
                    Label1.Text = view.E_Name;
                    Label2.Text = view.E_startDate.ToString("dd-MM-yyyy") + " - " + view.E_endDate.ToString("dd-MM-yyyy");
                    Label3.Text = view.E_mode;
                    Label4.Text = view.E_venue;
                    Label7.Text = view.E_stime.ToString("HH-mm") + " - " + view.E_etime.ToString("HH-mm");
                    Label6.Text = view.E_description;
                    Image1.ImageUrl = view.E_banner_Path;
                    Label5.Text = Label1.Text;
                }
                if (Request.QueryString["S_Id"] != null)
                {
                    int eId = Convert.ToInt32(Request.QueryString["S_Id"]);
                    ViewBAL view = new ViewBAL();
                    view.SelectScheduleView(eId);
                    Label1.Text = view.E_Name;
                    Label2.Text = view.E_startDate.ToString("dd-MM-yyyy") + " - " + view.E_endDate.ToString("dd-MM-yyyy");
                    Label3.Visible = false;
                    Label4.Text = view.E_venue;
                    Label7.Text = view.E_stime.ToString("HH-mm") + " - " + view.E_etime.ToString("HH-mm");
                    Label6.Text = view.E_description;
                    Image1.ImageUrl = view.E_banner_Path;
                    Label5.Text = Label1.Text;
                }
            }
        }

        protected void ScheduleS_Click(object sender, EventArgs e)
        {
            int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
            Response.Redirect($"SchedulePage.aspx?E_Id={eId}");
        }

        protected void Sponcer_Click(object sender, EventArgs e)
        {
            Response.Redirect($"sponcer1.aspx");

        }
        protected void Organizer_Click(object sender, EventArgs e)
        {
            Response.Redirect($"organizerList.aspx");
        }

    }
}

