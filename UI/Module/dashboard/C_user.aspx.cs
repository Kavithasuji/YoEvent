using Event_management.Business.Modules;
using Event_management.DAL;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Reflection;


namespace Event_management.UI.Module.dash_board
{
    public partial class C_user : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;


            updateSuccessPanel.Visible = false;
            lblcreatedate.Visible=false;    
            CreateDate.Visible = false;
            lblcreatedby.Visible = false;
          

            Createdby.Visible = false;
           if (!IsPostBack)
            {
                if (Request.QueryString["User_Id"]!= null)
                {
                    USERID.InnerText = "Update";
                    btnUpdate.Visible = true;
                    btnSave.Visible = false;

                    int eId = Convert.ToInt32(Request.QueryString["User_Id"]);
                    UserCreateBAL UserUP = new UserCreateBAL();
                    UserUP.SelectValues(eId);

                    name.Text = UserUP.User_Name;
                    phone.Text = UserUP.Mobile_Number.ToString();
                    email.Text = UserUP.Email;
                    pwd.Text = UserUP.Password;
                    Conpwd.Text = UserUP.Confirm_Password;
                    Persontype.Text = UserUP.Person_type;
                }
                else
                {
                    btnUpdate.Visible = false;
                    btnSave.Visible = true;
                }
            }
        }
        [WebMethod]
        public static string SaveUserMaster(UserCreateBAL Course)
        {

            string msg = string.Empty;
            try
            {
                User_Mgt objEntity = new User_Mgt();

                objEntity.User_Type = Course.User_Type;
                objEntity.User_Name = Course.User_Name;
                objEntity.Mobile_Number = Course.Mobile_Number;
                objEntity.Email = Course.Email;
                objEntity.Password = Course.Password;
                objEntity.Confirm_Password = Course.Confirm_Password;
                objEntity.Person_type = Course.Person_type;
                objEntity.Per_status = Course.Per_status;

                CreateUserDAL dal = new CreateUserDAL();

                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    objEntity.Createdon= DateTime.Now;
                    msg = dal.Save(objEntity);
                    DataTable dt = new DataTable();
                }
                JavaScriptSerializer json = new JavaScriptSerializer();
                string val = json.Serialize(msg);
          

                //C_user pageInstance = new C_user();
                //pageInstance.popupPanel.Visible = true;
                return val ;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            name.Text = string.Empty;
            phone.Text = string.Empty;
            email.Text = string.Empty;
            pwd.Text = string.Empty;
            Conpwd.Text = string.Empty;
            Persontype.Text = string.Empty;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            int eId = Convert.ToInt32(Request.QueryString["User_Id"]);

            string UserName = name.Text.Trim();
            long  Mobile=long.Parse(phone.Text);
            string E_mail = email.Text.Trim();
            string  psd= pwd.Text.Trim();
            string Cpwd= Conpwd.Text.Trim();
            string perType= Persontype.Text.Trim();
            string perSts = "";
            if (rbActive.Checked)
            {
                 perSts = rbActive.Text.Trim(); 
            }
            else if (rbInactive.Checked)
            {
                perSts = rbInactive.Text.Trim(); 
            }
            else
            {
                 
            }
            UserCreateBAL UserUPD = new UserCreateBAL();
            UserUPD.UpdateValues(eId, UserName, Mobile, E_mail, psd, Cpwd, perType, perSts);
            updateSuccessPanel.Visible = true;

        }

        protected void okButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");


        }
     

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            confirm.Visible =true;

        }
    }
}