using Event_management.Business.Modules;
using Event_management.DAL;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Data.Entity.Infrastructure.Design.Executor;

namespace Event_management.UI.Module.dashboard
{
    public partial class All_sponcers : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            

            updateSuccessPanel.Visible = false;
            confirm.Visible= false;


            if (!IsPostBack)
            {
                if (Request.QueryString["E_Id"] != null)                {
                    Head.InnerText = "Update";
                    btnupdate.Visible = true;
                    btnsave.Visible = false;

                    int eId = Convert.ToInt32(Request.QueryString["E_Id"]);
                    SponsorUpdateBAL SPS = new SponsorUpdateBAL();
                    SPS.Selectvalues(eId);
                    First_name.Text = SPS.F_Name;
                    Last_name.Text = SPS.L_Name;
                    description.Text = SPS.description;
                    website.Text = SPS.website;
                    email.Text = SPS.mail;
                    phone.Text = SPS.phone.ToString();
                    logo_Image_literal.Text = SPS.Logo;

                }
                else
                {
                    btnupdate.Visible = false;
                    btnsave.Visible = true;
                }
            }
        }

     

        [WebMethod]
        public static string SaveSponcerMaster(Createsponcers Course)
        {
            string msg = string.Empty;
            try
            {
                sponcer objsponcer = new sponcer();
                objsponcer.First_name = Course.First_name;
                objsponcer.Last_name = Course.Last_name;
                objsponcer.Description = Course.Description;
                objsponcer.Website = Course.Website;
                objsponcer.Email = Course.Email;
                objsponcer.Phone = Course.Phone;
                objsponcer.Logo = Course.Logo;

                SponcerRegisterDAL dal = new SponcerRegisterDAL();


                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    msg = dal.Save(objsponcer);
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

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            int eId = Convert.ToInt32(Request.QueryString["E_Id"]);

            string FirstName = First_name.Text.Trim();
            string LastName = Last_name.Text.Trim();
            string Description = description.Text.Trim();
            string Website = website.Text.Trim();
            string Email = email.Text.Trim();
            long Phone = long.Parse(phone.Text);
            byte[] logoFile = logo.FileBytes;

            SponsorUpdateBAL SP = new SponsorUpdateBAL();
            
            SP.updatevalues(eId, FirstName, LastName, Description, Website, Email, Phone, logoFile);
            updateSuccessPanel.Visible = true;


        }



        protected void btnclear_Click(object sender, EventArgs e)
        {
            First_name.Text = string.Empty;
            Last_name.Text = string.Empty;
            description.Text = string.Empty;    
            website.Text = string.Empty;
            email.Text = string.Empty;
            phone.Text = string.Empty;
            logo_Image_literal.Text= string.Empty;




        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            confirm.Visible = true;
        }
    }

}




