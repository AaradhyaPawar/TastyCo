<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Food Order</title>
    <link rel="stylesheet" href="css.css">
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginValidate" method="POST">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
    </div>
</body>
</html>
