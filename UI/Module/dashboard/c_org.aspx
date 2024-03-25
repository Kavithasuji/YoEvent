    <%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="c_org.aspx.cs" Inherits="Event_management.UI.Module.dashboard.c_org" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        .DBtn {
            background-color: #1E50CD;
            color: white;
            float: right
        }

            .DBtn:hover {
                background-color: #1B26A8;
                color: white;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row w-100">
            <div class="col-md-12">
                <div class="fw-bolder">
                    <a href="Dashboard.aspx" class="btn btn-info DBtn">Dashboard</a>
                    <a href="organizerList.aspx" class="btn btn-info DBtn">Organizer List</a>
                </div>
            </div>
        </div>
    </div>

    <div class=" container mt-5">
        <h2 class=" fw-bold text-center pic" id="Head" runat="server">Create</h2>
    </div>

    <asp:Panel ID="confirm" CssClass="popup" runat="server">
        <div class="message">Organizer Registered Successfully.</div>
        <div class="text-end mt-3">
            <asp:HyperLink ID="lnkOK" runat="server" NavigateUrl="organizerList.aspx" CssClass="btn btn-secondary btnc">OK</asp:HyperLink>
        </div>
    </asp:Panel>

    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        Organizer Updated Successfully!
          <div class="text-end">
              <asp:HyperLink ID="okLink" NavigateUrl="organizerList.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
          </div>
    </asp:Panel>


    <section class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="first_name" class="fw-bold">First Name:</label>
                    <input type="text" id="First_Name" runat="server" class="form-control" >
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter The First Name" ForeColor="Red" Display="Dynamic" ControlToValidate="First_Name" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" ValidationExpression="^[A-Za-z\s]{0,25}$" ControlToValidate="First_Name" ValidationGroup="o"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-md-8 ms-5  mt-3">
                    <label class="fw-bold">Last Name:</label>
                    <input type="text" id="Last_Name" runat="server" class="form-control"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter The Last Name" ForeColor="Red" ControlToValidate="Last_Name" Display="Dynamic" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" ValidationExpression="^[A-Za-z\s]{0,25}$" ControlToValidate="Last_Name" ValidationGroup="o"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3 mb-3">
                    <label class="fw-bold">Organizer Type:</label>
                    <select class="form-control" runat="server" id="Organizer_Type" >
                        <option class="d-none" value="">--select--</option>
                        <option value="Individual">Individual</option>
                        <option value="Organization">Organization</option>
                    </select>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="Organizer_Type" InitialValue=""
                        ErrorMessage="Please select an Organizer Type" ForeColor="Red"
                        SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group col-md-8 ms-5 mt-3 ">
                    <label for="Email" class="fw-bold">Email:</label>
                    <input type="text" runat="server" id="Email" name="email" class="form-control" >
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                        ControlToValidate="Email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"
                        ErrorMessage="Please enter a valid email address"
                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic"  ValidationGroup="o">
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter The Email" ForeColor="Red" ControlToValidate="Email" Display="Dynamic" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label for="phone " class="fw-bold">Phone:</label>
                    <input type="tel" runat="server" id="Phone" name="phone" class="form-control" >
                    <asp:RegularExpressionValidator
                        ID="RegularExpressionValidatorPhone" runat="server"
                        ControlToValidate="Phone" ValidationExpression="^[6-9]\d{9}$"
                        ErrorMessage="Please enter a valid Indian phone number" ForeColor="Red"
                        CssClass="text-danger" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                    </asp:RegularExpressionValidator>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="Phone" ErrorMessage="Please enter a phone number"
                        ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                    </asp:RequiredFieldValidator>
                </div>
                <div class="form-group col-md-8 ms-5 mt-3">
                    <label class="fw-bold">Organizer Image:</label>
                    <asp:FileUpload ID="Org_Image" runat="server" CssClass="form-control" />
                    <div class="form-control">
                        <asp:Literal ID="Org_Image_literal" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="col-md-12 mt-3 text-center">
        <asp:Button ID="btnsave" CssClass="btn btn-info mb-3 btnc" runat="server" Text="Save" ValidationGroup="o" OnClientClick="if(Page_ClientValidate()) { org(); }" OnClick="btnsave_Click" />
        <asp:Button ID="btnupdate" CssClass="btn btn-info mb-3 btnc" runat="server" Text="Save" OnClick="btnupdate_Click" />
        <asp:Button ID="Button1" CssClass="btn btn-info mb-3 btnc" runat="server" Text="Clear" OnClick="btnclear_Click" />

    </div>

    <script src="../../../Scripts/jquery-3.7.1.js"></script>
    <script src="../../Shared/js/c_org.js"></script>

</asp:Content>
