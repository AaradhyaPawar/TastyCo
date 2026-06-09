package com.tastyco;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet("/HealthServlet")
public class HealthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"error\": \"User not logged in\"}");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int nutritious = 0, indulgent = 0;

        try {
            con = DBConnection.connect();

            // Get all orders for the current user
            ps = con.prepareStatement("SELECT dish_id FROM orders WHERE user_id = ?");
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            List<Integer> dishIds = new ArrayList<>();
            while (rs.next()) {
                dishIds.add(rs.getInt("dish_id"));
            }
            rs.close();
            ps.close();

            // Count Nutritious and Indulgent based on dish_id status
            ps = con.prepareStatement("SELECT status FROM dishes WHERE dish_id = ?");
            for (int dishId : dishIds) {
                ps.setInt(1, dishId);
                rs = ps.executeQuery();
                if (rs.next()) {
                    int status = Integer.parseInt(rs.getString("status"));
                    if (status == 1) {
                        nutritious++;
                    } else {
                        indulgent++;
                    }
                }
                rs.close();
            }
            ps.close();

            // Insert or Update Health Table
            ps = con.prepareStatement("INSERT INTO health (user_id, nutritious, indulgent) VALUES (?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE nutritious = VALUES(nutritious), indulgent = VALUES(indulgent)");
            ps.setInt(1, userId);
            ps.setInt(2, nutritious);
            ps.setInt(3, indulgent);
            ps.executeUpdate();

            // Send JSON response
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("nutritious", nutritious);
            jsonResponse.put("indulgent", indulgent);

            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Internal Server Error\"}");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
