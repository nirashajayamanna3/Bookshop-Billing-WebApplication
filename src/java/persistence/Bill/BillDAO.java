package persistence.Bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.sql.Timestamp;
import persistence.DBConnection;

public class BillDAO {

    public static void saveBill(String customerName, String customerPhone, Date billDate, double totalAmount) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO bill (customer_name, customer_phone, bill_date, total_amount) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, customerName);
            pstmt.setString(2, customerPhone);
            pstmt.setTimestamp(3, new Timestamp(billDate.getTime()));
            pstmt.setDouble(4, totalAmount);

            pstmt.executeUpdate();

        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
}