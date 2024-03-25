using Event_management.BAL;
using Event_management.Business.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using C_Room = Eventedmxentites.C_Room;


namespace Event_management.UI.Module.dashboard
{
    public partial class Room_Count : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;
            updateSuccessPanel.Visible = false;
            if (!IsPostBack)
            {
                btnUpdate.Visible = false;
                btnSave.Visible = true;
                HtmlGenericControl Head = pic;
                Head.InnerText = "create";

                //if (Head.InnerText == "Update")
                //{
                //    btnUpdate.Visible = true;
                //    btnSave.Visible = false;

                    if (Request.QueryString["roomId"] != null)
                    {
                        btnUpdate.Visible = true;
                        btnSave.Visible = false;

                        Head.InnerText = "create";

                        int roomId = Convert.ToInt32(Request.QueryString["roomId"]);

                        UpdateRoomBAL Sel= new UpdateRoomBAL();
                        Sel.select(roomId);
                        name.Text = Sel.Name;
                        description.Text=Sel.Description;
                        venue.Text=Sel.Venue;
                        location_link.Text = Sel.Location;
                        event_type.SelectedValue = Sel.Type;
                        Equipment.Text = Sel.Equipment;
                        seating_capacity.Text = Sel.Seat.ToString();
                        Room_Image_literal.Text = Sel.Image;
                    }
                
            }
        }

  
        [WebMethod]
        public static string SaveRoomMaster(CreateRoomBAL Course)
        {
            string msg = string.Empty;
            try
            {
                C_Room Room = new C_Room();
                Room.Name = Course.Name;
                Room.Description = Course.Description;
                Room.Event_Venue = Course.Event_Venue;
                Room.Location_Link = Course.Location_Link;
                Room.Event_type = Course.Event_type;
                Room.Equipment = Course.Equipment;
                Room.Seat = Course.Seat;
                Room.Room_Img = Course.Room_Img;
                CreateRoomDAL dal = new CreateRoomDAL();


                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg = dal.Save(Room);
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateRoomBAL updateRoom = new UpdateRoomBAL();

            int roomId = Convert.ToInt32(Request.QueryString["roomId"]);

            string E_Name = name.Text.Trim();
            string E_Description = description.Text.Trim();
            string E_venue = venue.Text.Trim();
            string E_Location = location_link.Text.Trim();
            string E_Type = event_type.SelectedValue;
            string E_Equipment = Equipment.Text;
            int E_Seat = int.Parse(seating_capacity.Text);

            byte[] E_RoomImage = Room_Img.FileBytes;

            updateRoom.Update(roomId,E_Name,E_Description,E_venue,E_Location,E_Type, E_Equipment, E_Seat,E_RoomImage);
            updateSuccessPanel.Visible = true;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

            name.Text = string.Empty;
            description.Text = string.Empty;
            venue.Text = string.Empty;
            location_link.Text = string.Empty;
            event_type.SelectedIndex = 0;
            Equipment.Text = string.Empty;
            seating_capacity.Text = string.Empty;
            Room_Image_literal.Text = string.Empty;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {


            confirm.Visible = true;
        }
    }
}