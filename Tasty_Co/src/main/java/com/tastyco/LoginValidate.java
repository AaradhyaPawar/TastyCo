package com.tastyco;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginValidate")
public class LoginValidate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (email == null || email.isBlank() || password == null || password.isBlank()) {
            out.print("<h2>Invalid input. Please provide both email and password.</h2>");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.include(request, response);
            return;
        }

        try (Connection conn = DBConnection.connect()) {
            if (conn == null) {
                throw new SQLException("Unable to obtain database connection");
            }

            String sql = "SELECT id, username, password FROM users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String storedPassword = rs.getString("password");
                        boolean passwordMatches = PasswordUtil.verifyPassword(password, storedPassword)
                                || password.equals(storedPassword);

                        if (passwordMatches) {
                            if (!PasswordUtil.verifyPassword(password, storedPassword)) {
                                String hashed = PasswordUtil.hashPassword(password);
                                String updateSql = "UPDATE users SET password = ? WHERE id = ?";
                                try (PreparedStatement update = conn.prepareStatement(updateSql)) {
                                    update.setString(1, hashed);
                                    update.setInt(2, id);
                                    update.executeUpdate();
                                }
                            }

                            HttpSession session = request.getSession();
                            session.setAttribute("user", username);
                            session.setAttribute("userId", id);
                            response.sendRedirect("index.jsp");
                            return;
                        }
                    }
                }
            }

            out.print("<h2>Invalid Credentials : Please Relogin</h2>");
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            view.include(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h2>Login failed due to server error.</h2>");
        }
    }
}
