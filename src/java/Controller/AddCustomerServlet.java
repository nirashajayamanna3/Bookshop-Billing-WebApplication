package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.customer.customer;
import persistence.customer.customerDAO;

@WebServlet(name = "AddCustomerServlet", urlPatterns = {"/AddCustomerServlet"})
public class AddCustomerServlet extends HttpServlet {
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
            // Create Customer object
            customer customer = new customer(accountNumber, name, address, phone, email);

            // Call DAO to insert into DB
            customerDAO customerDAO = new customerDAO();
            customerDAO.addCustomer(customer);

            // Redirect after successful insert
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Add customer successfully');");
            out.println("window.location = 'CustomerDetails.jsp';");
            out.println("</script>");
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: redirect GET requests to a form
        response.sendRedirect("AddCustomerForm.jsp");
    }
}
