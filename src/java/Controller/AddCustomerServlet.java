package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import persistence.DBConnection;

@WebServlet(name = "AddCustomerServlet", urlPatterns = {"/AddCustomerServlet"})
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // Ensure proper encoding for form data

        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO customers (accountNumber, name, address, phone, email) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNumber);
            stmt.setString(2, name);
            stmt.setString(3, address);
            stmt.setString(4, phone);
            stmt.setString(5, email);

            stmt.executeUpdate();

            // Redirect to customer details page after successful insert
            response.sendRedirect("CustomerDetails.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: redirect GET requests to a form
        response.sendRedirect("AddCustomerForm.jsp");
    }
}
