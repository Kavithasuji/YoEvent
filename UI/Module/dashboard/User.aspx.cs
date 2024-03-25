using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Event_management.UI.Module.dash_board
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }
      
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int sId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["User_Id"]);
            SqlDataSource1.DeleteParameters["User_Id"].DefaultValue = sId.ToString();

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow selectedRow = GridView1.Rows[e.NewEditIndex];
            int eId = Convert.ToInt32(GridView1.DataKeys[selectedRow.RowIndex].Value);
            string personType = selectedRow.Cells[5].Text; // Corrected index
            Response.Redirect($"C_user.aspx?User_Id={eId}&Person_type={personType}");

        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        { 

        }

      

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {



        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {

            using (EventManagementEntities con = new EventManagementEntities())
            {
                con.Database.Connection.Open();
                string search = txtSearch.Text.Trim();
                SqlDataSource1.SelectCommand = "Select * from User_Mgt where User_Name LIKE @search ";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("search", "%" + search + "%");
                GridView1.DataBind();
            }
        }
    }
}