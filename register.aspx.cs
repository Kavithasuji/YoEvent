using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using Event_management.DAL;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Event_management.Business.Modules;
using Eventedmxentites;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Event_management

{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            updateSuccessPanel.Visible = false;
            Panel1.Visible = false;
         




        }
        [System.Web.Services.WebMethod]
        public static List<string> FetchData(string searchText)
        {
            List<string> results = new List<string>();

            string connectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            string query = "SELECT DISTINCT User_Type FROM User_Mgt WHERE User_Type LIKE @searchText + '%'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@searchText", searchText);

                // Open connection and execute query
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // Read results
                while (reader.Read())
                {
                    results.Add(reader["User_Type"].ToString());
                }

                connection.Close();
            }

            return results;
        }

      

        [WebMethod]
        public static string SaveCourseMaster(Eventregpage Course)
        {
            string msg = string.Empty;
            try
            {
                User_Mgt objEntity = new User_Mgt();
                
                objEntity.User_Type= Course.User_Type;
                objEntity.User_Name = Course.User_Name;
                objEntity.Mobile_Number = Course.Mobile_Number;
                objEntity.Email = Course.Email;
                objEntity.Password= Course.Password;
                objEntity.Confirm_Password = Course.Confirm_Password;
                objEntity.Per_status= Course.Per_status;

                EventRegisterDAL dal = new EventRegisterDAL();
                bool emailExists = dal.CheckEmailExists(Course.Email);

                if (emailExists)
                {
                    return "Email already registered.";

                }
                else
                {
                    msg = dal.Save(objEntity);
                }

                if (Course != null)
                {
                    DataSet ds = new DataSet();
                    //objEntity.CreationDate = DateTime.Now;
                    //objEntity.Createdon= DateTime.Now;
                    msg = dal.Save(objEntity);
                    //int id = objEntity.CourseId;
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
        public static bool CheckEmailExists(string email)
        {
            EventRegisterDAL dal = new EventRegisterDAL();
            return dal.CheckEmailExists(email);

                
            
        }
        private bool IsEmailAlreadyRegistered()
        {
            string email = Email.Text; // Assuming Email is the ID of your email TextBox
            EventRegisterDAL dal = new EventRegisterDAL();
            return dal.CheckEmailExists(email);
        }



        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsEmailAlreadyRegistered() == true)
            {
                Panel1.Visible = true;

            }
            else
            {
                Panel1.Visible = false;
                updateSuccessPanel.Visible = true;

            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void panelmail_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;

        }

       
    }
}