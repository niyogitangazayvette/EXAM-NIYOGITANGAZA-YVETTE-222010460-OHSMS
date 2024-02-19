<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="ohsms.ConnectionDatabase" %>
<jsp:include page="adminheader.jsp" />

<%
try {
    Connection con = ConnectionDatabase.getCon();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT house.*, user.name AS sellerName FROM house INNER JOIN user ON house.sellerId = user.id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Houses</title>
    <!-- Include Bootstrap CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>List of Houses</h2>

    <!-- Add House Button -->
    <a href="addHouse.jsp" class="btn btn-success mb-3">Add House</a>

    <% 
    // Check if the result set is not empty
    if (rs.next()) {
    %>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>UPI Number</th>
                <th>Description</th>
                <th>Price</th>
                <th>Location</th>
                <th>Seller Name</th>
                <th>Status</th>
                <!-- Add more columns as needed -->
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            // Iterate through the result set and display house information
            do {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("upiNumber") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getBigDecimal("price") %></td>
                <td><%= rs.getString("location") %></td>
                <td><%= rs.getString("sellerName") %></td>
                <td><%= rs.getString("status") %></td>
                <!-- Add more cells for additional columns -->
                <td>
                    <!-- Update Button -->
                    <a href="updateHouse.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Update</a>
                    <!-- Delete Button -->
                    <a href="deleteHouse.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <%
            } while (rs.next());
            %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>No houses found.</p>
    <%
    }
    %>

</div>
<jsp:include page="adminfooter.jsp" />
<!-- Include Bootstrap JS and Popper.js -->
<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
