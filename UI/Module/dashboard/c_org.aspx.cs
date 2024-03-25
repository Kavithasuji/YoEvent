using Event_management.Business.Modules;
using Event_management.DAL;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Policy;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Org_anizer = Eventedmxentites.organizer;

namespace Event_management.UI.Module.dashboard
{
    public partial class c_org : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;
            updateSuccessPanel.Visible = false;

            if (!IsPostBack)
            {


                if (Request.QueryString["F_Id"] != null)
                {
                    Head.InnerText = "Update";
                    btnupdate.Visible = true;
                    btnsave.Visible = false;
                    int eId = Convert.ToInt32(Request.QueryString["F_Id"]);
                    CreateOrganizerBAL CT = new CreateOrganizerBAL();
                    CT.selectvalues(eId);

                    First_Name.Value = CT.F_Name;
                    Last_Name.Value = CT.L_Name;
                    Email.Value = CT.email;
                    Phone.Value = CT.P_hone.ToString();
                    Organizer_Type.Value = CT.organizer_type;
                    Org_Image_literal.Text = CT.image;
                }
                else
                {
                    btnupdate.Visible = false;
                    btnsave.Visible = true;
                }
            }
        }

        [WebMethod]
        public static string SaveOrganizerPage(createorg Course)
        {
            string msg = string.Empty;
            try
            {
                Org_anizer org = new Org_anizer();
                org.First_Name = Course.First_Name;
                org.Last_Name = Course.Last_Name;
                org.Organizer_Type = Course.Organizer_Type;
                org.Email = Course.Email;
                org.Phone = Course.Phone;
                org.Org_Image = Course.Org_Image;

                org_DAL dal = new org_DAL();

                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg = dal.save(org);
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
        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            // Check for DBNull before returning the value
            return reader[columnName] != DBNull.Value ? reader[columnName].ToString() : string.Empty;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            int eId = Convert.ToInt32(Request.QueryString["F_Id"]);
            string FirstName = First_Name.Value.Trim();
            string LastName = Last_Name.Value.Trim();
            string OrganizerType = Organizer_Type.Value.Trim();
            string email = Email.Value.Trim();
            long phone = long.Parse(Phone.Value);
            byte[] OrgImg = Org_Image.FileBytes;

            CreateOrganizerBAL sp = new CreateOrganizerBAL();
            sp.updatevalues(eId, FirstName, LastName, OrganizerType, email, phone, OrgImg);
            updateSuccessPanel.Visible = true;

            //Response.Redirect("organizerList.aspx");
        }
        private string SaveUploadedFile(HttpPostedFile file)
        {
            string fileName = Path.GetFileName(file.FileName);
            string filePath = Server.MapPath("~/Uploads/") + fileName;
            file.SaveAs(filePath);
            return filePath;
        }
        protected void btnclear_Click(object sender, EventArgs e)
        {

            First_Name.Value = string.Empty;
            Last_Name.Value = string.Empty;
            Email.Value = string.Empty;
            Phone.Value = string.Empty;
            Organizer_Type.Value = string.Empty;
            Org_Image_literal.Text = string.Empty;
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            confirm.Visible = true;


        }
    }
}
