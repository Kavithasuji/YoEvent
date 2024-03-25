using System;
using System.Web.UI.WebControls;

namespace Event_management.UI.Module.dashboard
{
    public partial class RoomList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            confirm.Visible = false;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow selectedRow = GridView1.Rows[e.NewEditIndex];
            int roomId = Convert.ToInt32(GridView1.DataKeys[selectedRow.RowIndex].Value);
            Response.Redirect($"Room_Count.aspx?roomId={roomId}");
        }
        protected void btnDelete_Click1(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            GridViewRow row = (GridViewRow)btnDelete.NamingContainer;
            int rowIndex = row.RowIndex;
            int sId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values["Room_ID"]);
            Session["Room_IDToDelete"] = sId;
            confirm.Visible = true;
        }
        protected void popyes_Click1(object sender, EventArgs e)
        {
            if (Session["Room_IDToDelete"] != null)
            {
                int sId = Convert.ToInt32(Session["Room_IDToDelete"]);
                SqlDataSource1.DeleteParameters["Room_ID"].DefaultValue = sId.ToString();
                SqlDataSource1.Delete();
                GridView1.DataBind();
                Session.Remove("Room_IDToDelete");
            }
            confirm.Visible = false;
        }
    }
}
