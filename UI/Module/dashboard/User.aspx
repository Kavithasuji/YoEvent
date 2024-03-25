<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Event_management.UI.Module.dash_board.User" %>
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
         .btnc {
     background-color: #1E50CD;
     color: white;
 }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="fw-bold text-center mb-2 pic">User List</h1>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Find Event"></asp:TextBox>
                    <asp:ImageButton ID="Button1" runat="server" ImageUrl="../../../images/icons8-search-25.png" CssClass="btn btn-primary rounded-end picbtn"  OnClick="Button1_Click" ViewStateMode="Enabled" />
                </div>
            </div>
            <div class="col-md-8 mb-3 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary picbtn">Dashboard</a>
                 <a href="C_user.aspx" id="btncreateuser" runat="server" class="btn btn-secondary picbtn">Add user</a>
            </div>
        </div>
    </div>

    <div class="container">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="User_Id" DataSourceID="SqlDataSource1" CssClass="table  table-Borderd  table-striped mb-5" OnRowEditing="GridView1_RowEditing"  OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
        <Columns>
            <asp:TemplateField HeaderText="S.NO">
                <ItemTemplate>
                    <asp:Label ID="Sno" Text='<%# Container.DataItemIndex+1 %>' CssClass="form_label" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="User_Id" HeaderText="User_Id" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="User_Id"></asp:BoundField>
            <asp:BoundField DataField="User_Name" HeaderText="User_Name" SortExpression="User_Name"></asp:BoundField>
            <asp:BoundField DataField="User_Type" HeaderText="User_Type" SortExpression="User_Type"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Person_type" HeaderText="Person_type" SortExpression="Person_type"></asp:BoundField>
            <asp:BoundField DataField="Per_status" HeaderText="Per_status" SortExpression="Per_status"></asp:BoundField>



   


            <asp:TemplateField HeaderText="Actions">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info btnc" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#DEDFDE" ForeColor="Black"></RowStyle>

        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#594B9C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#33276A"></SortedDescendingHeaderStyle>
    </asp:GridView>
        </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:EventManagementConnectionString5 %>' DeleteCommand="DELETE FROM [User_Mgt] WHERE [User_Id] = @User_Id" InsertCommand="INSERT INTO [User_Mgt] ([User_Name], [User_Type], [Email], [Person_type], [Per_status]) VALUES (@User_Name, @User_Type, @Email, @Person_type, @Per_status)" ProviderName='<%$ ConnectionStrings:EventManagementConnectionString5.ProviderName %>' SelectCommand="SELECT [User_Id], [User_Name], [User_Type], [Email], [Person_type], [Per_status] FROM [User_Mgt] ORDER BY [User_Id] DESC" UpdateCommand="UPDATE [User_Mgt] SET [User_Name] = @User_Name, [User_Type] = @User_Type, [Email] = @Email, [Person_type] = @Person_type, [Per_status] = @Per_status WHERE [User_Id] = @User_Id">
        <DeleteParameters>
            <asp:Parameter Name="User_Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="User_Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Person_type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Per_status" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="User_Type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Person_type" Type="String"></asp:Parameter>
            <asp:Parameter Name="Per_status" Type="String"></asp:Parameter>
            <asp:Parameter Name="User_Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

