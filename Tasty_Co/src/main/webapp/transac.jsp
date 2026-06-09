<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transactions</title>
    <link rel="stylesheet" href="transaction.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
</head>
<body>

    <div class="transaction-page">
        <div class="transaction-container">
            <h1 class="company-name">TastyCo</h1>

            <h2>Transaction Summary</h2>

            <form action="TransactionServlet" method="post" enctype="multipart/form-data">
                <div class="details">
                    <label for="order-id"><strong>Order ID:</strong></label>
                    <input type="number" id="order-id" name="order-id-display" disabled>
                    <input type="hidden" id="order-id-hidden" name="order-id"> <!-- Hidden input -->

                    <br>
                    <label for="total-amount"><strong>Total Amount (Rs):</strong></label>
                    <input type="number" id="total-amount" name="total-amount-display" disabled>
                    <input type="hidden" id="total-amount-hidden" name="total-amount"> <!-- Hidden input -->
                </div>

                <!-- QR Code Section -->
                <div class="qr-section">
                    <h2>Pay Here</h2>
                    <div id="qrcode"></div>
                </div>

                <!-- Transaction ID Section -->
                <div class="transaction-id-section">
                    <h3>Enter Transaction ID</h3>
                    <input type="text" id="transaction-id" name="transaction-id" placeholder="Enter Transaction ID" required>
                </div>

                <!-- Upload Receipt Section -->
                <div class="upload-section">
                    <h2>Upload Receipt</h2>
                    <input type="file" id="receipt-upload" name="receipt-upload" accept="image/*" required>
                    <p id="error-message" class="error-message"></p>
                </div>

                <button type="submit" class="confirm-btn">Submit</button>
            </form>
        </div>
    </div>

    <script>
        // Generate QR Code
        var qrcode = new QRCode(document.getElementById("qrcode"), {
            text: "https://your-payment-link.com",
            width: 150,
            height: 150
        });

        // Auto-generate Order ID and Retrieve Total Amount
        document.addEventListener("DOMContentLoaded", function () {
            let lastOrderId = localStorage.getItem("lastOrderId") || 100;
            lastOrderId = parseInt(lastOrderId) + 1;
            localStorage.setItem("lastOrderId", lastOrderId);

            // Set Order ID in both input fields
            document.getElementById("order-id").value = lastOrderId;
            document.getElementById("order-id-hidden").value = lastOrderId; // Hidden input

            let totalAmount = sessionStorage.getItem("totalAmount") || "0";
            document.getElementById("total-amount").value = totalAmount;
            document.getElementById("total-amount-hidden").value = totalAmount; // Hidden input
        });
    </script>
    
</body>
</html>
