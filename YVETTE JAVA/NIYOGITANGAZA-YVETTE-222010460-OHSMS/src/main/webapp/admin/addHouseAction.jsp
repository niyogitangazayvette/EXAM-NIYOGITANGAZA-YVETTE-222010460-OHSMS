<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="ohsms.ConnectionDatabase" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    try {
        // Retrieve form parameters
        String upiNumber = request.getParameter("upiNumber");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String location = request.getParameter("location");
        String status = request.getParameter("status");
        int sellerId = Integer.parseInt(request.getParameter("sellerId"));

        // Parse the price string to a BigDecimal (adjust as needed)
        BigDecimal price = new BigDecimal(priceStr);

        Connection con = ConnectionDatabase.getCon();
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO house (upiNumber, description, price, location, sellerId, status) VALUES (?, ?, ?, ?, ?, ?)");

        // Set the parameters for the prepared statement
        pstmt.setString(1, upiNumber);
        pstmt.setString(2, description);
        pstmt.setBigDecimal(3, price);
        pstmt.setString(4, location);
        pstmt.setInt(5, sellerId);
        pstmt.setString(6, status);

        // Execute the query
        pstmt.executeUpdate();

        con.close();

        // Redirect to the listing page after successful insertion
        response.sendRedirect("admin_houses.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions as needed, for example, display an error message
%>
        <html>
        <head>
            <title>Error</title>
        </head>
        <body>
            <h2>Error occurred while adding the house.</h2>
            <p><%= e.getMessage() %></p>
        </body>
        </html>
<%
    }
%>
