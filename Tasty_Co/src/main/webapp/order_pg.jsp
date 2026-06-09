<%@ page contentType="text/html; charset=UTF-8" %>

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
  <title>Order</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

  <link rel="stylesheet" href="order_styles.css">
</head>
<body>
    <div class="main">
        <nav class="nav"> 
        <div class="logo"><img src="imgs\logo.PNG" height="60em" width="auto" alt="logo"></div>    
            <div class="header">
                <span><a href="index.jsp">Home</a></span>
                <span><a href="Menupage.jsp">Menu</a></span>
                <span><a href="aboutus.jsp">AboutUs</a></span>
                <span><a href="healthm.jsp">HealthMeter</a></span>
            </div>
        </nav>
    </div>
  <!-- Drinks Section -->
<h1 id="drinks" class="menu-title">Drinks</h1>
<div class="grid-container" id="drinks">
    <div class="item-card" data-name="Tea" data-price="10">
        <img src="imgs/tea.jpg" alt="Tea" class="item-image" />
        <p class="item-name">Tea - ₹10</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Coffee" data-price="15">
        <img src="imgs/coffee.jpg" alt="Coffee" class="item-image" />
        <p class="item-name">Coffee - ₹15</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Cold Coffee" data-price="50">
        <img src="imgs/coldcoffee.jpg" alt="Cold Coffee" class="item-image" />
        <p class="item-name">Cold Coffee - ₹50</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Lemonade" data-price="30">
        <img src="imgs/lemonade.webp" alt="Lemonade" class="item-image" />
        <p class="item-name">Lemonade - ₹30</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Strawberry Milkshake" data-price="80">
        <img src="imgs/strawberryshake.jpg" alt="Strawberry Milkshake" class="item-image" />
        <p class="item-name"> Strawberry Milkshake - ₹80</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Orange Juice" data-price="60">
        <img src="imgs/orangejuice.jpg" alt="Orange Juice" class="item-image" />
        <p class="item-name">Orange Juice - ₹60</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Mango Smoothie" data-price="90">
        <img src="imgs/mangosmoothie.jpg" alt="Mango Smoothie" class="item-image" />
        <p class="item-name">Mango Smoothie - ₹90</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Coconut Water" data-price="40">
        <img src="imgs/coconutwater.jpg" alt="Coconut Water" class="item-image" />
        <p class="item-name">Coconut Water - ₹40</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
</div>


    <!-- Snacks Section -->
<h1 id="snacks" class="menu-title">Snacks</h1>
<div class="grid-container" id="snacks">
    <div class="item-card" data-name="Burger" data-price="50">
        <img src="imgs/burger.jpeg" alt="Burger" class="item-image" />
        <p class="item-name">Burger - ₹50</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Pizza" data-price="100">
        <img src="imgs/pizza.jpg" alt="Pizza" class="item-image" />
        <p class="item-name">Pizza - ₹100</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Fries" data-price="30">
        <img src="imgs/frenchfries.jpeg" alt="Fries" class="item-image" />
        <p class="item-name">Fries - ₹30</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Sandwich" data-price="40">
        <img src="imgs/sandwich.jpeg" alt="Sandwich" class="item-image" />
        <p class="item-name">Sandwich - ₹40</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Samosa" data-price="20">
        <img src="imgs/samosa.jpg" alt="Samosa" class="item-image" />
        <p class="item-name">Samosa - ₹20</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Pasta" data-price="70">
        <img src="imgs/pasta.jpg" alt="Pasta" class="item-image" />
        <p class="item-name">Pasta - ₹70</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Dosa" data-price="60">
        <img src="imgs/dosa.jpg" alt="Dosa" class="item-image" />
        <p class="item-name">Dosa - ₹60</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Vada Pav" data-price="20">
        <img src="imgs/vadapav.jpg" alt="Vada Pav" class="item-image" />
        <p class="item-name">Vada Pav - ₹20</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
</div>



<!-- Main Course Section -->
<h1 id="maincourse" class="menu-title">Main Course</h1>
<div class="grid-container" id="main-course">
    <div class="item-card" data-name="Paneer Butter Masala" data-price="150">
        <img src="imgs/paneermasala.jpg" alt="Paneer Butter Masala" class="item-image" />
        <p class="item-name">Paneer Butter Masala - ₹150</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Chicken Curry" data-price="180">
        <img src="imgs/chickencurry.jpg" alt="Chicken Curry" class="item-image" />
        <p class="item-name">Chicken Curry - ₹180</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Khichdi" data-price="100">
        <img src="imgs/khicadi.jpg" alt="Khichdi" class="item-image" />
        <p class="item-name">Khichdi - ₹100</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Fish Fry" data-price="150">
        <img src="imgs/fishfry.webp" alt="Fish Fry" class="item-image" />
        <p class="item-name">Fish Fry - ₹150</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Chole Bhature" data-price="130">
        <img src="imgs/cholebhature.jpg" alt="Chole Bhature" class="item-image" />
        <p class="item-name">Chole Bhature - ₹130</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Chapati" data-price="15">
        <img src="imgs/chapati.jpg" alt="Chapati" class="item-image" />
        <p class="item-name">Chapati - ₹15</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Veg Thali" data-price="150">
        <img src="imgs/vegthali.webp" alt="Veg Thali" class="item-image" />
        <p class="item-name">Veg Thali - ₹150</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Mix Veg " data-price="125">
        <img src="imgs/mixveg.webp" alt="Mix Veg " class="item-image" />
        <p class="item-name">Mix Veg - ₹125</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
</div>


<!-- Desserts Section -->
<h1 id="desserts" class="menu-title">Desserts</h1>
<div class="grid-container" id="desserts">
    <div class="item-card" data-name="Gulab Jamun" data-price="50">
        <img src="imgs/gulabjamun.jpg" alt="Gulab Jamun" class="item-image" />
        <p class="item-name">Gulab Jamun - ₹50</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Rasgulla" data-price="60">
        <img src="imgs/rasgulla.jpg" alt="Rasgulla" class="item-image" />
        <p class="item-name">Rasgulla - ₹60</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Chocolate Cake" data-price="100">
        <img src="imgs/chocolatecake.jpg" alt="Chocolate Cake" class="item-image" />
        <p class="item-name">Chocolate Cake - ₹100</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Ice Cream" data-price="80">
        <img src="imgs/icecream.avif" alt="Ice Cream" class="item-image" />
        <p class="item-name">Ice Cream - ₹80</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Jalebi" data-price="40">
        <img src="imgs/jalebi.jpg" alt="Jalebi" class="item-image" />
        <p class="item-name">Jalebi - ₹40</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Pastry" data-price="70">
        <img src="imgs/pastry.webp" alt="Pastry" class="item-image" />
        <p class="item-name">Pastry - ₹70</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Kulfi" data-price="50">
        <img src="imgs/kulfi.jpg" alt="Kulfi" class="item-image" />
        <p class="item-name">Kulfi - ₹50</p>
        <p> Health Rating: Indulgent</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
    <div class="item-card" data-name="Kheer" data-price="70">
        <img src="imgs/kheer.jpg" alt="Kheer" class="item-image" />
        <p class="item-name">Kheer - ₹70</p>
        <p> Health Rating: Nutritious</p>
        <button class="add-to-cart">Add to Cart</button>
    </div>
</div>

    <!-- Shopping Cart -->
    <h1 class="menu-title">Shopping Cart</h1>
    <div class="cart-container">
      <table class="cart-table" id="cartTable">
        <thead>
          <tr>
            <th>Item</th>
            <th>Price</th>
            <th>Quantity</th>
          </tr>
        </thead>
        <tbody id="cartList">
          <!-- Cart items will be inserted here -->
        </tbody>
      </table>
      <p id="totalPrice">Total: ₹0.00</p>
      <button id="orderNow">Order Now</button>
    </div>
  </div>
  

<footer>
    <div class="abt-foot">
        <h2>ABOUT US</h2>
        <p>We bring you a seamless food ordering experience with a wide variety of cuisines, from healthy meals to your favorite comfort foods. Whether you're looking for a quick bite or a full-course meal, we connect you with the best restaurants and eateries in town.</p>
    </div>
    <div class="links">
        <h2>QUICK LINKS</h2>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Menupage.jsp">Menu</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
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
<script src="script.js"></script>
</body>
</html>
