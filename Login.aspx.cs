/*BY:B.LOKESH DATE:22-12-2023*/
using System;
using Event_management.Business.Modules;

namespace Event_management
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

            protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = Email.Text.Trim();
            string password = Pass.Text.Trim();
            string personType = "";

            EventlogBAL balLog = new EventlogBAL();
            bool isValidUser = balLog.ValidateUser(email, password, out personType);

            if (isValidUser && !string.IsNullOrEmpty(personType))
            {
                // Redirect to next page upon successful login
                Response.Redirect($"UI/Module/dashboard/Dashboard.aspx?UserType={personType}");
            }
            else
            {
                // Handle incorrect email or password
                Panel1.Visible = true;

            }
        }
    }
}

