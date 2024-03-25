<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="C_Event.aspx.cs" Inherits="Event_management.UI.Module.dash_board.Event" %>

<%--//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT --%>

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
        .btnc{
            background-color:#1E50CD;
            color: white; 
        }
       .btnc:hover{
            background-color:#1B26A8;
        }
                    
       #<%= confirm.ClientID %> {
       height: 130px;
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
       z-index: 9999; /* Ensure the confirmation message is above other content */
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
    </style>

    
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary me-3 btnc">Dashboard</a>
                <a href="EventList.aspx" class="btn btn-secondary btnc">Events</a>
            </div>
        </div>
    </div>


    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="pic">Create Event</h2>
    </div>
    <asp:Panel ID="confirm" CssClass="popup" runat="server">
        <div class="message">Event Registered Successfully.</div>
        <div class="text-end mt-3">
            <asp:HyperLink ID="lnkOK" runat="server" NavigateUrl="EventList.aspx" CssClass="btn btn-secondary btnc">OK</asp:HyperLink>
        </div>
    </asp:Panel>

    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        Event Updated Successfully!
    <div class="text-end">
                   <asp:HyperLink ID="okLink" NavigateUrl="EventList.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>


    </div>
    </asp:Panel>


    <section class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="event_name" class="fw-bold">Event Name:</label>
                    <asp:TextBox runat="server" ID="event_name" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ControlToValidate="event_name"  ErrorMessage="Please enter enent name" CssClass=" form-control float-start  text-start" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>
<%--                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage=" Event Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" ValidationExpression="^[A-Za-z\s]{0,25}$" ControlToValidate="event_name" ValidationGroup="k"></asp:RegularExpressionValidator>--%>

                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="description" class="fw-bold">Description:</label>
                    <asp:TextBox runat="server" ID="description" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass=" form-control float-start  text-start" ErrorMessage="Please Enter The Description" ForeColor="Red" Display="Dynamic" ControlToValidate="description" SetFocusOnError="true"  ValidationGroup="k"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label for="event_end_date" class="fw-bold">Event Start Date:</label>
                            <asp:TextBox runat="server" ID="E_Sdate" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="StartRequiredValidator" runat="server" ControlToValidate="E_Sdate" ErrorMessage="Enter a start date" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="E_Sdate" Type="Date" Operator="GreaterThanEqual" ErrorMessage="Event End Date should be today or a future date" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k" ValueToCompare='<%# DateTime.Today.ToString("yyyy-MM-dd") %>'></asp:CompareValidator>


                        </div>
                        <div class="form-group col-md-5 ms-3">
                            <label for="end_datetime" class="fw-bold">Event Start Time:</label>
                            <asp:TextBox runat="server" ID="E_Stime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="StartTimeRequiredValidator" runat="server" ControlToValidate="E_Stime" ErrorMessage="Enter a start time" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <div class="row">
                        <div class="form-group col-md-5">
                            <label for="event_end_date" class="fw-bold">Event End Date:</label>
                            <asp:TextBox runat="server" ID="E_Edate" CssClass="form-control" type="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EndRequiredValidator" runat="server" ControlToValidate="E_Edate" ErrorMessage="Eter an end date" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="EndDateCompareValidator" runat="server" ControlToValidate="E_Edate" Type="Date" Operator="GreaterThanEqual" ErrorMessage="Event End Date should be today or a future date" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k" ValueToCompare='<%# DateTime.Today.ToString("yyyy-MM-dd") %>'></asp:CompareValidator>

                        </div>
                        <div class="form-group col-md-5 ms-3">
                            <label for="end_datetime" class="fw-bold">Event End Time:</label>
                            <asp:TextBox runat="server" ID="E_Etime" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EndTimeRequiredValidator" runat="server" ControlToValidate="E_Etime" ErrorMessage="Enter an end time" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="venue" class="fw-bold">Event Venue:</label>
                    <asp:TextBox runat="server" ID="venue" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorvenu" runat="server" ControlToValidate="venue" ErrorMessage="Please enter venue" CssClass=" form-control float-start m text-start" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>


                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="location_link" class="fw-bold">Location Link:</label>
                    <asp:TextBox runat="server" ID="location_link" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="LocationLinkValidator" runat="server" ControlToValidate="location_link" CssClass=" form-control float-start  text-start"
                        ValidationExpression="^(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*/?$"
                        ErrorMessage="Please enter a valid URL" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLocation" runat="server" ControlToValidate="location_link" CssClass=" form-control float-start  text-start" 
                        ErrorMessage="Location Link is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>

                </div>
                <!-- Other form elements... -->
            </div>

            <div class="col-md-6">
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="Event_Type" class="fw-bold">Event Type:</label>
                    <asp:DropDownList runat="server" ID="Event_Type" CssClass="form-control">
                        <asp:ListItem Index="0" Value="" Text="--Select--" style="display: none;" />
                        <asp:ListItem Index="1" Value="Seminar" Text="Seminar" />
                        <asp:ListItem Index="2" Value="Conference" Text="Conference" />
                        <asp:ListItem Index="3" Value="Training" Text="Training" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Event_Type" CssClass=" form-control float-start  text-start" 
                        ErrorMessage="Event Type is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-10 mt-3 ms-3">
                    <label for="Event_Mode" class="fw-bold">Event Mode:</label>
                    <asp:DropDownList runat="server" ID="Event_Mode" CssClass="form-control">
                        <asp:ListItem Value="" Text="--Select--" style="display: none;" />
                        <asp:ListItem Value="Onsite" Text="Onsite" />
                        <asp:ListItem Value="Hybrid" Text="Hybrid" />
                        <asp:ListItem Value="Virtual" Text="Virtual" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="EventModeRequiredValidator" runat="server" ControlToValidate="Event_Mode" CssClass=" form-control float-start  text-start"
                        ErrorMessage="Event Mode is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>


                </div>
                <div class="form-group col-md-10 mt-3 ms-3 ">
                    <label for="seating_capacity" class="fw-bold">Seating Capacity:</label>
                    <asp:TextBox runat="server" ID="seating_capacity" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="seating_capacity" CssClass=" form-control float-start  text-start"
                        ErrorMessage="Seat Capacity  is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>


                </div>
                <div class="form-group col-md-10 mt-3 ms-3 ">
                    <label for="registration_link" class="fw-bold">Registration Link:</label>
                    <asp:TextBox runat="server" ID="registration_link" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="registration_link" CssClass=" form-control float-start  text-start"
                        ValidationExpression="^(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*/?$"
                        ErrorMessage="Please enter a valid URL" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="registration_link" CssClass=" form-control float-start  text-start" 
                        ErrorMessage="Registration Link is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-10 mt-3 ms-3 ">
                    <label for="banner_image" class="fw-bold">Banner Image:</label>
                    <asp:FileUpload runat="server" ID="banner_image" CssClass="form-control" />
                   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9u" runat="server" ControlToValidate="banner_image" CssClass=" form-control float-start  text-start" Font-Bold="true"
                        ErrorMessage="Banner Image is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>--%>
                    <div class="form-control">
                        <asp:Literal ID="banner_image_literal" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="form-group col-md-10 mt-3 ms-3 ">
                    <label for="event_icon" class="fw-bold">Event Icon:</label>
                    <asp:FileUpload runat="server" ID="event_icon" CssClass="form-control" />
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator65" runat="server" ControlToValidate="event_icon" CssClass=" form-control float-start  text-start" Font-Bold="true"
                        ErrorMessage="Event Icon is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>--%>
                    <div class="form-control">
                        <asp:Literal ID="event_icon_Literal" runat="server"></asp:Literal>
                    </div>
                </div>
                <!-- Move the Floor Map section to the end -->
                <div class="form-group col-md-10 mt-3 ms-3 ">
                    <label for="floor_map" class="fw-bold">Floor Map:</label>
                    <asp:FileUpload runat="server" ID="floor_map" CssClass="form-control" />
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator72" runat="server" ControlToValidate="floor_map" CssClass=" form-control float-start  text-start" Font-Bold="true"
                        ErrorMessage="Map is required" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="k">
                    </asp:RequiredFieldValidator>--%>

                    <div class="form-control">
                        <asp:Literal ID="floor_map_Literal" runat="server"></asp:Literal>
                    </div>
                </div>
                <!-- Other form elements... -->
            </div>

        </div>
    </section>

      

    <div class="container text-center">
        <div class="d-inline">
            <asp:Button ID="btnSave"  runat="server" CssClass="btn btn-primary mt-3 mb-3 btnc" Text="Submit" ValidationGroup="k" OnClientClick="Cevent();" OnClick="btnSave_Click"  />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary mt-3 mb-3 btnc"  ValidationGroup="k" OnClick="btnCreateEvent_Click"  />
        </div>


        <div class="d-inline">
            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary mt-3 mb-3 ms-5 btnc" OnClick="btnClear_Click"  />
        </div>
    </div>
    
    <script src="../../../js/jquery.min.js"></script>
    <script src="../../../js/script.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/popper.js"></script>
    <script src="../../Shared/js/C_Event.js"></script>
   
  
</asp:Content>    
