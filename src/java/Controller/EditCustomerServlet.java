package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.customer.customer;
import persistence.customer.customerDAO;

@WebServlet(name = "EditCustomerServlet", urlPatterns = {"/EditCustomerServlet"})
public class EditCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        try {
            // Create updated Customer object
            customer updatedCustomer = new customer(accountNumber, name, address, phone, email);

            // Update the customer using DAO
            customerDAO customerDAO = new customerDAO();
            customerDAO.updateCustomer(updatedCustomer);

            // Redirect to customer management page
            response.sendRedirect("manageCustomer.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("manageCustomer.jsp");
    }
}
