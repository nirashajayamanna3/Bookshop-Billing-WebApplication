package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.Product.Product;
import persistence.Product.ProductDAO;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/AddProductServlet"})
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String productCode = safeTrim(request.getParameter("product_code"));
        String productName = safeTrim(request.getParameter("product_name"));
        String description = safeTrim(request.getParameter("description"));
        String unitPriceStr = safeTrim(request.getParameter("unit_price"));
        String discountStr = safeTrim(request.getParameter("discount"));
        String taxStr = safeTrim(request.getParameter("tax"));

        try {
            double unitPrice = unitPriceStr.isEmpty() ? 0.0 : Double.parseDouble(unitPriceStr);
            double discount = discountStr.isEmpty() ? 0.0 : Double.parseDouble(discountStr);
            double tax = taxStr.isEmpty() ? 0.0 : Double.parseDouble(taxStr);

            Product product = new Product(productCode, productName, description, unitPrice, discount, tax);

            ProductDAO productDAO = new ProductDAO();
            productDAO.addProduct(product);

            response.sendRedirect("manageProducts.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("addProduct.jsp");
    }

    // Helper method to avoid null pointer on trim
    private String safeTrim(String input) {
        return (input != null) ? input.trim() : "";
    }
}
