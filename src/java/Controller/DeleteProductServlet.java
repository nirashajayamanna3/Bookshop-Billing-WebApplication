package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.Product.ProductDAO;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productCode = request.getParameter("product_code");

        try {
            if (productCode != null && !productCode.trim().isEmpty()) {
                ProductDAO productDAO = new ProductDAO();
                productDAO.deleteProduct(productCode.trim());

                // Redirect to product management page after deletion
                response.sendRedirect("manageProducts.jsp");
            } else {
                response.getWriter().println("Invalid Product Code");
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
        // Support deletion via POST as well
        doGet(request, response);
    }
}
