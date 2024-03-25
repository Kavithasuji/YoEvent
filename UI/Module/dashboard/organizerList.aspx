<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Module/dashboard/Dash.Master" AutoEventWireup="true" CodeBehind="organizerList.aspx.cs" Inherits="Event_management.UI.Module.dashboard.organizer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .DBtn {
            background-color: #1E50CD;
            color: white;
        }

            .DBtn:hover {
                background-color: #1B26A8;
                color: white;
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="input-group">
                    <div class="input-group d-flex">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control w-25" placeholder="Find Event"></asp:TextBox>
                        <asp:ImageButton ID="Button1" runat="server" ImageUrl="../../../images/icons8-search-25.png" CssClass="btn btn-primary rounded-end picbtn" OnClick="Button1_Click" ViewStateMode="Enabled" />
                    </div>
                </div>
            </div>
            <div class="col-md-8 mb-3 text-end">
                <a href="Dashboard.aspx" class="btn btn-info DBtn">Dashbord </a>
                <a href="#" class="btn btn-info DBtn">All Organizer</a>
                <a href="c_org.aspx" class="btn btn-info  DBtn">Create Organizer</a>
            </div>
        </div>
    </div>

<div class="container w">
    <div class="row">
      <div class=" col-md-12 ">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="F_Id" DataSourceID="SqlDataSource11" AllowPaging="True" AllowSorting="True"  OnRowEditing="GridView1_RowEditing" BackColor="White" BorderColor="White"  CssClass="table  table-Borderd  table-striped mb-5"  BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
              <Columns>
                  <asp:BoundField DataField="F_Id" HeaderText="S.NO" ReadOnly="True" ItemStyle-CssClass="text-center" InsertVisible="False" SortExpression="F_Id">
                      <HeaderStyle CssClass="text-center"></HeaderStyle>

                  </asp:BoundField>
                  <asp:BoundField DataField="First_Name" HeaderText="First Name" ItemStyle-CssClass="text-center" SortExpression="First_Name">
                      <HeaderStyle CssClass="  text-center"></HeaderStyle>

                  </asp:BoundField>
                  <asp:BoundField DataField="Last_Name" HeaderText="Last Name" ItemStyle-CssClass="text-center" SortExpression="Last_Name">
                      <HeaderStyle CssClass="text-center"></HeaderStyle>

                  </asp:BoundField>
                  <asp:BoundField DataField="Email" HeaderText="Email"  ItemStyle-CssClass="text-center" SortExpression="Email">
                      <HeaderStyle CssClass="text-center"></HeaderStyle>

                  </asp:BoundField>
                  <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-CssClass="text-center" SortExpression="Phone">
                      <HeaderStyle CssClass="text-center"></HeaderStyle>

                  </asp:BoundField>
                  <asp:BoundField DataField="Organizer_Type" HeaderText="Organizer Type" ItemStyle-CssClass="text-center" SortExpression="Organizer_Type">
                      <HeaderStyle CssClass="text-center"></HeaderStyle>

                  </asp:BoundField>

                  <asp:TemplateField HeaderText="Actions">
                      <ItemTemplate>
                          <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-info btnc" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                      </ItemTemplate>
                  </asp:TemplateField>   
                  <asp:TemplateField HeaderText="Actions">
                      <ItemTemplate>
                          <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-primary btnc"
                              CommandName="DeleteRow" CommandArgument='<%# Eval("F_Id") %>' OnClick="btnDelete_Click1" />

                      </ItemTemplate>
                  </asp:TemplateField>
<%--                  <asp:CommandField ShowDeleteButton="True"></asp:CommandField>--%>

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


          <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString='<%$ ConnectionStrings:EventManagementConnectionString4 %>' DeleteCommand="DELETE FROM [organizer] WHERE [F_Id] = @F_Id" InsertCommand="INSERT INTO [organizer] ([First_Name], [Last_Name], [Email], [Phone], [Organizer_Type]) VALUES (@First_Name, @Last_Name, @Email, @Phone, @Organizer_Type)" ProviderName='<%$ ConnectionStrings:EventManagementConnectionString4.ProviderName %>' SelectCommand="SELECT [F_Id], [First_Name], [Last_Name], [Email], [Phone], [Organizer_Type] FROM [organizer] ORDER BY [F_Id] DESC" UpdateCommand="UPDATE [organizer] SET [First_Name] = @First_Name, [Last_Name] = @Last_Name, [Email] = @Email, [Phone] = @Phone, [Organizer_Type] = @Organizer_Type WHERE [F_Id] = @F_Id">
              <DeleteParameters>
                  <asp:Parameter Name="F_Id" Type="Int32"></asp:Parameter>
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="First_Name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Last_Name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Phone" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="Organizer_Type" Type="String"></asp:Parameter>
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="First_Name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Last_Name" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                  <asp:Parameter Name="Phone" Type="Int32"></asp:Parameter>
                  <asp:Parameter Name="Organizer_Type" Type="String"></asp:Parameter>
                  <asp:Parameter Name="F_Id" Type="Int32"></asp:Parameter>
              </UpdateParameters>
          </asp:SqlDataSource>
      </div>
   </div>
</div>












</asp:Content>
