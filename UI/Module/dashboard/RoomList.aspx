<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="RoomList.aspx.cs" Inherits="Event_management.UI.Module.dashboard.RoomList" %>
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
      .venue {
    text-align: center;
    max-width: 200px;
    overflow-wrap: break-word;
}
    </style>
 
    <div class="container mt-3">
        <h2 class="fw-bolder text-center text-bg-white" id="pic">Room</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-end">
                <a href="Dashboard.aspx" class="btn btn-secondary me-3 btnc" >Dashboard</a>
                <a href="Room_Count.aspx" class="btn btn-secondary btnc" >Create Room</a>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row w-100 justify-content-center">
            <div class="col-sm-12 m-3">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Room_ID" DataSourceID="SqlDataSource1" GridLines="None" CssClass="container table-bordered table-striped mb-5">
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle CssClass="text-center" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <Columns>
                        <asp:BoundField DataField="Room_ID" HeaderText="S.NO" InsertVisible="False" ReadOnly="True" SortExpression="Room_ID" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Room Name" SortExpression="Name" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Event_Venue" HeaderText="Venue" SortExpression="Event_Venue" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="venue"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Location_Link" HeaderText="Location" SortExpression="Location_Link" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="venue"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Seat" HeaderText="Seat" SortExpression="Seat" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Event_type" HeaderText="Room Type" SortExpression="Event_type" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
<%--                        <asp:CommandField ShowEditButton="True" HeaderText="Edit" ItemStyle-CssClass="text-center" />--%>
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info btnc" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-info btnc"
                                    CommandName="DeleteRow" CommandArgument='<%# Eval("Room_ID") %>' OnClick="btnDelete_Click1" />

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

                <asp:Panel ID="confirm" runat="server" CssClass="popup">
                    <div class="message">Do You Want To Delete This?</div>
                    <div class="text-end mt-3">
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-secondary btnc" Text="Yes" OnClick="popyes_Click1" />
                        <asp:Button ID="Button5" runat="server" CssClass="btn btn-secondary btnc" Text="No" OnClientClick="closeConfirm();" />
                    </div>
                </asp:Panel>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementConnectionString3 %>" DeleteCommand="DELETE FROM [C_Room] WHERE [Room_ID] = @Room_ID" InsertCommand="INSERT INTO [C_Room] ([Name], [Event_Venue], [Location_Link], [Seat], [Event_type]) VALUES (@Name, @Event_Venue, @Location_Link, @Seat, @Event_type)" ProviderName="<%$ ConnectionStrings:EventManagementConnectionString3.ProviderName %>" SelectCommand="SELECT [Room_ID], [Name], [Event_Venue], [Location_Link], [Seat], [Event_type] FROM [C_Room] ORDER BY [Room_ID] DESC" UpdateCommand="UPDATE [C_Room] SET [Name] = @Name, [Event_Venue] = @Event_Venue, [Location_Link] = @Location_Link, [Seat] = @Seat, [Event_type] = @Event_type WHERE [Room_ID] = @Room_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="Room_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Event_Venue" Type="String" />
                        <asp:Parameter Name="Location_Link" Type="String" />
                        <asp:Parameter Name="Seat" Type="Int32" />
                        <asp:Parameter Name="Event_type" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Event_Venue" Type="String" />
                        <asp:Parameter Name="Location_Link" Type="String" />
                        <asp:Parameter Name="Seat" Type="Int32" />
                        <asp:Parameter Name="Event_type" Type="String" />
                        <asp:Parameter Name="Room_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


</asp:Content>
