package persistence.Bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import persistence.DBConnection;

public class BillDAO {

    public int saveBill(Bill bill) throws SQLException {
        // Match column names in DB exactly
        String sql = "INSERT INTO bill (billId,accountNumber, name, total, date,status) VALUES (?, ?, ?, ?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            
            ps.setString(1, bill.getBillId());
            ps.setString(3, bill.getCustomerName());
            ps.setString(2, bill.getAccountNumber());
            ps.setString(4, bill.getPhone());
            ps.setDouble(5, bill.getTotalAmount());
            ps.setString(6, bill.getStatus().name()); // Enum -> String

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        }
        return -1;
    }
}
