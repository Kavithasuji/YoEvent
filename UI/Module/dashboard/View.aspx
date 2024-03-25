<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="Event_management.UI.Module.dashboard.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .pic {
            background-image: url('../../../images/download-background.jpg');
            height: 50px;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
            padding: 6px;
        }

        .btnc {
            background-color: #1E50CD;
            color: white;
        }

            .btnc:hover {
                background-color: #1B26A8;
            }
    </style>

    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic">Event Details</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 mb-3 text-end float-right w-100">
                <a href="Dashboard.aspx" class="btn btn-secondary btnc">Dashboard</a>
                <a href="EventList.aspx" class="btn btn-secondary btnc">Event List</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <!-- Event Info Card (col-md-4) -->
            <div class="col-md-4 mb-4">
                <div class="card">
                    <h5 class="h2 text-white card-header fw-bold text-center pic">Event Info</h5>
                    <div class="card-body">
                        <asp:Label ID="Label1" runat="server" CssClass="h5 card-title fw-bold mb-3" Text="Event Name"></asp:Label><br />
                        <asp:Label ID="Label2" runat="server" CssClass="h5 card-title" Text="Event Date"></asp:Label><br />
                        <asp:Label ID="Label7" runat="server" CssClass="h5 card-title" Text="Event Time"></asp:Label><br />
                        <asp:Label ID="Label3" runat="server" CssClass="h5 card-title" Text="Event Mode"></asp:Label><br />
                        <asp:Label ID="Label4" runat="server" CssClass="h5 card-title fw-bold" Text="Venue"></asp:Label><br />
                        <div class="m-3">
                            <asp:Button runat="server" Text="Sponsor" CssClass="btn btn-secondary w-100 btnc mb-2" OnClick="Sponcer_Click" />
                            <asp:Button runat="server" Text="Schedule" CssClass="btn btn-secondary w-100 btnc mb-2" OnClick="ScheduleS_Click" />
                            <asp:Button runat="server" Text="Organizer" CssClass="btn btn-secondary w-100 btnc" Onclick="Organizer_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Event Image Card (col-md-8) -->
            <div class="col-md-8 mb-4">
                <div class="card">
                    <asp:Label ID="Label5" runat="server" CssClass="h2 text-white card-header fw-bold text-center pic"></asp:Label><br />
                    <div class="card-body">
                        <asp:Image ID="Image1" runat="server" CssClass="card-img-top" Style="height: 300px; width: 100%;" />
                        <asp:Label ID="Label6" runat="server" CssClass="card-text mt-2"></asp:Label><br />
                    </div>
                </div>
            </div>
        </div>
    </div>

        
</asp:Content>
