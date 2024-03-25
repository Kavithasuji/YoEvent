<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Event_management.register" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <PackageReference Include="AjaxControlToolkit" Version="20.1.0" />
    

    <style>
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

      #<%= Panel1.ClientID %> 
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
    .btnc {
      background-color: #1E50CD;
      color: white;
      }
    .gridview-noborder {
    border: none;
}
   .listbox-noborder{
    width:550px;
    height:70px
   }
 


  </style>

     <!-- Header -->
    <header class="header">
        <!-- Hero -->
        <div class="hero text-white pt-7 pb-4">
            <div class="container-xl">
                <div class="row">
                    <div class="col-12">
                        <h1></h1>
                    </div>
                </div>
            </div>
        </div>
  <%--      <svg
            class="frame-decoration"
            data-name="Layer 2"
            xmlns="http://www.w3.org/2000/svg "
            preserveaspectratio="none"
            viewbox="0 0 [width] [height]" width="[width]" height="[height]">
            <defs>
                <style>
                    .cls-1 {
                        fill: #f3f6f9;
                    }
                </style>
            </defs>
            <title>frame-decoration</title>
            <path
                class="cls-1"
                d="M0,158.755s63.9,52.163,179.472,50.736c121.494-1.5,185.839-49.738,305.984-49.733,109.21,0,181.491,51.733,300.537,50.233,123.941-1.562,225.214-50.126,390.43-50.374,123.821-.185,353.982,58.374,458.976,56.373,217.907-4.153,284.6-57.236,284.6-57.236V351.03H0V158.755Z"
                transform="translate(0 -158.755)" />
        </svg>--%>
    </header>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <!-- Contact Form -->
    <section class="contact bg-light pb-4">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <asp:Panel ID="updateSuccessPanel" CssClass="updatesuccess" runat="server">
                        Registered Sucessfully!
       <div class="text-end">
           <asp:HyperLink ID="okLink" NavigateUrl="Login.aspx" CssClass="btn btn-secondary btnc" runat="server">OK</asp:HyperLink>
       </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" CssClass="updatesuccess" runat="server">
                        Mail already registered!
                        <div class="text-end">
                       <asp:Button ID="panelmail" runat="server" Text="Ok" CssClass="btn btn-secondary btnc" OnClick="panelmail_Click" />

                        </div>
                    </asp:Panel>



                    </div>
                    <form action="https://formspree.io/f/mrgvnzvq" method="POST" id="formvalidate">


                        <!-- Radio-->
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3 text-center">
                                    <h1 class="text-center fw-bold mb-5">Registration</h1>
                                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                        <label class="btn btn-primary text-white fw-bold">
                                            <input type="radio" name="options" id="organizationOption" autocomplete="off" data-target="organizationInput" checked>
                                            Organization
                                        </label>
                                        <label class="btn btn-primary text-white fw-bold">
                                            <input type="radio" name="options" id="individualOption" autocomplete="off" data-target="organizationInput">
                                            Individual
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox runat="server" ID="organizationInput" CssClass="form-control form-control-lg" placeholder="Organizer Name" oninput="fetchData(this.value)"></asp:TextBox>
                                    <select id="resultListBox" class="listbox-noborder" size="5" style="display: none;">
                                      
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox
                                        runat="server"
                                        CssClass="form-control form-control-lg"
                                        ID="Name"
                                        placeholder="Full Name" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Name" ForeColor="Red" Display="Dynamic" ControlToValidate="Name" SetFocusOnError="true" ValidationGroup="o"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Name should be at most 25 characters  and dont contain numbers" ForeColor="Red" ValidationExpression="^[A-Za-z\s]{0,25}$" ControlToValidate="Name" ValidationGroup="o"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                        </div>



                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox
                                        runat="server"
                                        CssClass="form-control form-control-lg"
                                        ID="Phnumber"
                                        placeholder="Phone Number" />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server"
                                        ControlToValidate="Phnumber" ValidationExpression="^[6-9]\d{9}$"
                                        ErrorMessage="Please enter a valid Indian phone number" ForeColor="Red"
                                        CssClass="text-danger" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                                    </asp:RegularExpressionValidator>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="Phnumber" ErrorMessage="Please enter a phone number"
                                        ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>



                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox
                                        runat="server"
                                        CssClass="form-control form-control-lg"
                                        ID="Email"
                                      placeholder="Email"
                                      oninput="checkEmailAvailability(this.value)"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="Email" ErrorMessage="Please enter a Mail"
                                        ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="o">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                                        ControlToValidate="Email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"
                                        ErrorMessage="Please enter a valid email address"
                                        SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationGroup="o">
                                    </asp:RegularExpressionValidator>

                                </div>
                            </div>
                        </div>



                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox
                                        runat="server"
                                        CssClass="form-control form-control-lg"
                                        ID="Pass"
                                        TextMode="Password"
                                        placeholder="Password"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorppwd" runat="server" ErrorMessage="Enter Your Password" Display="Dynamic" ControlToValidate="Pass" ForeColor="Red" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" runat="server" Display="Dynamic" ErrorMessage="Password should be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number." ControlToValidate="Pass" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$" ForeColor="Red" ValidationGroup="o"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <div class="container password-container" runat="server">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <asp:TextBox
                                        runat="server"
                                        CssClass="form-control form-control-lg"
                                        ID="Cpass"
                                        TextMode="Password"
                                        placeholder="Confirm Password" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorpwd" runat="server" ErrorMessage="ReEnter Your Password" Display="Dynamic" ControlToValidate="Cpass" ForeColor="Red" SetFocusOnError="true"  ValidationGroup="o"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Cpass" ControlToCompare="Pass"  ForeColor="Red" ErrorMessage="Passwords do not match." Display="Dynamic" ValidationGroup="o"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>




                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-md-6 mt-3">
                                    <div class="d-grid">
                                        <%-- <button type="submit"  class="btn btn-primary text-white mt-3 fw-bolder fs-5" ValidationGroup="o" onclick="Saveregisterpeople();">Register</button>--%>
                                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary text-white mt-3 fw-bolder fs-5" ValidationGroup="o" OnClientClick="if(Page_ClientValidate()) { Saveregisterpeople(); }" OnClick="btnRegister_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>

                        <section class="social overflow-hidden">
                            <hr class="bg-primary" />
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 offset-md-3 text-center fs-4">
                                        <h3 class="text-center fw-bold">Register with</h3>
                                        <div class="social-icons d-flex justify-content-center gap-4">
                                            <i class="fab fa-facebook fa-2x"></i>
                                            <i class="fab fa-twitter fa-2x"></i>
                                            <%--<i class="fab fa-instagram fa-2x"></i>
                                   <i class="fab fa-linkedin fa-2x"></i>--%>
                                            <i class="fab fa-google fa-2x" onclick="signIn()"></i>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </section>

                    </form>
                </div>
            </div>
        </div>
    </section>

        <!-- footer -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/Shared/register.js"></script>
    <script src="js/Shared/RegOauth.js"></script> 
    
<script>
    $(document).ready(function () {
        $('input[type=radio][data-target]').change(function () {
            var targetId = $(this).data('target');
            var selectedInput = $('#' + targetId);
                var validator = $('#<%= organizationInput.ClientID %>');

            if ($(this).prop('id') === 'organizationOption') {
                selectedInput.show();
                validator.prop('disabled', false);
                validator.css('display', 'block');
            } else {
                selectedInput.hide();
                validator.prop('disabled', true);
                validator.css('display', 'none');
            }
        });
    });
</script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var otherTextBoxes = document.querySelectorAll('input[type="text"]:not(#<%= organizationInput.ClientID %>)');
            otherTextBoxes.forEach(function (textbox) {
                textbox.addEventListener('focus', function () {
                    var listBox = document.getElementById('resultListBox');
                    listBox.style.display = 'none'; // Hide the list box
                });
            });
        });
    </script>
    <script>
        var selectElement = document.getElementById('resultListBox');

            selectElement.addEventListener('change', function () {
            var selectedValue = selectElement.value;

            var textBox = document.getElementById('<%= organizationInput.ClientID %>');

    textBox.value = selectedValue;
});

    </script>
   
    <script src="js/Shared/register.js"></script>
    <script src="js/Shared/register.org.js"></script>

</asp:Content>
