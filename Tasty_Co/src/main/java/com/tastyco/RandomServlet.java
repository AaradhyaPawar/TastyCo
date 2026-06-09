package com.tastyco;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/RandomServlet")
public class RandomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Connection conn = DBConnection.connect();
        if (conn == null) {
            response.getWriter().write("{\"error\": \"Database connection failed!\"}");
            return;
        }

        String query = "SELECT dish_id, name, img_url FROM dishes ORDER BY RAND() LIMIT 1";

        try (PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                int id = rs.getInt("dish_id");
                String itemName = rs.getString("name");
                String imageUrl = rs.getString("img_url");

                JSONObject json = new JSONObject();
                json.put("id", id);
                json.put("name", itemName);
                json.put("image", imageUrl);

                response.getWriter().write(json.toString());
            } else {
                response.getWriter().write("{\"error\": \"No item found!\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"An error occurred!\"}");
        } finally {
            try { conn.close(); } catch (Exception ignored) {}
        }
    }
}
