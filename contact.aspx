<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Event_management.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header"> 
    <!-- Hero -->
  <div class="hero text-white pt-7 pb-4">
    <div class="container-xl">
      <div class="row">
        <div class="col-12">
          <h1 class="fw-bolder"></h1>
        </div>
      </div>
    </div>
  </div>
  <svg
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
 </svg>
</header>

<!-- Contact Form -->
<section class="contact bg-light pb-4">
  <div class="container">
    <div class="row">
      <div class="col-12">
       <h1 class="text-center fw-bold mb-5">Contact Information</h1>
        <form action="https://formspree.io/f/mrgvnzvq" method="POST" class="w-75 mx-auto">
           <div class="container">
              <div class="row justify-content-center">
                <div class="col-md-6 mt-3">
                   <input
                          type="text"
                          class="form-control form-control-lg"
                          name="name"
                          placeholder="Full Name"
                        />
                </div>
              </div>
            </div>
           <div class="container">
             <div class="row justify-content-center">
               <div class="col-md-6 mt-3">
                  <input
                       type="email"
                       class="form-control form-control-lg"
                       name="email"
                       placeholder="Email"
                     />
               </div>
             </div>
           </div>

               <div class="container">
                 <div class="row justify-content-center">
                   <div class="col-md-6 mt-3">
                     <textarea
                       class="form-control form-control-lg"
                       name="message"
                       rows="6"
                       placeholder="Message"
                     ></textarea>
                   </div>
                 </div>
               </div>

          

 <div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6 mt-3">
      <div class="d-grid">
        <button type="submit" class="btn btn-primary text-white mt-3 fw-bolder fs-5">
          Submit
        </button>
      </div>
    </div>
  </div>
</div>


        </form>
      </div>
    </div>
  </div>
</section>


<!-- Map -->
<section class="location my-5">
  <div class="container">
    <div class="row">
      <div class="col-10 offset-1">
        <h3>Our Location</h3>
          <h2 class="fw-bold">Virran Tech Solutions pvt ltd</h2>
        <p class="mb-4">
          Meenakshi Tower, New No 13, Old No 6, Rajamannar St, near Ramakrishna Play Ground, T. Nagar, Chennai, Tamil Nadu 600017
        </p>
        <div class="map">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2748.4393575759987!2d80.23758332449131!3d13.043295826309535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a5267d706af6bbd%3A0x921d8985ae1a649a!2sVirran!5e0!3m2!1sen!2sin!4v1702988121759!5m2!1sen!2sin"
            allowfullscreen
          ></iframe>
        </div>
      </div>
    </div>
  </div>
</section>

</asp:Content>

