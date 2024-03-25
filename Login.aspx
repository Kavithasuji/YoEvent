<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Event_management.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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
<%-- <svg
   class="frame-decoration"
   data-name="Layer 2"
   xmlns="http://www.w3.org/2000/svg "
   preserveAspectRatio="none"
   viewBox="0 0 [width] [height]" width="[width]" height="[height]"
 >
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
     transform="translate(0 -158.755)"
  />
 </svg>--%>
 </header>
      <asp:Panel ID="Panel1" CssClass="updatesuccess" runat="server">
      Incorrect email or password!
      <div class="text-end">
     <asp:Button ID="panelmail" runat="server" Text="Ok" CssClass="btn btn-secondary btnc" />

      </div>
  </asp:Panel>

 <!-- Contact Form -->
 <section class="contact bg-light pb-4">
   <div class="container">
     <div class="row">
       <div class="col-12">
         <form action="https://formspree.io/f/mrgvnzvq" method="POST">

             <div class="container">
                 <div class="row justify-content-center">
                     <div class="col-md-6 mt-3">

                         <h1 class="text-center fw-bold mb-5">Login</h1>
                         <asp:TextBox ID="Email" runat="server" CssClass="form-control form-control-lg" placeholder="Enter Email"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatormail" runat="server" CssClass="form-control float-start ms-2 text-start" ControlToValidate="email" ErrorMessage="Please enter a valid email address" Display="Dynamic" ForeColor="Red" SetFocusError="true" Font-Bold="true" ValidationGroup="u"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" CssClass="form-control float-start ms-2 text-start" ControlToValidate="email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ErrorMessage="Please enter a valid email address" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" Font-Bold="true" ValidationGroup="o"></asp:RegularExpressionValidator>

                     </div>
                 </div>
             </div>
             
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 mt-3">
            <asp:TextBox ID="Pass" runat="server" type="password" placeholder="Password" name="password" CssClass="form-control form-control-lg"></asp:TextBox>           
        </div>
    </div>
</div>


<%-- <div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6 mt-3 text-center">
      <div class="btn-group btn-group-toggle" data-toggle="buttons">
        <label class="btn btn-primary text-white">
          <input type="radio" name="options" id="organizationOption" autocomplete="off"> Remember Me
        </label>
      </div>
    </div>
  </div>
</div>--%>
                 

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 mt-3">
            <div class="d-grid">
                <asp:Button ID="LoginButton" runat="server" Text="Login" CssClass="btn btn-primary text-white mt-3 fw-bolder fs-5"  ValidationGroup="u"  OnClientClick="return Saveloginpeople()" OnClick="LoginButton_Click" />
            </div>
        </div>
    </div>
</div>

    <div class="row justify-content-center mt-3">
        <div class="col-md-6 text-center">
         
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="mt-3 fw-bold" Text="Forget Password" OnClick="forgetPasswordLink_Click"></asp:HyperLink>
        </div>
    </div>
</div>




<section class="social overflow-hidden">
<hr class="bg-primary"/>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3 text-center fs-4">
          <h3 class="text-center fw-bold">Login with</h3>
        <div class="social-icons d-flex justify-content-center gap-4">
          <i class="fab fa-facebook fa-2x"></i>
          <i class="fab fa-twitter fa-2x"></i>
          <i class="fab fa-instagram fa-2x"></i>
          <i class="fab fa-linkedin fa-2x"></i>
          <i class="fab fa-google fa-2x"></i>
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


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/Shared/login.js"></script>
</asp:Content>