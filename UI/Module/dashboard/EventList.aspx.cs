using Event_management.UI.Module.dash_board;
using Eventedmxentites;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Event_management.UI.Module.dashboard
{
    public partial class EventList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;



        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            using (EventManagementEntities con = new EventManagementEntities())
            {
                con.Database.Connection.Open();
                string searchTerm = txtSearch.Text.Trim();
                SqlDataSource1.SelectCommand = "SELECT * FROM Event_Reg WHERE E_Name LIKE @SearchTerm";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("SearchTerm", "%" + searchTerm + "%");
                GridView2.DataBind();
            }
        }
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow selectedRow = GridView2.Rows[e.NewEditIndex];

            int eId = Convert.ToInt32(GridView2.DataKeys[selectedRow.RowIndex].Value);

            Response.Redirect($"C_Event.aspx?E_Id={eId}");
        }

        protected void lnkBtnView_Click(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((Control)sender).NamingContainer;
            int rowIndex = gridViewRow.RowIndex;
            int eId = Convert.ToInt32(GridView2.DataKeys[rowIndex].Value);

            Response.Redirect($"View.aspx?E_Id={eId}");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;
            int rowIndex = row.RowIndex;
            int sId = Convert.ToInt32(GridView2.DataKeys[rowIndex].Values["E_Id"]);
            Session["E_IdToDelete"] = sId;
            confirm.Visible = true;
        }
        protected void popyes_Click1(object sender, EventArgs e)
        {
            if (Session["E_IdToDelete"] != null)
            {
                int sId = Convert.ToInt32(Session["E_IdToDelete"]);

                string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

                using (SqlConnection con = new SqlConnection(sqlConnectionString))
                {
                    string sqlDeleteCommand = "DELETE FROM [Event_Reg] WHERE [E_Id] = @E_Id";

                    using (SqlCommand cmd = new SqlCommand(sqlDeleteCommand, con))
                    {
                        cmd.Parameters.AddWithValue("@E_Id", sId);

                        try
                        {
                            con.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                GridView2.DataBind();

                            }
                            else
                            {
                                // Handle the case where no rows were deleted
                                // For example: display an appropriate message
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle the exception, log, or display error message
                            string errorMessage = ex.Message;
                            // For example:
                            // ErrorMessageLabel.Text = "An error occurred while deleting the record.";
                        }
                    }
                }

                // Clear session variable
                Session.Remove("E_IdToDelete");
            }

            // Hide the confirmation panel
            confirm.Visible = false;
        }

    }
}

