<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="Event_management.UI.Module.dashboard.EventList" %>
<%@ Register assembly="Microsoft.AspNet.EntityDataSource" namespace="Microsoft.AspNet.EntityDataSource" tagprefix="ef" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        #pic {
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

        #grid {
            margin-top: 30px;
            margin-bottom: 30px;
            border: 2px solid #000000;
            border-radius: 5px;
            padding: 20px;
            font-size: 20px;
            font-weight: bold;
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

        .picbtn {
            background-image: url('../../../images/download-background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: white
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

.description {
    text-align: center;
    max-width: 400px;
    overflow-wrap: break-word;
}
.venue {
    text-align: center;
    max-width: 200px;
    overflow-wrap: break-word;
}


    </style>

 <%-- <script src="../../../js/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
    <script src="../../Shared/js/Kendo/kendo.all.min.js"></script>
    <link href="../../Shared/CSS/Kendo/kendo.common.min.css" rel="stylesheet" />
    <link href="../../Shared/CSS/Kendo/kendo.default.min.css" rel="stylesheet" />


    <script src="../../Shared/js/Grid_EventList.js"></script>

    <div class="container mt-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white" id="pic">Event List</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Find Event"></asp:TextBox>
                    <asp:ImageButton ID="Button1" runat="server" ImageUrl="../../../images/icons8-search-25.png" CssClass="btn btn-primary rounded-end picbtn" OnClick="Button1_Click" ViewStateMode="Enabled" />
                </div>
            </div>
            <div class="col-md-8 mb-3 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary btnc">Dashboard</a>
                <a href="C_Event.aspx" class="btn btn-secondary btnc">Add Event</a>
            </div>
        </div>
    </div>

    <div class="container">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="E_Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowEditing="GridView2_RowEditing" CssClass="container table-bordered table-striped mb-5" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AllowSorting="True">
            <Columns>
            </Columns>

            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle CssClass="text-center" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="E_Id" HeaderText="Id" InsertVisible="False" Visible="false" ItemStyle-CssClass="text-center" ReadOnly="True" SortExpression="E_Id">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="E_Name" HeaderText="Event Name" ItemStyle-CssClass="text-center" SortExpression="E_Name">
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:BoundField>

                 <asp:BoundField DataField="E_Description" HeaderText="Description" 
                               ItemStyle-CssClass="description" SortExpression="E_Description">
                    <ItemStyle Wrap="True" CssClass="description" Width="700px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="E_Sdate" HeaderText="Start Date" SortExpression="E_Sdate" DataFormatString="{0:dd/MM/yyyy}">
                    <ItemStyle CssClass="text-center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="E_Edate" HeaderText="End Date" SortExpression="E_Edate" DataFormatString="{0:dd/MM/yyyy}">
                    <ItemStyle CssClass="text-center" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="E_Venue" HeaderText="Venue" ItemStyle-CssClass="text-center" SortExpression="E_Venue">
                    <ItemStyle CssClass="venue"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="View" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBtnView" runat="server" OnClick="lnkBtnView_Click" CssClass="text-center">
                             <img src="../../../images/view.png" />
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btnc" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info btnc" CommandName="DeleteRow" CommandArgument='<%# Eval("E_Id") %>' OnClick="btnDelete_Click1" />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
    </div>
        <asp:Panel ID="confirm" runat="server" CssClass="popup">
            <div class="message">Do You Want To Delete This?</div>
            <div class="text-end mt-3">
                <asp:Button ID="Button4" runat="server" CssClass="btn btn-secondary btnc" Text="Yes" OnClick="popyes_Click1" />
                <asp:Button ID="Button5" runat="server" CssClass="btn btn-secondary btnc" Text="No" OnClientClick="closeConfirm();" />
            </div>
        </asp:Panel>

  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"  ConnectionString="<%$ ConnectionStrings:EventManagementConnectionString2 %>" 
    DeleteCommand="DELETE FROM [Event_Reg] WHERE [E_Id] = @E_Id"
    InsertCommand="INSERT INTO [Event_Reg] ([E_Name], [E_Description], [E_Sdate], [E_Edate], [E_Venue]) VALUES (@E_Name, @E_Description, @E_Sdate, @E_Edate, @E_Venue)" 
    OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:EventManagementConnectionString2.ProviderName %>"
    SelectCommand="SELECT [E_Id], [E_Name], [E_Description], [E_Sdate], [E_Edate], [E_Venue] FROM [Event_Reg] ORDER BY [E_Id] DESC"
    UpdateCommand="UPDATE [Event_Reg] SET [E_Name] = @E_Name, [E_Description] = @E_Description, [E_Sdate] = @E_Sdate, [E_Edate] = @E_Edate, [E_Venue] = @E_Venue WHERE [E_Id] = @original_E_Id">
    <DeleteParameters>
        <asp:Parameter Name="E_Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="E_Name" Type="String" />
        <asp:Parameter Name="E_Description" Type="String" />
        <asp:Parameter DbType="Date" Name="E_Sdate" />
        <asp:Parameter DbType="Date" Name="E_Edate" />
        <asp:Parameter Name="E_Venue" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="E_Name" Type="String" />
        <asp:Parameter Name="E_Description" Type="String" />
        <asp:Parameter DbType="Date" Name="E_Sdate" />
        <asp:Parameter DbType="Date" Name="E_Edate" />
        <asp:Parameter Name="E_Venue" Type="String" />
        <asp:Parameter Name="original_E_Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>