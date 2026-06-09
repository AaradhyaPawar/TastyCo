package com.tastyco;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        StringBuilder sb = new StringBuilder();

        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        JSONArray orderArray;
        try {
            orderArray = new JSONArray(sb.toString());
        } catch (Exception e) {
            out.print("Invalid order data.");
            return;
        }

        if (orderArray.length() == 0) {
            out.print("No items were submitted for the order.");
            return;
        }

        try (Connection conn = DBConnection.connect()) {
            if (conn == null) {
                throw new SQLException("Unable to obtain database connection");
            }

            String sql = "INSERT INTO Orders (user_id, dish_id, amount, quantity, order_date) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                LocalDate orderDate = LocalDate.now();
                int insertedCount = 0;

                for (int i = 0; i < orderArray.length(); i++) {
                    JSONObject orderItem = orderArray.getJSONObject(i);
                    String dishName = orderItem.optString("item_name");
                    double price = orderItem.optDouble("price", -1);
                    int quantity = orderItem.optInt("quantity", 0);

                    if (dishName.isBlank() || price < 0 || quantity <= 0) {
                        continue;
                    }

                    int dishId = getDishId(conn, dishName);
                    if (dishId != -1) {
                        pstmt.setInt(1, userId);
                        pstmt.setInt(2, dishId);
                        pstmt.setDouble(3, price * quantity);
                        pstmt.setInt(4, quantity);
                        pstmt.setDate(5, Date.valueOf(orderDate));
                        pstmt.addBatch();
                        insertedCount++;
                    }
                }

                if (insertedCount == 0) {
                    out.print("No valid order items were found.");
                    return;
                }

                pstmt.executeBatch();
                out.print("Order placed successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("Error placing order: " + e.getMessage());
        }
    }

    private int getDishId(Connection conn, String dishName) throws SQLException {
        String sql = "SELECT dish_id FROM dishes WHERE name = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dishName);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("dish_id");
                }
            }
        }
        return -1;
    }
}
