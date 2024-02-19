package ohsms; // Replace with your actual package name

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDatabase {
    // Method to get a database connection
    public static Connection getCon() throws SQLException {
        // Load the MySQL JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Log the exception or throw a more specific exception
            throw new SQLException("MySQL JDBC Driver not found", e);
        }

        // Establish the database connection
        String jdbcUrl = "jdbc:mysql://localhost:3306/ niyogitangaza-yvette-222010460-ohsms"; // JDBC URL for the MySQL database
        String username = "root"; // Database username
        String password = ""; // Database password (if any)

        try {
            return DriverManager.getConnection(jdbcUrl, username, password);
        } catch (SQLException e) {
            // Log the exception or throw a more specific exception
            throw new SQLException("Error establishing database connection", e);
        }
    }
}
