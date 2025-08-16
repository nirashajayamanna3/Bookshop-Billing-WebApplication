package Controller;

import persistence.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBillServlet")
public class UpdateBillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String billIdStr = request.getParameter("billId");
        String status = request.getParameter("status");

        if (billIdStr == null || billIdStr.trim().isEmpty() || status == null || status.trim().isEmpty()) {
            response.sendRedirect("manageBill.jsp?message=Invalid+Input");
            return;
        }

        try {
            int billId = Integer.parseInt(billIdStr);

            Connection con = DBConnection.getConnection();
            String sql = "SELECT customerName, phone, billDate, totalAmount, status FROM bill WHERE billId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rs.getString("customerName");
                rs.getString("phone");
                rs.getString("billDate");
                rs.getDouble("totalAmount");
                rs.getString("status");
            }

            int rowsUpdated = ps.executeUpdate();
            con.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("manageBill.jsp?message=Bill+Updated+Successfully");
            } else {
                response.sendRedirect("manageBill.jsp?message=Bill+Not+Found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageBill.jsp?message=Error+Updating+Bill");
        }
    }
}
