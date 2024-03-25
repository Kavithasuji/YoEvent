using Event_management.Business.Modules;
using Event_management.DAL;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Event_management.UI.Module.dashboard
{
    public partial class sponcer1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        
        { 
            int sId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["S_Id"]);
            SqlDataSource1.DeleteParameters["S_Id"].DefaultValue = sId.ToString();
        }
    
        
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow selectedRow = GridView1.Rows[e.NewEditIndex];

            int eId = Convert.ToInt32(GridView1.DataKeys[selectedRow.RowIndex].Value);

            Response.Redirect($"create_sponcers.aspx?E_Id={eId}");
        }


        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            using (EventManagementEntities con = new EventManagementEntities())
            {
                con.Database.Connection.Open();
                string search = TextBox1.Text.Trim();
                SqlDataSource1.SelectCommand = "Select * from sponcer where  First_name LIKE @search ";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("search", "%" + search + "%");
                GridView1.DataBind();
            }

        }
        protected void popyes_Click1(object sender, EventArgs e)
        {
            if (Session["S_IdToDelete"] != null)
            {
                int sId = Convert.ToInt32(Session["S_IdToDelete"]);
                SqlDataSource1.DeleteParameters["S_Id"].DefaultValue = sId.ToString();
                SqlDataSource1.Delete();
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
            int sId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["S_Id"]);
            Session["S_IdToDelete"] = sId;
            confirm.Visible = true;
        }
    }
}