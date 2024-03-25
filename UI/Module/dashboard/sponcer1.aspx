<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="sponcer1.aspx.cs" Inherits="Event_management.UI.Module.dashboard.sponcer1" %>
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
        
        .btnc {
            background-color: #1E50CD;
            color: white;
        }


        .picbtn {
            background-image: url('../../../images/download-background.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color:white
        }

        .btnc {
            background-color: #1E50CD;
            color: white;
        }

            .btnc:hover {
                background-color: #1B26A8;
            }

        .highlighted-row {
            background-color: #ffff99; /* You can customize the background color */
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
    .website{
        text-align: center;
        max-width: 200px;
        overflow-wrap: break-word;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-5">
        <h2 class="fw-bolder text-center mt-2 text-bg-white pic">Sponcers</h2>
    </div>
  

    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="input-group">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Find Event"></asp:TextBox>
                    <asp:ImageButton ID="Button1" runat="server" ImageUrl="../../../images/icons8-search-25.png" CssClass="btn btn-primary rounded-end picbtn" OnClick="Button1_Click" ViewStateMode="Enabled" />
                </div>
            </div>
            <div class="col-md-8 mb-3 text-end">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Dashboard.aspx" CssClass="btn picbtn" Text="Dashboard"></asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="EventList.aspx" CssClass="btn picbtn" Text="Event List"></asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="create_sponcers.aspx" CssClass="btn picbtn" Text="Create Sponcer"></asp:HyperLink>
            </div>
        </div>
    </div>
    
 

     
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="S_Id" DataSourceID="SqlDataSource1" AllowPaging="True" AutoGenerateColumns="False" CssClass="table  table-Borderd  table-striped mb-5" OnRowEditing="GridView1_RowEditing" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" BorderColor="White" AllowSorting="True">
                    <HeaderStyle Font-Bold="true" CssClass="text-center" ForeColor="#e7e7ff" BackColor="#4a3cbc" />

                    <Columns>
                        <asp:TemplateField HeaderText="S.NO">
                            <ItemTemplate>
                                <asp:Label ID="Sno" Text='<%# Container.DataItemIndex+1 %>' CssClass="form_label" runat="server"></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="S_Id" HeaderText="Id" ReadOnly="True" Visible="false" InsertVisible="False" ItemStyle-CssClass="text-center" SortExpression="S_Id"></asp:BoundField>
                        <asp:BoundField DataField="First_name" HeaderText="First Name" ItemStyle-CssClass="text-center sponcer-name" SortExpression="First_name"></asp:BoundField>
                        <asp:BoundField DataField="Last_name" HeaderText="Last Name" ItemStyle-CssClass="text-center" SortExpression="Last_name"></asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-CssClass="text-center" SortExpression="Description">
                            <ItemStyle Wrap="True" CssClass="description" Width="700px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Website" HeaderText="Website" ItemStyle-CssClass="text-center" SortExpression="Website">
                            <ItemStyle Wrap="True" CssClass="website" Width="700px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="text-center" SortExpression="Email"></asp:BoundField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-primary btnc"
                                    CommandName="DeleteRow" CommandArgument='<%# Eval("S_Id") %>' OnClick="btnDelete_Click1" />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btnc" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--                        <asp:CommandField ShowEditButton="True" ></asp:CommandField>--%>
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
               
                <asp:Panel ID="confirm" runat="server" CssClass="popup" >
                    <div class="message">Do You Want To Delete This?</div>
                    <div class="text-end mt-3">
                        <asp:Button ID="Button4" runat="server" CssClass="btn btn-secondary btnc" Text="Yes" OnClick="popyes_Click1" />
                        <asp:Button ID="Button5" runat="server" CssClass="btn btn-secondary btnc" Text="No" OnClientClick="closeConfirm();" />
                    </div>
                </asp:Panel>

               
             

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventManagementConnectionString %>" DeleteCommand="DELETE FROM [sponcer] WHERE [S_Id] = @S_Id" InsertCommand="INSERT INTO [sponcer] ([First_name], [Last_name], [Description], [Website], [Email]) VALUES (@First_name, @Last_name, @Description, @Website, @Email)" ProviderName="<%$ ConnectionStrings:EventManagementConnectionString.ProviderName %>" SelectCommand="SELECT [S_Id], [First_name], [Last_name], [Description], [Website], [Email] FROM [sponcer] ORDER BY [S_Id] DESC" UpdateCommand="UPDATE [sponcer] SET [First_name] = @First_name, [Last_name] = @Last_name, [Description] = @Description, [Website] = @Website, [Email] = @Email WHERE [S_Id] = @S_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="S_Id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="First_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Last_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Website" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="First_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Last_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Website" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="S_Id" Type="Int32"></asp:Parameter>
                    </UpdateParameters>

                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <script src="../../Shared/js/sponsor1.js"></script>
</asp:Content>

