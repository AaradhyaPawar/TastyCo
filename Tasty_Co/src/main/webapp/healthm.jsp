<%@ page contentType="text/html; charset=UTF-8" %>
<% 
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");  // Redirect if not logged in
    }
%>
<%@ include file="logout.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TastyCo Health Meter</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="health.css">
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
        </div>
    </nav>
</div>

    <h1>🍏 TastyCo Health Meter 🍔</h1>

    <div class="chart-container">
        <canvas id="healthChart"></canvas>
    </div>

    <p id="statusText">Status: Loading...</p>
    <button onclick="updateHealthMeter()">Update Meter</button>

    <script>
        const ctx = document.getElementById("healthChart").getContext("2d");

        let healthChart = new Chart(ctx, {
            type: "pie",
            options: {
                responsive: false,
                maintainAspectRatio: false
            },
            data: {
                labels: ["Nutritious", "Indulgent"],
                datasets: [{
                    data: [50, 50], // Default values, will be updated from backend
                    backgroundColor: ["#2ecc71", "#e74c3c"]
                }]
            }
        });

        function updateHealthMeter() {
            fetch("http://localhost:8080/Tasty_Co/HealthServlet", { 
                method: "POST",  // Change to POST
                headers: { "Content-Type": "application/json" }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(data => {
                let total = data.nutritious + data.indulgent;
                let nutritiousPercent = (data.nutritious / total) * 100;
                let indulgentPercent = (data.indulgent / total) * 100;

                healthChart.data.datasets[0].data = [nutritiousPercent, indulgentPercent];
                healthChart.update();

                document.getElementById("statusText").innerText = 
                    "Status: " + (nutritiousPercent > indulgentPercent ? "Healthy" : "Unhealthy");
            })
            .catch(error => console.error("Error fetching health data:", error));
        }
        
    </script>

</body>
</html>
