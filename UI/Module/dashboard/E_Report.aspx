<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="E_Report.aspx.cs" Inherits="Event_management.UI.Module.dashboard.Report" %>
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
    </style>

    
    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
        <h6 runat="server" id="Head"> sucess</h6> 
       <div class="text-end">
           <asp:HyperLink ID="okLink" NavigateUrl="E_Report.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
       </div>
    </asp:Panel>
    
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary me-3 btnc" id="btnc">Dashboard</a>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic" id="pic">Report</h2>
    </div>

    <div class="container text-center mb-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-group mb-3">
                    <asp:Label ID="Label1" runat="server" Text="Event Name:" CssClass="float-start fw-bold"></asp:Label>
                    <asp:TextBox ID="event_name" runat="server" placeholder="Enter Event Name" CssClass="form-control" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter The Event  Name" ForeColor="Red" Display="Dynamic" ControlToValidate="event_name" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>

                </div>
                <div class="form-group mb-3">
                    <asp:Label ID="Label2" runat="server" Text="User Name:" CssClass="float-start fw-bold"></asp:Label>
                    <asp:TextBox ID="User_name" runat="server" placeholder="User Name" CssClass="form-control" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter The Your Name" ForeColor="Red" Display="Dynamic" ControlToValidate="User_name" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" SetFocusOnError="true" ValidationExpression="^[A-Za-z\s]{0,25}$" Display="Dynamic" ControlToValidate="User_name" ValidationGroup="o"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group mb-3">
                    <asp:Label ID="Label3" runat="server" Text="Report Description:" CssClass="float-start fw-bold"></asp:Label>
                    <asp:TextBox ID="description" runat="server" placeholder="Event Description" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter The Event  Name" ForeColor="Red" Display="Dynamic" ControlToValidate="description" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>


                </div>
                <div class="form-group mb-3">
                    <asp:Button ID="Button1" runat="server" Text="Report" CssClass="btn btn-primary me-2  btnc" ValidationGroup="o"  OnClientClick="if(Page_ClientValidate()) { report(); }"  OnClick="Button1_Click" />

                </div>
            </div>
        </div>
    </div>

    <script src="../../Shared/js/Report.js"></script>
</asp:Content>
