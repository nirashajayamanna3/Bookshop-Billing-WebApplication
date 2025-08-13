package business;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.customer.customerDAO;

@WebServlet("/SearchCustomerServlet")
public class SearchCustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phone = request.getParameter("phone");

        // The next two lines seem to be getting the same thing. 
        // You should get the account number separately if needed.
        String customerName = customerDAO.getCustomerNameByPhone(phone);
        // Assuming a separate method exists for getting the account number
        // String accountNumber = customerDAO.getAccountNumberByPhone(phone); 

        HttpSession session = request.getSession();
        if (customerName != null) {
            session.setAttribute("customerName", customerName);
            session.setAttribute("customerPhone", phone);
            // session.setAttribute("accountNumber", accountNumber);
            response.sendRedirect("home.jsp"); // Redirect to home.jsp on success
        } else {
            session.removeAttribute("customerName");
            session.removeAttribute("customerPhone");
            session.setAttribute("notFound", true);
            response.sendRedirect("cart.jsp"); // Redirect to cart.jsp on failure
        }
    }
}