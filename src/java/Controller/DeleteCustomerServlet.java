package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.customer.customerDAO;

@WebServlet(name = "DeleteCustomerServlet", urlPatterns = {"/DeleteCustomerServlet"})
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");

        try {
            if (accountNumber != null && !accountNumber.isEmpty()) {
                // Call DAO to delete the customer
                customerDAO customerDAO = new customerDAO();
                customerDAO.deleteCustomer(accountNumber);

                // Redirect to manageCustomer.jsp after deletion
                response.sendRedirect("manageCustomer.jsp");
            } else {
                response.getWriter().println("Invalid Account Number");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Allow deletion via POST as well
    }
}
