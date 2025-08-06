package persistence.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import persistence.DBConnection;

public class ProductDAO {

    // Add a new product
    public void addProduct(Product product) throws Exception {
        String sql = "INSERT INTO item (product_code, product_name, description, unit_price, discount, tax) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getProductCode());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setDouble(4, product.getUnitPrice());
            ps.setDouble(5, product.getDiscount());
            ps.setDouble(6, product.getTax());

            ps.executeUpdate();
        }
    }

    // Update existing product
    public void updateProduct(Product product) throws Exception {
        String sql = "UPDATE item SET product_name = ?, description = ?, unit_price = ?, discount = ?, tax = ? WHERE product_code = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getUnitPrice());
            ps.setDouble(4, product.getDiscount());
            ps.setDouble(5, product.getTax());
            ps.setString(6, product.getProductCode());

            ps.executeUpdate();
        }
    }

    // Delete a product by productCode
    public void deleteProduct(String productCode) throws Exception {
        String sql = "DELETE FROM item WHERE product_code = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, productCode);
            ps.executeUpdate();
        }
    }

    // Get product by code
    public Product getProductByCode(String productCode) throws Exception {
        String sql = "SELECT * FROM item WHERE productCode = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, productCode);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                        rs.getString("product_code"),
                        rs.getString("product_name"),
                        rs.getString("description"),
                        rs.getDouble("unit_price"),
                        rs.getDouble("discount"),
                        rs.getDouble("tax")
                    );
                }
            }
        }
        return null;
    }

    // Get all products
    public List<Product> getAllProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM item";
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Product product = new Product(
                    rs.getString("product_code"),
                    rs.getString("product_name"),
                    rs.getString("description"),
                    rs.getDouble("unit_price"),
                    rs.getDouble("discount"),
                    rs.getDouble("tax")
                );
                products.add(product);
            }
        }
        return products;
    }
}
