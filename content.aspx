<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="content.aspx.cs" Inherits="Event_management.content" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link
  href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&display=swap"
  rel="stylesheet"
/>

     <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/font-awesome.css" />
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/styles.css" />
<link rel="icon" href="images/favicon.png" />
<link rel="stylesheet" href="css/style1.css">

    <style>
        .social-icons i {
            transition: color 0.3s ease;
        }

            .social-icons i:hover {
                color: #c167eb; /* Change to the color you prefer on hover */
            }
    </style>

    <!-- Header -->
<header class="header">
  <!-- Hero -->
  <div class="hero text-white pt-7">
    <div class="container-xl">
      <div class="row">
        <div class="col-md-6">
          <div class="image-container mb-5 px-4">
            <img src="images/510x322-h2-images-EVENT-PLANNING-TEMPLATES.png" alt="" class="img-fluid mt-5 me-4" />
          </div>
        </div>
        <div class="col-md-6">
          <div
            class="text-container p-4 d-flex flex-column justify-content-center h-100 mb-5"
          >
            <h1 class="display-4 fw-bold">SIMPLIFIED MANAGEMENT SOLUTION</h1>
           
               <h5>
                CONNECT WITH US AND CONNECT EVERYWHERE. WE WILL MAKE A WIDE RANGE OF CONNECTIONS FOR THE PEOPLE IN THIS WORLD, AND WE WILL HELP YOU TO GROW WITH US.
               </h5>

            <!-- form -->
       <%--     <div class="form-container text-center">
              <form>
                <div class="my-4">
                  <input
                    type="email"
                    class="form-control form-control-lg rounded-5"
                    placeholder="email address"
                  />
                </div>
                <div class="d-grid">
                  <button class="btn btn-primary btn-lg text-white">
                    for query
                  </button>
                </div>
              </form>
            </div>--%>
          </div>
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

<!-- about-->
 <section class="icons bg-light pb-3" id="about">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="text-center">
        <i class="fa-solid fa-calendar-days fa-bounce fa-4x mb-4" style="color: #c167eb;"></i>

          <%--<img src="images/ticket.gif" style="height:150px;width:150px;"/>--%>
          <h5 class="fw-bold">What is Yoevent!</h5>
          <p class="text-muted">
            Yoevent! is an innovative event planning application designed to simplify the entire event planning process.
            With Yoevent!, users can easily create and manage their events by setting dates, sending invitations,
            and tracking RSVPs with just a few clicks, saving a lot of time and effort. The app's user-friendly
            interface makes it easy for anyone to plan events for families or friends or for organizations with ease,
            whether it's a small gathering or a large-scale conference. With Yoevent!, users can also collaborate with others to plan their events and share important details,
            taking the stress out of event planning and focusing on creating an event that your guests will love. Overall,
            Yoevent! is an excellent tool for anyone who wants to plan events efficiently and effectively.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Details -->



<section id="events" class="details my-5">
  <div class="container">
    <div class="row">
      <!-- Events on the left -->
      <div class="col-lg-6 animate-slide-in">
        <div class="row">
          <h1 class="fw-bold text-center">Top Events</h1>
          <!-- Event 1 -->
          <div class="col-md-12 mb-4 animate-card">
            <div class="card">
              <!-- Card content -->
              <h5 class="bg-primary text-white card-header fw-bold">International Conference on Management (MEET)</h5>
              <div class="card-body">
                <h5 class="card-title fw-bold">29Dec-30Dec 2023</h5>
                <p class="card-text">MEET fosters collaborative research to address practical challenges in Management, Education, and Emerging Technologies across diverse fields, aiming to explore new dimensions in these areas.</p>
                <a href="#" class="btn btn-primary text-white">View Details</a>
              </div>
            </div>
          </div>
          <!-- Event 2 -->
          <div class="col-md-12 mb-4 animate-card">
            <div class="card">
              <!-- Card content -->
              <h5 class=" bg-primary text-white card-header fw-bold">YED New Year Event 2024</h5>
              <div class="card-body">
                <h5 class="card-title fw-bold">31Dec-01Jan 2024</h5>
                <p class="card-text">Embark on YED Luxury Events' exclusive yacht party on December 31st, 2023, for an unforgettable New Year's celebration in Dubai! Limited tickets, book now for a night of luxury and revelry.</p>
                <a href="https://yachteventsdubai.com/new-year/" class="btn btn-primary text-white">View Details</a>
              </div>
            </div>
          </div>
          <!-- Event 3 -->
          <div class="col-md-12 mb-4 animate-card">
            <div class="card">
              <!-- Card content -->
              <h5 class=" bg-primary text-white card-header fw-bold">International Conference on English Literature and Linguistics</h5>
              <div class="card-body">
                <h5 class="card-title fw-bold">06Jan 2024</h5>
                <p class="card-text">Join the International Conference on English Literature and Linguistics to explore trending subjects and connect with experts, fostering discussions on emerging topics, solutions, and innovative ideas. Contribute your unique perspective and build valuable connections in this knowledge-sharing event.</p>
                <a href="#" class="btn btn-primary text-white">View Details</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Remaining content -->
              <!-- Calendar on the right -->
      <div class="col-lg-6 mt-3 animate-slide-in-right">
        <!-- Your calendar content here -->
        <div class="d-flex justify-content-center align-items-center h-100">
         <div class="wrapper">
           <header>
             <p class="current-date"></p>
             <div class="icons">
               <span id="prev" class="material-symbols-rounded">&lt;</span>
               <span id="next" class="material-symbols-rounded">&gt;</span>
             </div>
           </header>
           <div class="calendar">
             <ul class="weeks">
               <li>Sun</li>
               <li>Mon</li>
               <li>Tue</li>
               <li>Wed</li>
               <li>Thu</li>
               <li>Fri</li>
               <li>Sat</li>
             </ul>
             <ul class="days"></ul>
           </div>
         </div>
       </div>
    </div>
  </div>
</section>







<!-- Statement 1 -->
<section class="statement mb-5 animate-left-to-right">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-inline-block date-card bg-primary text-white text-center py-1 rounded-top-5" style="width: 100%; height:100px;">
          <h3>Parakram Diwas</h3>
          <p>23rd January 2023</p>
        </div>
        <div class="text-container bg-light p-3 rounded-bottom-5">
          <div class="row">
            <div class="col-md-6">
              <h2 class="fw-bold">Parakram Diwas in India</h2>
              <p class="d-flex justify-content-center align-items-center ms-5">
                On the Occasion of Parakram Diwas (23rd January) 2023,
                21 unnamed islands of Andaman and Nicobar have been named after Param Veer Chakra awardees.
                Netaji's Memorial, a National Memorial dedicated to Netaji will be built on Netaji Subhas Chandra Bose.
              </p>
            </div>
            <div class="col-md-6 <%--d-flex justify-content-center align-items-center--%>">
              <div class="image-container px-1 ">
                <img src="images/PARAKRAM-DIVAS-01.jpg" class="img-fluid" style="width: 180px; height:200px;float:right;" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

    <!-- Statement 2 -->
<section class="statement mb-5 animate-right-to-left">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-inline-block date-card bg-primary text-white text-center py-1 rounded-top-5" style="width: 100%; height:100px;">
          <h3 >Christmas Flowers & Gifts</h3>
          <p>25rd December 2023</p>
        </div>
        <div class="text-container bg-light p-3 rounded-bottom-5">
          <div class="row">
            <div class="col-md-6">
              <h2 class="fw-bold">Christmas</h2>
              <p class="d-flex justify-content-center align-items-center ms-5">
                Christmas is a Christian festival that celebrates the birth of Jesus Christ,
                who Christians believe was the son of God. For most people,
                it takes place every year on 25 December – the day that the Roman Catholic Church chose to mark Jesus' birthday.
              </p>
            </div>
            <div class="col-md-6 <%--d-flex justify-content-center align-items-center--%>">
              <div class="image-container px-1 ">
                <img src="images/merry-christmas-wallpaper-design_79603-2129.jpg" class="img-fluid" style="width: 180px; height:200px;float:right;" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

        <!-- Statement 3 -->
<section class="statement mb-5 animate-left-to-right">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="d-inline-block date-card bg-primary text-white text-center py-1 rounded-top-5" style="width: 100%; height:100px;">
          <h3 >Pongal</h3>
          <p>15rd January 2024</p>
        </div>
        <div class="text-container bg-light p-3 rounded-bottom-5">
          <div class="row">
            <div class="col-md-6">
              <h2 class="fw-bold">Pongal</h2>
              <p class="d-flex justify-content-center align-items-center ms-5">
               Pongal is a harvest festival celebrated by the Tamil community.
               It is a celebration to thank the Sun, Mother Nature and the various 
               farm animals that help to contribute to a bountiful harvest.
              </p>
            </div>
            <div class="col-md-6 <%--d-flex justify-content-center align-items-center--%>">
              <div class="image-container px-1 ">
                <img src="images/73213679.jpg" class="img-fluid" style="width: 180px; height:200px;float:right;" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>




<!-- Details 2 -->
<section class="details my-5" id="feat">
  <div class="container">
    <div class="row">
      <div class="col-lg-6">
        <div class="image-container p-5">
          <img src="images/fea.png" alt="" class="img-fluid" />
        </div>
      </div>
      <div class="col-lg-6">
        <div
          class="text-container d-flex flex-column justify-content-center h-100"
        >
          <h2 class="display-6 fw-bold text-center">Features</h2>
          <p>
            Discover techniques for effective storytelling, engaging
            visuals, and compelling calls-to-action. Unlock the secrets of
            creating a consistent and authentic brand voice that sets you
            apart from the competition.
          </p>
          <ul class="list-group list-group-flush lh-lg">
            <li class="list-group-item">
              <i class="fas fa-square text-primary"></i>
              <strong>Effortless Event Planning:</strong> Seamlessly create and plan events.
            </li>
            <li class="list-group-item">
              <i class="fas fa-square text-primary"></i>
              <strong>Comprehensive Management:</strong> Manage dates, times, locations, budgets, and event types effortlessly.
            </li>
            <li class="list-group-item">
              <i class="fas fa-square text-primary"></i>
              <strong>Streamlined Registration:</strong>  Attendees can easily register and purchase tickets.
            </li>
          
            <li class="list-group-item">
              <i class="fas fa-square text-primary"></i>
              <strong>Centralized Attendee Data:</strong>Manage attendee details and ticket information effectively.
            </li>
        
            <li class="list-group-item">
             <i class="fas fa-square text-primary"></i>
             <strong>Customizable Agendas:</strong>Craft, manage, and share event agendas tailored to your needs.
            </li>

          </ul>
     
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Modal 2 -->


<!-- Testimonials -->
<section class="testimonials mb-8">
  <div class="container">
    <div class="row">
      <div class="col-md-4 text-center">
        <img
          src="images/analytics.gif"
          alt=""
          style="height:150px;width:150px;"
        />
          <h3 class="fw-bold">
             Analytics and Reporting
          </h3>
          <p class="lead fst-italic">
              yoevent! allow event planners to monitor the performance of the event in real-time.
              It also provides real-time reporting, so event planners can make data-driven decisions quickly.
          </p>
          </div>
       

      <div class="col-md-4 text-center">
        <img
          src="images/hd.gif"
          alt=""
          style="height:150px;width:150px;"       
            />
        <h3 class="fw-bold">
          Event Planning
        </h3>
        <p class="lead fst-italic">
            yoevent! provides a dashboard view that allows event planners to create,
            track progress and stay organized, ensuring that no important details are missed.
            Additionally, yoevent! enables event planners to easily follow up with guests by managing guest lists,
            sending reminders, and tracking RSVPs.</p>
      </div>

      <div class="col-md-4 text-center">
        <img
          src="images/guest.gif"
          alt=""
          style="height:150px;width:150px;"
            />
         <h3 class="fw-bold">
           Guest Management
          </h3>
          <p class="lead fst-italic">
             With yoevent! event planners can manage guest lists and invitations, send reminders, and track RSVPs.
             The application allows for easy communication with guests through automated messages and personalized notifications.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Download -->
<section class="download">
  <div class="container">
    <div class="row">
      <div class="col-lg-5">
        <div class="image-container mt-n6 mb-5">
          <img src="images/123.jpg" alt="" class="img-fluid" />
        </div>
      </div>
      <div class="col-lg-7">
        <div
          class="text-container text-white d-flex flex-column justify-content-center h-100 mb-5"
        >
             <h2 class="fw-bold">Unlock Seamless Event Planning</h2>
            <p>
              Discover the secrets to effortless event management. 
              Get your hands on our comprehensive guide, "Event Mastery: 
              The Ultimate Handbook for Event Planners," and elevate your event planning game.
            </p>


          <!-- Form -->
          <form>
            <div class="input-group mb-3">
              <input
                type="email"
                class="form-control"
                placeholder="Email Address"
              />
              <button class="btn btn-primary text-white rounded-end">
                FOR QUERY
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

        <!-- Footer -->
<section class="social text-bg-dark py-6 overflow-hidden">
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3 text-center fs-4">
        <p>
          Stay connected and join our vibrant community. For any inquiries
          or assistance, feel free to reach out to us
        </p>
        <div class="social-icons d-flex justify-content-center gap-4">
          <i class="fab fa-facebook fa-2x"></i>
          <i class="fa-brands fa-twitter fa-2x"></i>
          <i class="fab fa-instagram fa-2x"></i>
          <i class="fab fa-linkedin fa-2x"></i>
          <i class="fab fa-pinterest fa-2x"></i>
          <i class="fab fa-google fa-2x"></i>
        </div>
      </div>
    </div>
  </div>
</section>





    <script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
    <script src="js/calander.js"></script>

</asp:Content>
