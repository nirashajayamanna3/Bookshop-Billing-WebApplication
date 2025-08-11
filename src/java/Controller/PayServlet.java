package Controller;

import business.BillItem;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.List;
import persistence.DBConnection;

@WebServlet("/pay")
public class PayServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/home.jsp");
            return;
        }

        // Get cart and customer info from session
        @SuppressWarnings("unchecked")
        List<BillItem> cart = (List<BillItem>) session.getAttribute("cart");
        String customerName = (String) session.getAttribute("customerName");
        String customerPhone = (String) session.getAttribute("customerPhone");
        String customerAddress = (String) session.getAttribute("customerAddress");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("Invoice.jsp?error=Cart is empty");
            return;
        }

        Connection con = null;
        PreparedStatement psBill = null;
        PreparedStatement psItem = null;
        ResultSet rs = null;
        int billId = 0;

        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // 1. Insert bill header
            String sqlBill = "INSERT INTO Bill (customerName, customerPhone, customerAddress, billDate) VALUES (?, ?, ?, NOW())";
            psBill = con.prepareStatement(sqlBill, Statement.RETURN_GENERATED_KEYS);
            psBill.setString(1, customerName);
            psBill.setString(2, customerPhone);
            psBill.setString(3, customerAddress);
            psBill.executeUpdate();

            rs = psBill.getGeneratedKeys();
            if (rs.next()) {
                billId = rs.getInt(1);
            }

            // 2. Insert bill items
            String sqlItem = "INSERT INTO BillItem (billId, productCode, productName, quantity, unitPrice, discount) VALUES (?, ?, ?, ?, ?, ?)";
            psItem = con.prepareStatement(sqlItem);
            for (BillItem item : cart) {
                psItem.setInt(1, billId);
                psItem.setString(2, item.getProductCode());
                psItem.setString(3, item.getProductName());
                psItem.setInt(4, item.getQuantity());
                psItem.setDouble(5, item.getUnitPrice());
                psItem.setDouble(6, item.getDiscount());
                psItem.addBatch();
            }
            psItem.executeBatch();

            con.commit();

            // 3. Pass data to JSP
            request.setAttribute("cart", cart);
            request.setAttribute("customerName", customerName);
            request.setAttribute("customerPhone", customerPhone);
            request.setAttribute("customerAddress", customerAddress);
            request.setAttribute("billId", billId);

            // Optionally clear cart
            session.removeAttribute("cart");

            request.getRequestDispatcher("Invoice.jsp").forward(request, response);

        } catch (Exception e) {
            try {
                if (con != null) con.rollback();
            } catch (SQLException ignored) {}
            throw new ServletException(e);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (psBill != null) psBill.close(); } catch (Exception ignored) {}
            try { if (psItem != null) psItem.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }

    // Optional: GET can redirect to cart or home
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("home.jsp");
    }
}
