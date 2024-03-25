using Event_management.Business.Modules;
using Event_management.DAL;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static Event_management.Business.Modules.ScheduleBAL;

namespace Event_management.UI.Module.dashboard
{
    public partial class SchedulePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateSuccessPanel.Visible = false;
            Panel1.Visible = false;
            if (!IsPostBack)
            {
                btnUpdate.Visible = false;
                E_SdateValidator.ValueToCompare = DateTime.Now.ToShortDateString();
                E_EdateValidator.ValueToCompare = DateTime.Now.ToShortDateString();
                if (Request.QueryString["S_Id"] != null)
                {
                    HtmlGenericControl Head = pic;
                    Head.InnerText = "Update Schedule";
                    if (Head.InnerText == "Update Schedule")
                    {
                        btnUpdate.Visible = true;
                        btnSave.Visible = false;

                        int eId = Convert.ToInt32(Request.QueryString["S_Id"]);
                        ScheduleBAL sc = new ScheduleBAL();
                        sc.SelectScheduledEvent(eId);
                        S_Ename.Text = sc.S_Ename;
                        description.Text = sc.S_Description;
                        E_Sdate.Text = sc.S_Sdate.ToString("yyyy-MM-dd");
                        E_Stime.Text = sc.S_Stime.ToString("HH:mm");
                        E_Edate.Text = sc.S_Edate.ToString("yyyy-MM-dd");
                        E_Etime.Text = sc.S_ETime.ToString("HH:mm");
                        venue.Text = sc.S_Venue;
                        S_Room.Text = sc.S_Room;
                        S_Sponcer.Text = sc.S_Sponcer;
                        S_Organizer.Text = sc.S_Organizer;


                        ScheduleDAL sch = new ScheduleDAL();
                        DataSet result = sch.Select();


                        if (result.Tables.Contains("Room"))
                        {
                            foreach (DataRow row in result.Tables["Room"].Rows)
                            {
                                S_Room.Items.Add(row["Name"].ToString());
                            }
                        }

                        if (result.Tables.Contains("Sponsor"))
                        {
                            foreach (DataRow row in result.Tables["Sponsor"].Rows)
                            {
                                S_Sponcer.Items.Add(row["FullName"].ToString());
                            }
                        }

                        if (result.Tables.Contains("Organizer"))
                        {
                            foreach (DataRow row in result.Tables["Organizer"].Rows)
                            {
                                S_Organizer.Items.Add(row["FullName"].ToString());
                            }
                        }
                    }
                }

                //To select the selected recordds from the Event page to show in the schedule Page view
                if (Request.QueryString["E_Id"] != null)
                {
                    int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
                    ScheduleBAL sc = new ScheduleBAL();
                    sc.SelectSchedule(eId);
                    S_Ename.Text = sc.S_Ename;
                    description.Text = sc.S_Description;
                    E_Sdate.Text = sc.S_Sdate.ToString("yyyy-MM-dd");
                    E_Stime.Text = sc.S_Stime.ToString("HH:mm");
                    E_Edate.Text = sc.S_Edate.ToString("yyyy-MM-dd");
                    E_Etime.Text = sc.S_ETime.ToString("HH:mm");
                    venue.Text = sc.S_Venue;


                    ScheduleDAL sch = new ScheduleDAL();
                    DataSet result = sch.Select();


                    if (result.Tables.Contains("Room"))
                    {
                        foreach (DataRow row in result.Tables["Room"].Rows)
                        {
                            S_Room.Items.Add(row["Name"].ToString());
                        }
                    }

                    if (result.Tables.Contains("Sponsor"))
                    {
                        foreach (DataRow row in result.Tables["Sponsor"].Rows)
                        {
                            S_Sponcer.Items.Add(row["FullName"].ToString());
                        }
                    }

                    if (result.Tables.Contains("Organizer"))
                    {
                        foreach (DataRow row in result.Tables["Organizer"].Rows)
                        {
                            S_Organizer.Items.Add(row["FullName"].ToString());
                        }
                    }
                }
            }
        }

        //To Redirect to the view page with the EventID field
        protected void btn_view_Click(object sender, EventArgs e)
        {
            HtmlGenericControl Head = pic;
            if (Head.InnerText == "Update Schedule")
            {
                int eId = Convert.ToInt32(Request.QueryString["S_Id"]);
                Response.Redirect($"View.aspx?S_Id={eId}");

            }
            if (Head.InnerText == "Schedule Event")
            {
                int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
                Response.Redirect($"View.aspx?E_Id={eId}");

            }

        }


            //To insert the Record in to the table in the schedule 
            [WebMethod]
        public static string ScheduleEventMaster(sch_event Course)
        {
            string msg = string.Empty;
            try
            {
                Schedule_Event sce = new Schedule_Event();

                sce.S_Event = Course.S_Event;
                sce.S_Description = Course.S_Description;
                sce.S_Sdate = Course.S_Sdate;
                sce.S_Edate = Course.S_Edate;
                sce.S_Stime = Course.S_Stime;
                sce.S_Etime = Course.S_Etime;
                sce.S_Venue = Course.S_Venue;
                sce.S_Room = Course.S_Room;
                sce.S_Sponsor = Course.S_Sponsor;
                sce.S_Organizer = Course.S_Organizer;

                ScheduleRventDal scheduleDal = new ScheduleRventDal();

                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg = scheduleDal.Save(sce);
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

        //To Clear the data in the text box
        protected void btnClear_Click(object sender, EventArgs e)
        {
            S_Ename.Text = "";
            description.Text = "";
            E_Sdate.Text = "";
            E_Stime.Text = "";
            E_Edate.Text = "";
            E_Etime.Text = "";
            venue.Text = "";
        }

        //To Redirect to the calendar view
        protected void btnSave_Click(object sender, EventArgs e)
        {
            updateSuccessPanel.Visible = true;

        }


        //Update Scheduledule after the redirect from calendar
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["S_Id"] != null)
            {
                HtmlGenericControl Head = pic;
                Head.InnerText = "Update Schedule";

                if (Head.InnerText == "Update Schedule")
                {
                    btnUpdate.Visible = true;
                    btnSave.Visible = false;

                    int eId = Convert.ToInt32(Request.QueryString["S_Id"]);
                    string s_Sname = S_Ename.Text;
                    string s_Sdescription = description.Text;
                    DateTime s_Ssdate = DateTime.ParseExact(E_Sdate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                    DateTime s_Sedate = DateTime.ParseExact(E_Edate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                    DateTime s_Sstime = DateTime.ParseExact(E_Stime.Text, "HH:mm", CultureInfo.InvariantCulture);
                    DateTime s_Setime = DateTime.ParseExact(E_Etime.Text, "HH:mm", CultureInfo.InvariantCulture);
                    string s_Svenue = venue.Text;
                    string s_room = S_Room.Text;
                    string s_sponcer = S_Sponcer.Text;
                    string s_organizer = S_Organizer.Text;

                    // Call the static method using the class name
                    ScheduleUpdate.UpdateSchedule(eId, s_Sname, s_Sdescription, s_Ssdate, s_Sedate, s_Sstime, s_Setime, s_Svenue, s_room, s_sponcer, s_organizer);
                    Panel1.Visible= true;
                }
            }
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {
            int eId = Convert.ToInt32(Request.QueryString["S_Id"]);
            Response.Redirect($"View.aspx?S_Id={eId}");
        }
    }
}