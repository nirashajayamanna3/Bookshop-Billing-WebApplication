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

        String customerName = customerDAO.getCustomerNameByPhone(phone);
        String accountNumber = customerDAO.getCustomerNameByPhone(phone);

        HttpSession session = request.getSession();
        if (customerName != null) {
            session.setAttribute("customerName", customerName);
            session.setAttribute("customerPhone", phone);
            session.setAttribute("accountNumber", accountNumber);
        } else {
            session.removeAttribute("customerName");
            session.removeAttribute("customerPhone");
            session.setAttribute("notFound", true);
        }

        response.sendRedirect("home.jsp");
    }
}