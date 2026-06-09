<%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
    <link rel="stylesheet" href="indexcss.css">
    <style>
    .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-image: linear-gradient(to bottom right, rgb(249, 81, 81),rgba(255, 70, 70, 0.434),rgb(241, 164, 128));
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            text-align: center;
        }

        .modal-content img {
            width: 200px;
            height: 200px;
            border-radius: 10px;
        }

        .close {
            color: red;
            float: right;
            font-size: 28px;
            cursor: pointer;
        }

        .modal-buttons {
            margin-top: 20px;
        }

        .modal-buttons button {
            padding: 10px 15px;
            margin: 10px;
            cursor: pointer;
            font-size: 16px;
        }

        .randomize-btn {
            height: 50px;
		    width:14em;
		    border-radius: 40px;
		    background-color: #000000;
		    color: white;
        }

        .order-btn {
            height: 50px;
		    width:14em;
		    border-radius: 40px;
		    background-color: #000000;
		    color: white;
        }
    
    </style>
    
</head>
<body>
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
    <div class="hero">
        <div class="meta">
           <div class="tagline"><p id="tag">Craving Something Delicious? We Deliver Happiness to Your Door!</p></div>
        </div>
    </div>
</div>

<section>
    <div class="title">Explore Our Category</div>
    <div class="boxes">
        <div class="box">
            <img src="imgs\snacks.webp" height="150px" width="150px">
            <div class="text"> 
                <p class="txt">Snacks</p>
                <p class="subt">Bite-sized delights packed with big flavors—your perfect snack awaits!🥨😋</p></div>
        </div>
        <div class="box">
            <div class="ig"><img src="imgs\main_course.jpg" height="150px"></div>
            <div class="text"> 
                <p class="txt">Main Course</p>
                <p class="subt">From classic comfort food to bold new flavors, we serve happiness on a plate!🍽😋</p></div>
        </div>
        <div class="box">
            <div class="ig"><img src="imgs\deserts.jpg" height="150px"></div>
            <div class="text"> 
                <p class="txt">Desserts</p>
                <p class="subt">Satisfy your sweet tooth with every creamy, dreamy bite!🍫🍨</p></div>
        </div>
        <div class="box">
            <div class="ig"><img src="imgs\drinks.avif" height="150px"></div>
            <div class="text"> 
                <p class="txt">Drinks</p>
                <p class="subt">From fruity to frothy, we’ve got a drink for every craving!🍊🍶</p></div>
        </div>
        <div class="exp"><a href="Menupage.jsp"><button class="expl">Explore More</button></a></div>
    </div>
</section>

<section class="se2">
        <div class="content">
            <div class="surprise">
                <div class="tlt">Don't Know What to eat?</div>
                <div class="subtxt">Try out our Get dish button</div>
                <button id="randomizeBtn" class="surp">Get a Dish</button>
                <p id="result"></p>
            </div>
            <div class="vid"><video src="imgs/7172270-uhd_3840_2160_25fps.mp4" height="200px" width="300px" autoplay muted> </video></div>
        </div>
    </section>

    <div id="dishModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2 id="dishName">Dish Name</h2>
            <img id="dishImage" src="" alt="Dish Image">
            <div class="modal-buttons">
                <button class="randomize-btn" onclick="fetchRandomDish()">Randomize Again</button>
                <button class="order-btn" id="orderBtn">Order Now</button>
            </div>
        </div>
    </div>

    <script>
        document.getElementById("randomizeBtn").addEventListener("click", fetchRandomDish);
        document.querySelector(".close").addEventListener("click", function() {
            document.getElementById("dishModal").style.display = "none";
        });

        function fetchRandomDish() {
            fetch("RandomServlet")
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error);
                    } else {
                        document.getElementById("dishName").innerText = data.name;
                        document.getElementById("dishImage").src = data.image;
                        document.getElementById("orderBtn").onclick = function() {
                            window.location.href = "order_pg.jsp?dish_id=" + data.id;
                        };
                        document.getElementById("dishModal").style.display = "block";
                    }
                })
                .catch(error => console.error("Error fetching dish:", error));
        }
    </script>

<section>
<div class="best">
    <div class="sellingt">Our best selling food</div>
    <div class="boxes1">
        <div class="box1">
            <img src="imgs/mixveg.webp" height="120px" width="120px">
            <div class="text1"> 
                <p class="txt1">Mix Veg</p>
                <p class="subt1">A flavorful mix of fresh seasonal veggies.🥕<br>Healthy, hearty, and<br>delicious!🥗
                </p></div>
        </div>
        <div class="box1">
            <img src="imgs/pizza.jpg" height="120px" width="120px">
            <div class="text1"> 
                <p class="txt1">Pizza</p>
                <p class="subt1">Crispy crust with rich<br>cheese and toppings.🍕<br>A perfect bite every<br>time!😋
                </p></div>
        </div>
        <div class="box1">
            <img src="imgs/chocolatecake.jpg" height="120px" width="120px">
            <div class="text1"> 
                <p class="txt1">Chocolate Cake</p>
                <p class="subt1">Soft, rich, and full of<br>chocolatey goodness.🍫<br>A dessert lover’s<br>dream!🍩
                </p></div>
        </div>
    </div>
</div>
</section>


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
            <li><a href="aboutus.jsp">About Us </a></li>
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