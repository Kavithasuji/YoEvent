using System;

namespace Event_management.UI.Module.dash_board
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string personType = Request.QueryString["UserType"];

                if (personType == "Admin(SA)" || personType == "Admin")
                {
                    UserManagementPanel.Visible = true;
                }
                else if (personType == "User")
                {
                    UserManagementPanel.Visible = false;
                }
                else
                {
                    UserManagementPanel.Visible = true;
                }
            }
        }
    }
}