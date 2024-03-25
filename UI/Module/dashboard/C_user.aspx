<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="C_user.aspx.cs" Inherits="Event_management.UI.Module.dash_board.C_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .pic {
            background-image: url('../../../images/download-background.jpg');
            height: 50px;
            /*width: 100%;*/
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
            padding: 6px;
        }

        .ser {
            background: url(../../../images/icons8-search-50.png) no-repeat;
            width: 60px;
            height: 50px;
            display: inline-block;
        }

            .ser::before {
                content: url(../../../images/icons8-search-50.png);
                width: 20px;
                height: 20px;
                display: inline-block;
            }
           .btnc {
            background-color: #1E50CD;
            color: white;
           }


        .picbtn {
            background-image: url('../../../images/download-background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
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
 
      .yes
        {
            display: none;
            visibility: hidden;
        }
    
      #confirm button {
         background-color: #FFFFFF;
         display: inline-block;
         border-radius: 12px;
         border: 4px solid #aaa;
         padding: 5px;
         text-align: center;
         width: 60px;
         cursor: pointer;
      }
      #confirm .message 
      {
         text-align: left;
      }

  
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="fw-bolder text-center mt-2 text-bg-white pic" runat="server" id="USERID">Create User</h2>


            </div>
        </div>
        <div class="col-md-12 text-end">
            <a href="Dashboard.aspx" class="btn btn-secondary picbtn">Dashboard</a>
            <a href="User.aspx" class="btn btn-secondary picbtn">List user</a>
        </div>
    </div>
    
    <asp:Panel ID="confirm" CssClass="popup" runat="server" ValidateRequestMode="Enabled">
        <div class="message">User Registered Successfully.</div>
        <div class="text-end mt-3">
            <asp:HyperLink ID="lnkOK" runat="server" NavigateUrl="User.aspx" CssClass="btn btn-secondary btnc">OK</asp:HyperLink>
        </div>
    </asp:Panel>

    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        User Updated Successfully!
            <div class="text-end">
                <asp:HyperLink ID="okLink" NavigateUrl="User.aspx" CssClass="btn btn-secondary picbtn" runat="server">OK</asp:HyperLink>
            </div>
    </asp:Panel>

    <div class="container text-center mb-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <label for="name" class="float-start fw-bold">Name:</label>
                    <asp:TextBox ID="name" runat="server" CssClass="form-control d-inline ms-2" placeholder="Enter Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNameValidator" runat="server" ControlToValidate="name" Font-Bold="true" ErrorMessage="Please enter your name" CssClass=" form-control float-start ms-2 text-start" Display="Dynamic" SetFocusOnError="true" ForeColor="Red" ValidationGroup="u"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group mb-3">
                    <label for="email" class="float-start fw-bold">Email:</label>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control d-inline ms-2" placeholder="Enter Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatormail" runat="server" CssClass="form-control float-start ms-2 text-start" ControlToValidate="email" ErrorMessage="Please enter a valid email address" Display="Dynamic" ForeColor="Red" SetFocusError="true" Font-Bold="true" ValidationGroup="u"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"  CssClass="form-control float-start ms-2 text-start" ControlToValidate="email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ErrorMessage="Please enter a valid email address" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" Font-Bold="true" ValidationGroup="o"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group mb-3">
                    <label for="pwd" class="float-start float-left fw-bold">Password:</label>
                    <asp:TextBox ID="pwd" runat="server" CssClass="form-control d-inline ms-2" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorppwd" runat="server" CssClass="form-control float-start ms-2 text-start" ErrorMessage="Enter Your Password" Display="Dynamic" ControlToValidate="pwd" ForeColor="Red" SetFocusOnError="true" Font-Bold="true" ValidationGroup="u"></asp:RequiredFieldValidator>


                </div>
                <div class="form-group mb-3">
                    <label for="Conpwd" class="float-start fw-bold">Confirm Password:</label>
                    <asp:TextBox ID="Conpwd" runat="server" CssClass="form-control d-inline ms-2" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorpwd" runat="server" CssClass="form-control float-start ms-2 text-start" ErrorMessage="Enter Your Password" Display="Dynamic" ControlToValidate="Conpwd" ForeColor="Red" SetFocusOnError="true" Font-Bold="true" ValidationGroup="u"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Conpwd" ControlToCompare="pwd" Font-Bold="true" CssClass="form-control float-start ms-2 text-start" ForeColor="Red" ErrorMessage="Passwords do not match." Display="Dynamic" ValidationGroup="u"></asp:CompareValidator>
                </div>
                <div class="form-group mb-3">
                    <label class="float-start fw-bold">Phone</label>
                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorphone" runat="server" ErrorMessage="Please enter a valid Indian phone number"  CssClass="form-control float-start text-start" Display="Dynamic" ControlToValidate="phone" ForeColor="Red" SetFocusOnError="true" Font-Bold="true" ValidationGroup="u"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" CssClass="form-control float-start text-start" ControlToValidate="phone" ValidationExpression="^[6-9]\d{9}$" ErrorMessage="Please enter a valid Indian phone number" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" Font-Bold="true" ValidationGroup="u"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group mb-3">
                    <label class="float-start fw-bold" id="lblcreatedate" runat="server">Create Date:</label>
                    <asp:TextBox runat="server" ID="CreateDate" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                <div class="form-group mb-3">
                    <label runat="server" id="lblcreatedby" class="float-start fw-bold">Created By:</label>
                    <asp:TextBox ID="Createdby" runat="server" CssClass="form-control d-inline ms-2" placeholder="Creator Name"></asp:TextBox>
                </div>
                <div class="form-group mb-3">
                    <asp:Label ID="Person_type" runat="server" CssClass="float-start fw-bold" Text="Person Type"></asp:Label>
                    <asp:DropDownList runat="server" ID="Persontype" CssClass="form-control">
                        <asp:ListItem Index="0" Value="" Text="--Select--" style="display: none;" />
                        <asp:ListItem Index="1" Value="Admin" Text="Admin" />
                        <asp:ListItem Index="2" Value="User" Text="User" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="form-control float-start text-start" ControlToValidate="Persontype" InitialValue="" ErrorMessage="Please select a Person Type" ForeColor="Red" SetFocusOnError="true" Display="Static" Font-Bold="true" ValidationGroup="u"/></asp:RequiredFieldValidator>
                </div>
                <div class="form-group mb-3">
                    <asp:Label ID="LblpersonType" runat="server" CssClass="fw-bold" Text="Person Status" AssociatedControlID="rbActive" /><br/>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <asp:RadioButton ID="rbActive" runat="server" Text="Active" CssClass="btn btn-secondary text-white fw-bold" GroupName="options" Checked="True" />
                        <asp:RadioButton ID="rbInactive" runat="server" Text="Inactive" CssClass="btn btn-secondary text-white fw-bold" GroupName="options" />
                    </div>
                </div>
                <div class="form-group mb-3">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary me-2 picbtn" ValidationGroup="u" OnClientClick="if(Page_ClientValidate()) { Saveregisterpeople(); }"  OnClick="btnSave_Click1" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary picbtn" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary picbtn" OnClick="btnCancel_Click" />
                </div>
            </div>
        </div>
    </div>
   

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../../Shared/js/UserManagement.js"></script>
</asp:Content>


