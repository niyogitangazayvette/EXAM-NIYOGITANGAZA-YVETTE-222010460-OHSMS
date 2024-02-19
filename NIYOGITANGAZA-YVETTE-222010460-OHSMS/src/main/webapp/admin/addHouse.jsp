<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="ohsms.ConnectionDatabase" %>
<jsp:include page="adminheader.jsp" />
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2 class="text-center">Add House</h2>
            </div>
            <div class="card-body">
                <form action="addHouseAction.jsp" method="post">
                    <div class="mb-3">
                        <label for="upiNumber" class="form-label">UPI Number</label>
                        <input type="text" class="form-control" name="upiNumber" required>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" name="description" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="text" class="form-control" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="location" class="form-label">Location</label>
                        <input type="text" class="form-control" name="location" required>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-control" name="status">
                            <option value="Available">Available</option>
                            <option value="Sold">Sold</option>
                            <!-- Add other options if needed -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="sellerId" class="form-label">Seller ID</label>
                        <!-- Include a selection form for users with their IDs as values -->
                        <select class="form-control" name="sellerId" required>
                            <!-- Fetch and populate user IDs from the database -->
                            <% 
                                try {
                                    Connection con = ConnectionDatabase.getCon();
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM user");

                                    // Iterate through the result set and create options
                                    while (rs.next()) {
                            %>
                            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
                            <% 
                                    }
                                    con.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Add House</button>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="adminfooter.jsp" />

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
