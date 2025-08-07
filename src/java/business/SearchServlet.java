package business;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.customer.customer;
import persistence.customer.customerDAO;

@WebServlet("/SearchCustomerServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");

        customerDAO dao = new customerDAO();
        customer cust = dao.getCustomerByName(name); // from your DAO

        request.setAttribute("customer", cust); // ✅ Fixed
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
