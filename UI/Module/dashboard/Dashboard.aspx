<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Event_management.UI.Module.dash_board.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <!-- DashBoard -->


    <div class="container">
       <h2 class="fw-bolder">Dashboard</h2>
        <div class="row">
            <asp:Panel ID="UserManagementPanel" runat="server" CssClass="col-sm-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">
                            <asp:Image ID="UserManagementImage" runat="server" ImageUrl="~/images/icons8-user-100.png" Height="50px" Width="50px" CssClass="me-2" />
                            User Management
                        </h5>
                        <asp:HyperLink ID="ViewDetailsLink" runat="server" NavigateUrl="User.aspx" CssClass="btn btn-primary float-end">View Details</asp:HyperLink>
                    </div>
                </div>
            </asp:Panel> 

            <div class="col-sm-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">
                            <img src="../../../images/icons8-timeline-100.png" style="height: 50px; width: 50px;" class="me-2" />Events</h5>
                        <a href="EventList.aspx" class="btn btn-success float-end">View Details</a>
                    </div>
                </div>
            </div>
        
            <div class="col-sm-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">
                            <img src="../../../images/icons8-rooms-100.png" style="height: 50px; width: 50px;" class="me-2" />Rooms Count</h5>
                        <a href="RoomList.aspx" class="btn btn-warning float-end">View Details</a>
                    </div>
                </div>
            </div>
          </div>
        
        <div class="row"> 
            <div class="col-sm-4 mb-5">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">
                            <img src="../../../images/icons8-reports-100.png" style="height:50px; width:50px;" class="me-2" />Reports</h5>
                        <a href="E_Report.aspx" class="btn btn-danger float-end">View Reports</a>
                    </div>
                </div>
            </div>
              <div class="col-sm-4 mb-5">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title fw-bold">
                            <img src="../../../images/icons8-calendar-100.png" style="height:50px; width:50px;" class="me-2" />Master Calendar</h5>
                        <a href="Calender.aspx" class="btn btn-secondary float-end">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-4 mb-5">
               <div class="card">
                 <div class="card-body">
                     <h5 class="card-title fw-bold">
                         <img src="../../../images/icons8-celebration-100.png" style="height:50px; width:50px;" class="me-2" />Invitations</h5>
                     <a href="#" class="btn btn-dark float-end">View Details</a>
                 </div>
             </div>
            </div>
        </div>
    </div>
 


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="js/jquery.min.js"></script>

    
</asp:Content>
