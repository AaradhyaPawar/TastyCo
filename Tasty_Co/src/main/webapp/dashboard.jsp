<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>

<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || sessionObj.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");  // Redirect to login if not logged in
}
%>
<%@ include file="logout.jsp" %>


<html>
<head><title>Dashboard</title></head>
<body>
    <h2>Welcome, <%= sessionObj.getAttribute("user") %>!</h2>
    <a href="LogoutServlet">Logout</a>
</body>
</html>
