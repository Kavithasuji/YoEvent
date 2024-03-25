//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT 

using Event_management.Business.Modules;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Event_Reg = Eventedmxentites.Event_Reg;

namespace Event_management.UI.Module.dash_board
{
    public partial class Event : System.Web.UI.Page
    {
        public static string Designation = string.Empty;



        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible= false;
            updateSuccessPanel.Visible = false;

            if (!IsPostBack)
            {
                EndDateCompareValidator.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
                CompareValidator1.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");

                banner_image_literal.Visible = false;
                event_icon_Literal.Visible = false;
                floor_map_Literal.Visible = false;
                btnUpdate.Visible = false;
                btnSave.Visible = true;

                if (Request.QueryString["E_Id"] != null)
                {
                    HtmlGenericControl Head = pic;
                    Head.InnerText = "Update";

                    if (Head.InnerText == "Update")
                    {
                        btnUpdate.Visible = true;
                        btnSave.Visible = false;

                        banner_image_literal.Visible = true;
                        event_icon_Literal.Visible = true;
                        floor_map_Literal.Visible = true;

                        int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
                        UpdateEvent Sel = new UpdateEvent();
                        Sel.select(eId);

                        event_name.Text = Sel.E_Name;
                        description.Text = Sel.E_description;
                        E_Sdate.Text = Sel.E_startDate.ToString("yyyy-MM-dd"); 
                        E_Edate.Text =Sel. E_endDate.ToString("yyyy-MM-dd");
                        E_Stime.Text=Sel.E_stime.ToString("hh:mm:ss");
                        E_Etime.Text=Sel.E_etime.ToString("hh:mm:ss");
                        venue.Text = Sel.E_venue;
                        location_link.Text = Sel.E_location;
                        Event_Type.Text = Sel.E_type;
                        Event_Mode.Text = Sel.E_mode;
                        seating_capacity.Text = Sel.E_seat.ToString();
                        registration_link.Text = Sel.E_register;
                        banner_image_literal.Text = Sel.E_banner_Path;
                        event_icon_Literal.Text = Sel.E_icon_Path;
                        floor_map_Literal.Text = Sel.E_floor_Path;
                    }
                    else
                    {
                        btnUpdate.Visible = false;
                        btnSave.Visible = true;
                    }
                }
            }
        }

        /*BY:B.LOKESH DATE:08-1-2022*/

        [WebMethod]
        public static string SaveEventMaster(EventRegistration Course)
        {
            string msg = string.Empty;
            try
            {
                Event_Reg objEvent = new Event_Reg();
                objEvent.E_Name = Course.E_Name;
                objEvent.E_Description = Course.E_Description;
                objEvent.E_Sdate = Course.E_Sdate;
                objEvent.E_Edate = Course.E_Edate;
                objEvent.E_Venue = Course.E_Venue;
                objEvent.E_LocationLink = Course.E_LocationLink;
                objEvent.E_Type = Course.E_Type;
                objEvent.E_Mode = Course.E_Mode;
                objEvent.E_Seat = Course.E_Seat;
                objEvent.E_RegisterLink = Course.E_RegisterLink;
                objEvent.E_BannerImg = Course.E_BannerImg;
                objEvent.E_Icon = Course.E_Icon;
                objEvent.E_FloorMap = Course.E_FloorMap;
                objEvent.E_Stime = Course.E_Stime;
                objEvent.E_Etime = Course.E_Etime;
                CEventRegisterDAL dal = new CEventRegisterDAL();

                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg = dal.Save(objEvent);
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
        [WebMethod]
        public static string Eventbindrequest()
        {
            try
            {
                EventRegistration eve = new EventRegistration();
                DataTable dt = new DataTable();
                dt = eve.Eventbindrequest();
                if (dt.Rows.Count > 0)
                {
                    return JsonConvert.SerializeObject(dt, new IsoDateTimeConverter { DateTimeFormat = "dd-MM-yyyy" });
                }
                else
                {
                    return JsonConvert.SerializeObject(null);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {


            UpdateEvent ff = new UpdateEvent();
            string E_name = event_name.Text.Trim();
            string E_Description = description.Text.Trim();
            DateTime E_startDate = DateTime.Parse(E_Sdate.Text.Trim());
            DateTime E_endDate = DateTime.Parse(E_Edate.Text.Trim());
            DateTime E_Starttime = DateTime.Parse(E_Stime.Text.Trim());
            DateTime E_Endtime = DateTime.Parse(E_Etime.Text.Trim());
            string E_Venue = venue.Text.Trim();
            string E_Location = location_link.Text.Trim();
            string E_Type = Event_Type.Text.Trim();
            string E_Mode = Event_Mode.Text.Trim();
            int E_Seat = Convert.ToInt32(seating_capacity.Text);
            string E_Register = registration_link.Text.Trim();

            byte[] E_Banner = banner_image.FileBytes;
            byte[] E_Icon = event_icon.FileBytes;
            byte[] E_Floor = floor_map.FileBytes;

            int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
            ff.updatevalues(eId, E_name, E_Description, E_startDate, E_endDate, E_Starttime, E_Endtime, E_Venue,
                E_Location, E_Type, E_Mode, E_Seat, E_Register, E_Banner, E_Icon, E_Floor);
            updateSuccessPanel.Visible = true;


            HttpContext.Current.ApplicationInstance.CompleteRequest();
            updateSuccessPanel.Visible = true;

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            event_name.Text = string.Empty;
            description.Text = string.Empty;
            E_Sdate.Text = string.Empty;
            E_Edate.Text = string.Empty;
            venue.Text = string.Empty;
            location_link.Text = string.Empty;
            Event_Type.Text = string.Empty;
            Event_Mode.Text = string.Empty;
            seating_capacity.Text = 0.ToString();
            registration_link.Text = string.Empty;
            banner_image_literal.Text = string.Empty;
            event_icon_Literal.Text = string.Empty;
            floor_map_Literal.Text = string.Empty;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            confirm.Visible = true;
        }

       
    }
}

