package persistence.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import persistence.DBConnection;

public class UserDAO {
    private Connection conn;

    // Constructor to accept a connection
    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    // Get all users
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user_new";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setType(rs.getString("type"));
                users.add(user);
            }
        }

        return users;
    }

    // Get one user by ID
    public User getUserByID(int id) throws SQLException {
        String sql = "SELECT * FROM user_new WHERE id = ?";
        User user = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setType(rs.getString("type"));
                }
            }
        }

        return user;
    }

    // Add a new user
    public void addUser(User user) throws SQLException {
        String sql = "INSERT INTO user_new (name, username, password, type) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getType());

            stmt.executeUpdate();
        }
    }

    // Update an existing user
    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE user_new SET name=?, username=?, password=?, type=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getType());
            stmt.setInt(5, user.getId());

            stmt.executeUpdate();
        }
    }

    // Delete a user
    public void deleteUser(int id) throws SQLException {
        String sql = "DELETE FROM user_new WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
