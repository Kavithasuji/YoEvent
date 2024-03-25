<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="SchedulePage.aspx.cs" Inherits="Event_management.UI.Module.dashboard.SchedulePage" %>
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
  #<%= updateSuccessPanel.ClientID %> 
        {
     height:120px;   
     width: 300px;
     background-color: #f5f3f4;
     padding: 20px;
     border-radius: 10px;
     box-shadow: 0 0 10px rgba(0, 0, 255, 0.3); /* Blue shadow */
     position: fixed;
     top: 50%;
     left: 50%;
     transform: translate(-50%, -50%);
     text-align: center;
     z-index: 9999;
         }
   #<%= Panel1.ClientID %> 
       {
    height:120px;   
    width: 300px;
    background-color: #f5f3f4;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 255, 0.3); /* Blue shadow */
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    z-index: 9999;
        }

 </style>


    <div class="container">
        <div class="row">
            <div class="col-md-12 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary me-3 btnc">Dashboard</a>
                <asp:Button ID="btn_view" runat="server" Text="View" CssClass="btn btn-secondary btnc" OnClick="btn_view_Click"/>
            </div>
        </div>
    </div>

    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        Event Scheduled!
  <div class="text-end">
      <asp:HyperLink ID="okLink" NavigateUrl="Calender.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
  </div>
    </asp:Panel>

    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="pic">Schedule Event</h2>
    </div>
    <asp:Panel ID="Panel1" CssClass="updatesuccess" runat="server">
         Updated!
        <div class="text-end">
<%--            <asp:HyperLink ID="HyperLink1" NavigateUrl="View.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>--%>
            <asp:Button ID="updatebtn" runat="server" Text="Ok" CssClass="btn btn-secondary btnc" OnClick="updatebtn_Click" />

        </div>
    </asp:Panel>

 <%-- <div class="container mt-5">
      <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="H1">Schedule Event</h2>
  </div>--%>




    <section class="container mb-4">
        <div class="row">
            <!-- Left Column -->
            <div class="col-md-6">
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="event_name" class="fw-bold">Event Name:</label>
                    <asp:TextBox runat="server" ID="S_Ename" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="form-control" runat="server" ErrorMessage="Please Enter the Event Name"  ForeColor="Red" ControlToValidate="S_Ename"  SetFocusOnError="True" Display="Dynamic" ValidationGroup="s"></asp:RequiredFieldValidator>
                </div>
                <!-- Continue with other left column fields... -->
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="description" class="fw-bold">Description:</label>
                    <asp:TextBox runat="server" ID="description" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter the Description" CssClass="form-control" ControlToValidate="description" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <div class="row">
                        <!-- Event Start Date -->
                        <div class="form-group col-md-5">
                            <label for="event_start_date" class="fw-bold">Event Start Date:</label>
                            <asp:TextBox runat="server" ID="E_Sdate" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:CompareValidator runat="server" ID="E_SdateValidator" ControlToValidate="E_Sdate"
                                Operator="GreaterThanEqual" Type="Date" ErrorMessage=" select upcoming date."
                                Display="Dynamic" SetFocusOnError="True" ForeColor="Red"  ValidationGroup="s" />
                        </div>

                        <!-- Event Start Time -->
                        <div class="form-group col-md-5 ms-3">
                            <label for="start_datetime" class="fw-bold">Event Start Time:</label>
                            <asp:TextBox runat="server" ID="E_Stime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                 <%--<asp:CustomValidator runat="server" ID="E_StimeValidator" ControlToValidate="E_Stime"
                ErrorMessage="Please select a valid or upcoming time." OnServerValidate="E_StimeValidator_ServerValidate"
                Display="Dynamic" SetFocusOnError="True" CssClass="form-control"/>
                </div>--%>
                        </div>
                    </div>

                    <div class="form-group col-md-12 mt-3 ">
                        <div class="row">
                            <!-- Event End Date -->
                            <div class="form-group col-md-5">
                                <label for="event_end_date" class="fw-bold">Event End Date:</label>
                                <asp:TextBox runat="server" ID="E_Edate" CssClass="form-control" type="date"></asp:TextBox>
                                <asp:CompareValidator runat="server" ID="E_EdateValidator" ControlToValidate="E_Edate"
                                    Operator="GreaterThanEqual" Type="Date" ErrorMessage="select upcoming date."
                                    Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="s" />
                            </div>

                            <!-- Event End Time -->
                            <div class="form-group col-md-5 ms-3">
                                <label for="end_datetime" class="fw-bold">Event End Time:</label>
                                <asp:TextBox runat="server" ID="E_Etime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                           <%--<asp:CustomValidator runat="server" ID="E_EtimeValidator" ControlToValidate="E_Etime"
                          ErrorMessage="Please select a valid time." OnServerValidate="E_EtimeValidator_ServerValidate"
                          Display="Dynamic" SetFocusOnError="True" ForeColor="Red" Font-Bold="True" CssClass="form-control"/>
                          </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                <!-- Right Column -->
                <div class="col-md-6">
                    <div class="form-group col-md-10 mt-3 ms-3">
                        <label for="venue" class="fw-bold">Event Venue:</label>
                        <asp:TextBox runat="server" ID="venue" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="s" ErrorMessage="Please Enter the Venue Location" CssClass="form-control" ControlToValidate="venue"  SetFocusOnError="True" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-6 mt-3 ms-3">
                        <label for="S_Room" class="fw-bold">Room:</label>
                        <asp:DropDownList ID="S_Room" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select--" Value="" Selected="True" CssClass="d-none"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6 mt-3 ms-3">
                        <label for="S_Sponcer" class="fw-bold">Sponsor:</label>
                        <asp:DropDownList ID="S_Sponcer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select--" Value="" Selected="True" CssClass="d-none"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6 mt-3 ms-3">
                        <label for="S_Organizer" class="fw-bold">Organizer:</label>
                        <asp:DropDownList ID="S_Organizer" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select--" Value="" Selected="True" CssClass="d-none"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
        </div>
    </section>




    <div class="container text-center">
        <div class="d-inline">
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary mt-3 mb-3 btnc"  ValidationGroup="s" Text="Save"  OnClientClick="if(Page_ClientValidate()) { Sevent(); }" OnClick="btnSave_Click" />
            <asp:Button ID="btnUpdate" runat="server"  CssClass="btn btn-primary mt-3 mb-3 btnc" OnClick="btnUpdate_Click" ValidationGroup="s" Text="Update"/>
        </div>


        <div class="d-inline">
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary mt-3 mb-3 ms-5 btnc" OnClick="btnClear_Click" />
        </div>
    </div>
    <script src="../../Shared/js/Schedule.js"></script>

</asp:Content>
