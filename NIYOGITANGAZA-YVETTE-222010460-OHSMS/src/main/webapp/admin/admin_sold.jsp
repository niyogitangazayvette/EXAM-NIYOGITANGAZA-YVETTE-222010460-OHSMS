<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="ohsms.ConnectionDatabase" %>
<jsp:include page="adminheader.jsp" />
<html>
<head>
    <title>Admin Sold Houses</title>
    <!-- Include Bootstrap CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <!-- Display list of sold houses -->
    <h1>Sold Houses</h1>
    <table class="table">
        <thead>
            <tr>
                <th>House ID</th>
                <th>UPI Number</th>
                <th>Description</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                Connection con = ConnectionDatabase.getCon();
                // Fetch houses from the house table that have the status of "Sold"
                PreparedStatement psHouse = con.prepareStatement("SELECT * FROM house WHERE status = 'Sold'");
                ResultSet rsHouse = psHouse.executeQuery();

                while (rsHouse.next()) {
                    int houseId = rsHouse.getInt("id");
                    // Check if the house exists in the payment table and has the status of "Pending"
                    PreparedStatement psPayment = con.prepareStatement("SELECT * FROM payment WHERE houseId = ? AND status = 'Pending'");
                    psPayment.setInt(1, houseId);
                    ResultSet rsPayment = psPayment.executeQuery();

                    // If the house exists in the payment table and has the status of "Pending", display it
                    if (rsPayment.next()) {
            %>
            <tr>
                <td><%= houseId %></td>
                <td><%= rsHouse.getString("upiNumber") %></td>
                <td><%= rsHouse.getString("description") %></td>
                <td><%= rsHouse.getBigDecimal("price") %></td>
                <td><%= rsHouse.getString("status") %></td>
                <td>
                    <!-- Add buttons for approve and cancel actions -->
                    <button onclick="approveSale(<%= houseId %>)" class="btn btn-success">Approve</button>
                    <button onclick="cancelSale(<%= houseId %>)" class="btn btn-danger">Cancel</button>
                </td>
            </tr>
            <%
                    }
                    rsPayment.close();
                    psPayment.close();
                }
                rsHouse.close();
                psHouse.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</div>
<br>
<jsp:include page="adminfooter.jsp" />

<!-- Include Bootstrap JS and Popper.js -->
<script src="../bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript functions for handling approve and cancel actions -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Your existing JavaScript code -->

<script>
    function approveSale(houseId) {
        // Send AJAX request to approvePayment.jsp to update payment status
        $.ajax({
            url: 'approvePayment.jsp',
            type: 'POST',
            data: {
                houseId: houseId
            },
            success: function(response) {
                // Handle success response
                console.log(response);
                alert("Payment approved for House ID: " + houseId);
            },
            error: function(error) {
                // Log the entire error object to the console for debugging
                console.error("Error object:", error);
                alert("Error approving payment for House ID. Please check the console for details.");
            }
        });
    }

    function cancelSale(houseId) {
        // Send AJAX request to cancelPayment.jsp to update payment status
        $.ajax({
            url: 'cancelPayment.jsp',
            type: 'POST',
            data: {
                houseId: houseId
            },
            success: function(response) {
                // Handle success response
                console.log(response);
                alert("Payment canceled for House ID: " + houseId);
            },
            error: function(error) {
                // Log the entire error object to the console for debugging
                console.error("Error object:", error);
                alert("Error canceling payment for House ID. Please check the console for details.");
            }
        });
    }
</script>

<!-- Your existing JavaScript code -->

</body>
</html>
