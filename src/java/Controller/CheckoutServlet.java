package Controller;

import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import persistence.Bill.BillDAO;



@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve data from the request parameters
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        // Get the current date
        Date billDate = new Date();

        try {
            // Call the DAO method to save the bill
            BillDAO.saveBill(customerName, customerPhone, billDate, totalAmount);

            // Clear the cart and customer session data after successful checkout
            session.removeAttribute("cart");
            session.removeAttribute("customerName");
            session.removeAttribute("customerPhone");
            session.removeAttribute("notFound");
            session.setAttribute("checkoutSuccess", "Payment successful! The bill has been saved.");

            // Redirect to the cart page to show the success message
            response.sendRedirect("cart.jsp");

        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            session.setAttribute("checkoutError", "An error occurred while saving the bill: " + e.getMessage());
            response.sendRedirect("cart.jsp");
        }
    }
}