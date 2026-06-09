package com.tastyco;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/TransactionServlet")
@MultipartConfig(maxFileSize = 16177215) // Limit file size for uploaded receipts
public class TransactionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DBConnection.connect()) {
            if (conn == null) {
                throw new SQLException("Unable to obtain database connection");
            }

            // Retrieve form data
            String orderIdStr = request.getParameter("order-id");
            String totalAmountStr = request.getParameter("total-amount");
            String transactionNumberStr = request.getParameter("transaction-id");
            Part filePart = request.getPart("receipt-upload");

            if (orderIdStr == null || totalAmountStr == null || transactionNumberStr == null || filePart == null || filePart.getSize() == 0) {
                response.getWriter().println("Error: Missing or invalid form data.");
                return;
            }

            int orderId = Integer.parseInt(orderIdStr);
            double totalAmount = Double.parseDouble(totalAmountStr);
            long transactionNumber = Long.parseLong(transactionNumberStr);

            try (InputStream fileContent = filePart.getInputStream()) {
                byte[] imageBytes = fileContent.readAllBytes();

                String sql = "INSERT INTO transactions (transac_number, order_id, total_amount_paid, transc_date, imgs) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setLong(1, transactionNumber);
                    stmt.setInt(2, orderId);
                    stmt.setDouble(3, totalAmount);
                    stmt.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                    stmt.setBytes(5, imageBytes);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        response.sendRedirect("thankyou.jsp");
                    } else {
                        response.getWriter().println("Transaction failed. Please try again.");
                    }
                }
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Error: Invalid number format. Please check input values.");
            e.printStackTrace();
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
