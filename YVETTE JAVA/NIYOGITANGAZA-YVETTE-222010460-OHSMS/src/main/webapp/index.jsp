<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="ohsms.ConnectionDatabase" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Online House Selling Management System</title>

    <!-- Include Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Welcome to Online House Selling Management System</h1>
        <p>Explore our platform to buy and sell houses online.</p>

        <div class="mt-3">
            <a href="signup.jsp" class="btn btn-primary">Signup</a>
            <a href="login.jsp" class="btn btn-secondary">user login</a>
             <a href="admin/admin_login.jsp" class="btn btn-primary">Admin Login</a>
        </div>
    </div>
    <br><br><br><br>
    <footer class="footer mt-auto py-3" style="background-color: #f8f9fa; border-top: 1px solid #dee2e6;">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>Address</h5>
                <p>Your Company</p>
                <p>123 Street Name</p>
                <p>City, State ZIP</p>
                <p>Country</p>
            </div>
            <div class="col-md-4">
                <h5>Contact</h5>
                <p>Email: info@yourcompany.com</p>
                <p>Phone: +1234567890</p>
            </div>
            <div class="col-md-4">
                <h5>System Settings</h5>
                <p>Version: 1.0</p>
                <p>Language: English</p>
                <!-- Add button to create tables -->
                <!-- <form action="create_tables.jsp" method="post">
                    <button type="submit" class="btn btn-primary">Create Tables</button>
                </form><br> -->
                <!-- Add button to redirect to admin login form -->
                
            </div>
        </div>
    </div>
</footer>


    

    <!-- Include Bootstrap JS and Popper.js if needed -->
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
