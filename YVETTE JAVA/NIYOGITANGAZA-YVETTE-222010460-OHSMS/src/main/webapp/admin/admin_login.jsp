<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
    <title>Admin Login</title>
    <!-- Include Bootstrap CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Admin Login</h2>
                </div>
                <div class="card-body">
                    <form action="admin_loginAction.jsp" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>

                            <!-- Add the "Signup" button -->
                          <!--  <a href="admin_signup.jsp" class="btn btn-success">Signup</a> -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and Popper.js -->
<script src="path/to/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
