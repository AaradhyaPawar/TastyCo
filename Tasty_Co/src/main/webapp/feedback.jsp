<!DOCTYPE html>
<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");  // Redirect if not logged in
}
%>
<%@ include file="logout.jsp" %>

<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>About Us - TastyCo</title>
  <link rel="stylesheet" href="aboutus.css" />
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet" />
  <!-- Font Awesome for icons (if needed) -->
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
  <!-- Navigation -->
  <div class="main">
    <nav class="nav"> 
    <div class="logo"><img src="imgs/logo.PNG" height="60em" width="auto" alt="logo"></div>    
        <div class="header">
            <span><a href="index.jsp">Home</a></span>
            <span><a href="Menupage.jsp">Menu</a></span>
            <span><a href="aboutus.jsp">AboutUs</a></span>
            <span><a href="healthm.jsp">HealthMeter</a></span>
            <span><a href="login.jsp">Login</a></span>
        </div>
    </nav>
  </div> 
  <!-- <header>
    <div class="container">
      <div class="logo">TastyCo</div>
      <nav>
        <ul>
          <li><a href="#about">About</a></li>
          <li><a href="#features">Features</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </nav>
    </div>
  </header> -->

  <!-- Hero Section
  <section class="hero">
    <div class="hero-overlay">
      <div class="hero-content">
        <h1>Welcome to TastyCo</h1>
        <p>Smart, delicious, and healthy eating made easy!</p>
        <a href="#about" class="btn">Discover More</a>
      </div>
    </div>
  </section> -->

  <!-- About Section -->
  <section id="about" class="about">
    <div class="about-container">
      <div class="about-text">
        <h2>About TastyCo</h2>
        <p>
          At TastyCo, we believe food should be both delicious and nutritious.
          Our platform not only lets you explore the healthiest options but also tracks your eating habits. Whether you need insights into your diet, a random dish recommendation, or a quick glance at our health ratings, we have you covered.
        </p>
      </div>
      <div class="about-image">
        <img src="imgs/about3.png" alt="About TastyCo" />
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section id="features" class="features">
    <h2>Our Features</h2>
    <div class="features-container">
      <div>
        <img src="imgs/chef1.PNG" height="300px" width="200px">
      </div>
      <div class="feature-box">
        <img src="imgs/ab1.jpg" alt="Healthy Eating Insights" />
        <h3>Healthy Eating Insights</h3>
        <p>
          Track how much healthy vs. unhealthy food you consume and take charge of your diet.
        </p>
      </div>
      <div class="feature-box">
        <img src="imgs/ab2.png" alt="Random Dish Picker" />
        <h3>Random Dish Picker</h3>
        <p>
          Cannot decide what to eat? Let our random dish picker surprise you with exciting options.
        </p>
      </div>
      <div class="feature-box">
        <img src="imgs/ab3.webp" alt="Health Ratings" />
        <h3>Health Ratings</h3>
        <p>
          We rate dishes as "Nutritious" or "Indulgent" based on nutritional value so you can make informed choices.
        </p>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="contact">
    <h2 id="feedback" >Get in Touch</h2>
    <form action="FeedbackServlet" method="post">
      <div class="form-group">
        <input name="name" type="text" placeholder="Your Name" required />
      </div>
      <div class="form-group">
        <input name="email" type="email" placeholder="Your Email" required />
      </div>
      <div class="form-group">
        <textarea name="message" placeholder="Your Message/Feedback" required></textarea>
      </div>
      <button type="submit" class="btn">Send Message</button>
      <br>
      <br>
      <label id="feedback-success" style="display:none; font-weight: bold; color: #ff4891; font-size: 16px; background: #f0f0f0; padding: 5px 10px; border-radius: 5px;">
        THANK YOU FOR YOUR FEEDBACK!
      </label>
    </form>
  </section>

  <!-- Footer -->
  <footer>
    <div class="abt-foot">
        <h2>ABOUT US</h2>
        <p>We bring you a seamless food ordering experience with a wide variety of cuisines, from healthy meals to your favorite comfort foods. Whether you're looking for a quick bite or a full-course meal, we connect you with the best restaurants and eateries in town.</p>
    </div>
    <div class="links">
        <h2>QUICK LINKS</h2>
        <ul>
            <li><a href="/">Contact Us</a></li>
            <li><a href="/">Privacy Policy</a></li>
            <li><a href="/">Terms & Conditions</a></li>
        </ul>
    </div>
    <div class="follow">
        <h2>FOLLOW US</h2>
        <ul>
            <li><a href=""><i class="fab fa-facebook-f"></i> Facebook</a></li>
            <li><a href=""><i class="fab fa-instagram"></i> Instagram</a></li>
            <li><a href=""><i class="fab fa-twitter"></i> Twitter</a></li>
        </ul>
    </div>
    <span>&COPY; 2025 Book Alchemy</span>
</footer>
</body>
</html>
