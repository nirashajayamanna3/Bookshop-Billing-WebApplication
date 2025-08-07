package business;

import persistence.Product.Product;
import persistence.Product.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SearchProductServlet")
public class SearchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get product name from request
        String name = request.getParameter("name");

        // Search the product using DAO
        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductByName(name); // Method you'll define

        // Set the product object in the request
        request.setAttribute("product", product);

        // Forward to JSP (like home.jsp)
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
