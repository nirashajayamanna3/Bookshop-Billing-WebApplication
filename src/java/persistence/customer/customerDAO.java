/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistence.customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import persistence.DBConnection;

public class customerDAO {

    // Replace with your actual DB connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; // Your DB password

    public static String getCustomerNameByPhone(String phone) {
        String name = null;

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT name FROM customers WHERE phone = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return name;
    }


    // Helper method to connect to the database
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);
    }

    // Insert a new customer
    public void addCustomer(customer customer) throws SQLException {
        String sql = "INSERT INTO customers (accountNumber, name, address, phone, email) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getAccountNumber());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getPhone());
            stmt.setString(5, customer.getEmail());

            stmt.executeUpdate();
        }
    }

    // Retrieve all customers
    public List<customer> getAllCustomers() throws SQLException {
        List<customer> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                customer customer = new customer();
                customer.setAccountNumber(rs.getString("accountNumber"));
                customer.setName(rs.getString("name"));
                customer.setAddress(rs.getString("address"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));

                customers.add(customer);
            }
        }

        return customers;
    }

    // Retrieve one customer by account number (optional, for search/update)
    public customer getCustomerByAccountNumber(String accountNumber) throws SQLException {
        String sql = "SELECT * FROM customers WHERE accountNumber = ?";
        customer customer = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accountNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    customer = new customer();
                    customer.setAccountNumber(rs.getString("accountNumber"));
                    customer.setName(rs.getString("name"));
                    customer.setAddress(rs.getString("address"));
                    customer.setPhone(rs.getString("phone"));
                    customer.setEmail(rs.getString("email"));
                }
            }
        }

        return customer;
    }

    // Delete a customer
    public void deleteCustomer(String accountNumber) throws SQLException {
        String sql = "DELETE FROM customers WHERE accountNumber = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, accountNumber);
            stmt.executeUpdate();
        }
    }

    // Update an existing customer (optional)
    public void updateCustomer(customer customer) throws SQLException {
        String sql = "UPDATE customers SET name=?, address=?, phone=?, email=? WHERE accountNumber=?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPhone());
            stmt.setString(4, customer.getEmail());
            stmt.setString(5, customer.getAccountNumber());

            stmt.executeUpdate();
        }
    }

    public customer getCustomerByName(String name) {
         customer c = null;
    try {
        Connection conn = getConnection();
        String sql = "SELECT * FROM customers WHERE name = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            c = new customer();
            c.setAccountNumber(rs.getString("accountNumber"));
            c.setName(rs.getString("name"));
            c.setAddress(rs.getString("address"));
            c.setPhone(rs.getString("phone"));
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return c;
    }
}

