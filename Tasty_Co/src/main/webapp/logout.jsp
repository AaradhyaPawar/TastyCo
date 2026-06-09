<%@ page import="javax.servlet.http.HttpSession" %>

<%
HttpSession sessionObj1 = request.getSession(false);
String username = (sessionObj1 != null) ? (String) sessionObj1.getAttribute("user") : null;
%>

<!-- Navbar Section -->
<div style="background-color: #f8f9fa; padding: 10px; text-align: right;">
    <% if (username != null) { %>
        <span>Welcome, <%= username %>!</span> |
        <a href="LogoutServlet" style="color: red; text-decoration: none;">Logout</a>
    <% } else { %>
        <a href="login.jsp" style="color: blue; text-decoration: none;">Login</a>
    <% } %>
</div>
