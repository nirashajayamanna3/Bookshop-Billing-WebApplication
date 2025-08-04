package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load driver
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bookstore", "root", ""); // DB URL, user, pass
        } catch (ClassNotFoundException | SQLException e) {
        }
        return conn;
    }

}

