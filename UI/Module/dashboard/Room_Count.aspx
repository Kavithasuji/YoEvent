<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="Room_Count.aspx.cs" Inherits="Event_management.UI.Module.dashboard.Room_Count" %>
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
                <a href="RoomList.aspx" class="btn btn-secondary btnc">Room List</a>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="pic">Create Room</h2>
    </div>
       <asp:Panel ID="confirm" CssClass="popup" runat="server">
    <div class="message">Room Registered Successfully.</div>
    <div class="text-end mt-3">
        <asp:HyperLink ID="lnkOK" runat="server" NavigateUrl="RoomList.aspx" CssClass="btn btn-secondary btnc">OK</asp:HyperLink>
    </div>
</asp:Panel>
   
    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        Room Updated Successfully!
    <div class="text-end">
        <asp:HyperLink ID="okLink" NavigateUrl="RoomList.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
    </div>
    </asp:Panel>


        

    <section class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="name" class="fw-bold">Name:</label>
                    <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter The Name" ForeColor="Red" ControlToValidate="name" SetFocusOnError="true" Font-Bold="True"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="description" class="fw-bold">Description:</label>
                    <asp:TextBox ID="description" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter The Description" ForeColor="Red" ControlToValidate="description" SetFocusOnError="true" Font-Bold="True"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="venue" class="fw-bold">Venue:</label>
                    <asp:TextBox ID="venue" runat="server" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter The Venue" ForeColor="Red" ControlToValidate="venue" SetFocusOnError="true" Font-Bold="True"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="location_link" class="fw-bold">Location Link:</label>
                    <asp:TextBox ID="location_link" runat="server" CssClass="form-control" TextMode="Url"></asp:TextBox>
               <%--     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="d-block"
                        ErrorMessage="Invalid Location Link" Font-Bold="true" ForeColor="Red"
                        SetFocusOnError="true" ControlToValidate="location_link"
                        ValidationExpression="^(https?://)?(www\.)?[\w-]+\.[a-z]{2,}(\/\S*)?$">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="d-block"
                        ErrorMessage="Enter The Location Link" Font-Bold="true" ForeColor="Red"
                        SetFocusOnError="true" ControlToValidate="location_link">
                    </asp:RequiredFieldValidator>--%>
                </div>

            </div>
            <div class="col-md-6">
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="event_type" class="fw-bold">Event Type:</label>
                    <asp:DropDownList ID="event_type" runat="server" CssClass="form-control" >
                        <asp:ListItem CssClass="d-none" Text="--Select--" Value="" />
                        <asp:ListItem Text="Seminar" Value="Seminar" />
                        <asp:ListItem Text="Conference" Value="Conference" />
                        <asp:ListItem Text="Training" Value="Training" />
                        <asp:ListItem Text="Other" Value="Other" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ControlToValidate="Event_Type" InitialValue=""
                        ErrorMessage="Please select an Event Type" ForeColor="Red"
                        SetFocusOnError="true" Display="Static" Font-Bold="true">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="Equipment" class="fw-bold">Equipment available:</label>
                    <asp:TextBox ID="Equipment" runat="server" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter The Equipment Available" ForeColor="Red" ControlToValidate="Equipment" SetFocusOnError="true" Font-Bold="True"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="seating_capacity" class="fw-bold">Seating Capacity:</label>
                    <asp:TextBox ID="seating_capacity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter The Seat Count" ControlToValidate="seating_capacity" InitialValue="" ForeColor="Red"
                        SetFocusOnError="true" Display="Static" Font-Bold="true"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="Room_Img" class="fw-bold">Room Image:</label>
                    <asp:FileUpload ID="Room_Img" runat="server" CssClass="form-control" />
                    <div class="form-control">
                        <asp:Literal ID="Room_Image_literal" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container text-center">
        <div class="d-inline">
           

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary mt-3 mb-3 btnc"   OnClientClick="if(Page_ClientValidate()) { C_Room(); }" OnClick="btnsave_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Save"  CssClass="btn btn-primary mt-3 mb-3 btnc" OnClick="btnUpdate_Click" />
            </div>
        <div class="d-inline"> 
            <asp:Button ID="btnClear" CssClass="btn btn-primary mt-3 mb-3 ms-5 btnc" runat="server" Text="Clear" OnClick="btnClear_Click" />
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../../js/jquery.min.js"></script>
    <script src="../../../js/script.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../js/popper.js"></script>
    <script src="../../Shared/js/RoomCreate.js"></script>

</asp:Content>
