<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="create_sponcers.aspx.cs" Inherits="Event_management.UI.Module.dashboard.All_sponcers" %>
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

        <div class="container mt-3 ">
            <div class="row">
                <div class="col d-inline text-end">
                    <a href="Dashboard.aspx" class="btn btn-secondary  float-end ms-3 btnc ">Dashboard</a>
                    <a href="Sponcer1.aspx" class="btn btn-secondary float-end ms-3  btnc">Sponcer List</a>
                </div>
            </div>
        </div>
  
    
    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="Head" >Create Sponsor</h2>
    </div>
   <asp:Panel ID="confirm" CssClass="popup" runat="server">
    <div class="message">Sponsor Registered Successfully.</div>
    <div class="text-end mt-3">
        <asp:HyperLink ID="lnkOK" runat="server" NavigateUrl="sponcer1.aspx" CssClass="btn btn-secondary btnc">OK</asp:HyperLink>
    </div>
</asp:Panel>

    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        Sponsor Updated Successfully!
       <div class="text-end">
           <asp:HyperLink ID="okLink" NavigateUrl="sponcer1.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
       </div>
    </asp:Panel>

<%--    <div id="updateSuccessPanel" class="updatesuccess">
    Sponsor Updated Successfully!
    <div class="text-end">
        <a href="sponcer1.aspx" class="btn btn-secondary btnc">OK</a>
    </div>
</div>--%>



    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group col-md-8 ms-5 mt-3">
                        <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="First_name" CssClass="fw-bold">First Name:</asp:Label>
                        <asp:TextBox ID="First_name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter The First Name" ForeColor="Red" Display="Dynamic" ControlToValidate="First_Name" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[A-Za-z\s]{0,25}$"  Display="Dynamic" ControlToValidate="First_Name" ValidationGroup="o"></asp:RegularExpressionValidator>


                    </div>
                    <div class="form-group col-md-8 ms-5 mt-3">
                        <asp:Label ID="lblLastName" runat="server" AssociatedControlID="Last_name" CssClass="fw-bold">Last Name:</asp:Label>
                        <asp:TextBox ID="Last_name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter The Last Name" ForeColor="Red" Display="Dynamic" ControlToValidate="Last_name" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red"  Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[A-Za-z\s]{0,25}$" ControlToValidate="Last_name" ValidationGroup="o"></asp:RegularExpressionValidator>


                    </div>
                    <div class="form-group col-md-8 ms-5 mt-3">
                        <asp:Label ID="lblDescription" runat="server" AssociatedControlID="description" CssClass="fw-bold">Description:</asp:Label>
                        <asp:TextBox ID="description" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter The Description" ForeColor="Red" Display="Dynamic" ControlToValidate="description" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group col-md-8 ms-5 mt-3 mb-5">
                        <asp:Label ID="lblWebsite" runat="server" AssociatedControlID="website" CssClass="fw-bold">Website:</asp:Label>
                        <asp:TextBox ID="website" runat="server" CssClass="form-control" TextMode="Url"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter The website" ForeColor="Red" Display="Dynamic" ControlToValidate="website" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegexValidatorWebsite" runat="server" ControlToValidate="website" SetFocusOnError="true" ErrorMessage="Please enter a valid website URL" ValidationExpression="^(https?://)?([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$" ForeColor="Red" ValidationGroup="o"></asp:RegularExpressionValidator>--%>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group col-md-8 ms-5 mt-3">
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="email" CssClass="fw-bold">Email:</asp:Label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                            ControlToValidate="email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"
                            ErrorMessage="Please enter a valid email address" 
                            SetFocusOnError="true" ForeColor="Red" Display="Dynamic"  ValidationGroup="o">
                        </asp:RegularExpressionValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator68" runat="server" ErrorMessage="Please Enter The website" ForeColor="Red" Display="Dynamic" ControlToValidate="email" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group col-md-8 ms-5 mt-3">
                        <asp:Label ID="lblPhone" runat="server" AssociatedControlID="phone" CssClass="fw-bold">Phone:</asp:Label>
                        <asp:TextBox ID="phone" runat="server" CssClass="form-control"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"
                            ControlToValidate="phone" ValidationExpression="^[6-9]\d{9}$"
                            ErrorMessage="Please enter a valid Indian phone number" ForeColor="Red"
                            CssClass="text-danger" SetFocusOnError="true" Display="Dynamic"  ValidationGroup="o">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator88" runat="server" ErrorMessage="Please Enter The website" ForeColor="Red" Display="Dynamic" ControlToValidate="phone" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>

                        </asp:RegularExpressionValidator>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="phone" ErrorMessage="Please enter a phone number"
                            ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-8 ms-5 mt-2">
                        <asp:Label ID="lblLogo" runat="server" AssociatedControlID="logo" CssClass="fw-bold">Logo:</asp:Label>
                        <asp:FileUpload ID="logo" runat="server" CssClass="form-control" />
                        <div class="form-control">
                            <asp:Literal ID="logo_Image_literal" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 d-flex justify-content-center w-100">
                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-info mb-3 btnc" ValidationGroup="o"  OnClientClick="if(Page_ClientValidate()) { Sponcer(); }" OnClick="btnsave_Click" />
                <asp:Button ID="btnupdate" runat="server"  Text="Update" OnClick="btnupdate_Click" CssClass="btn btn-info mb-3 btnc" />
                <asp:Button ID="btnclear" runat="server" Text="Clear" OnClick="btnclear_Click" CssClass="btn btn-info mb-3 btnc" />

            </div>
        </div>
    </div>

<%--    <script src="../../Shared/js/sponcer.js"></script>--%>
    <script src="../../Shared/js/createsponsor.js"></script>

</asp:Content>





