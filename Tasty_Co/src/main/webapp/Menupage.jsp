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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu | TastyCo</title>
    <link rel="stylesheet" href="Menupage.css">
</head>
<body>

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

    <div class="menu-container">
        <h1>View Our Menu</h1>
        <div class="menu-grid">
            <div class="menu-item">
                <img src="imgs\snacks.webp" alt="Snacks">
                <h2>Snacks</h2>
                <a href="order_pg.jsp#snacks"><button>Explore</button></a>
            </div>
            <div class="menu-item">
                <img src="imgs\main_course.jpg" alt="Main Course">
                <h2>Main Course</h2>
                <a href="order_pg.jsp#maincourse"><button>Explore</button></a>
            </div>
            <div class="menu-item">
                <img src="imgs\deserts.jpg" alt="Desserts">
                <h2>Desserts</h2>
                <a href="order_pg.jsp#desserts"><button>Explore</button></a>
            </div>
            <div class="menu-item">
                <img src="imgs\drinks.avif" alt="Drinks">
                <h2>Drinks</h2>
                <a href="order_pg.jsp#drinks"><button>Explore</button></a>
            </div>
        </div>
    </div>
    
</body>
</html>
