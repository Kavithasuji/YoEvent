<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="Event_management.UI.Module.dashboard.Calender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer" />

    <link href="../../Shared/CSS/Calender.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="container1">
            <div class="left">
                <div class="calendar">
                    <div class="month">
                        <i class="fas fa-angle-left prev"></i>
                        <div class="date">december 2015</div>
                        <i class="fas fa-angle-right next"></i>
                    </div>
                    <div class="weekdays">
                        <div>Sunday</div>
                        <div>Monday</div>
                        <div>Tuesday</div>
                        <div>Wednesday</div>
                        <div>Thursday</div>
                        <div>Friday</div>
                        <div>Saturday</div>
                    </div>
                    <div class="days" onclick="saveEventDate"></div>
                    <div class="goto-today">
                        <button class="today-btn">Today</button>
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="today-date">
                    <div class="event-day">wednesday</div>
                    <div class="event-date">12th december 2022</div>
                </div>
                <div class="events"></div>
                <div class="add-event-wrapper">
                    <div class="add-event-header">
                        <div class="title">Add Event</div>
                        <i class="fas fa-times close"></i>
                    </div>
                    <div class="add-event-footer">
                        <button class="add-event-btn">Add Event</button>
                    </div>
                </div>
            </div>
            <asp:LinkButton runat="server" CssClass="add-event" OnClick="btnAddEvent_Click">
               <i class="fas fa-plus"></i> 
            </asp:LinkButton>
        </div>
    </div>


    <script src="../../../js/jquery.min.js"></script>
    <script src="../../Shared/js/Calender.js"></script>

</asp:Content>
