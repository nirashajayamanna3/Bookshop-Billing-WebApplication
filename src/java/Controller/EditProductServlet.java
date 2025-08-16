package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.Product.Product;
import persistence.Product.ProductDAO;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String originalCode = safeTrim(request.getParameter("originalCode"));  // original code for WHERE clause
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

            Product updatedProduct = new Product(productCode, productName, description, unitPrice, discount, tax);

            ProductDAO productDAO = new ProductDAO();

            if (!originalCode.equals(productCode)) {
                // If product code changed, you might want to handle update carefully:
                // Usually, you delete the old record and insert new, or update code explicitly if DB allows.
                // For simplicity, let's delete old and add new (optional, depending on requirements).
                productDAO.deleteProduct(originalCode);
                productDAO.addProduct(updatedProduct);
            } else {
                // Normal update
                productDAO.updateProduct(updatedProduct);
            }

            // After update redirect to products list page
            response.sendRedirect("manageProducts.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private String safeTrim(String input) {
        return input == null ? "" : input.trim();
    }
}
