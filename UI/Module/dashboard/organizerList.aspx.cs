

using Eventedmxentites;
using System;
using System.Security.Policy;
using System.Web.UI.WebControls;

namespace Event_management.UI.Module.dashboard
{
    public partial class organizer : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;

            if (!IsPostBack)
            {
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                int rowIndex = e.NewEditIndex;
                int fId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["F_Id"]);
                Response.Redirect($"c_org.aspx?F_Id={fId}");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (EventManagementEntities con = new EventManagementEntities())
            {
                con.Database.Connection.Open();
                string search = TextBox1.Text.Trim();
                SqlDataSource11.SelectCommand = "Select * from organizer where First_Name LIKE @search ";
                SqlDataSource11.SelectParameters.Clear();
                SqlDataSource11.SelectParameters.Add("search", "%" + search + "%");
                GridView1.DataBind();
            }
        }



        private void BindGridViewData()
        {
            using (EventManagementEntities con = new EventManagementEntities())

                // Implement this method to bind data to the GridView
                // GridView1.DataSource = con ;
                // GridView1.DataBind();
                GridView1.EditIndex = -1;
                GridView1.DataBind();
        }
        protected void popyes_Click1(object sender, EventArgs e)
        {
            if (Session["S_IdToDelete"] != null)
            {
                int sId = Convert.ToInt32(Session["S_IdToDelete"]);
                SqlDataSource11.DeleteParameters["F_Id"].DefaultValue = sId.ToString();
                SqlDataSource11.Delete();
                GridView1.DataBind();
                Session.Remove("S_IdToDelete");
            }
            confirm.Visible = false;
        }


        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;
            int rowIndex = row.RowIndex;
            int sId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["F_Id"]);
            Session["S_IdToDelete"] = sId;
            confirm.Visible = true;
        }

        // ... (existing methods)
    }
}
