package business;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddProductToBillServlet")
public class AddProductToBillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve product input fields
        String productName = request.getParameter("product");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
        String discountStr = request.getParameter("discount");
        String taxStr = request.getParameter("tax");

        // Validate inputs (basic check)
        if (productName == null || quantityStr == null || priceStr == null
                || discountStr == null || taxStr == null
                || productName.trim().isEmpty()) {
            response.sendRedirect("bill.jsp?error=Missing+Product+Information");
            return;
        }

        // Parse values
        int quantity = 1;
        double unitPrice = 0.0, discount = 0.0, tax = 0.0;

        try {
            quantity = Integer.parseInt(quantityStr);
            unitPrice = Double.parseDouble(priceStr);
            discount = Double.parseDouble(discountStr);
            tax = Double.parseDouble(taxStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("bill.jsp?error=Invalid+numeric+input");
            return;
        }

        // Create a new BillItem object
        BillItem item = new BillItem();
        item.setProduct(productName);
        item.setQuantity(quantity);
        item.setUnitPrice(unitPrice);
        item.setDiscount(discount);
        item.setTax(tax);

        // Get or create session cart
        HttpSession session = request.getSession();
        List<BillItem> cart = (List<BillItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Check if the product already exists in the cart
        boolean productExists = false;
        for (BillItem existingItem : cart) {
            if (existingItem.getProduct().equalsIgnoreCase(productName)) {
                // Update quantity and pricing details
                existingItem.setQuantity(existingItem.getQuantity() + quantity);
                existingItem.setUnitPrice(unitPrice); // update price if needed
                existingItem.setDiscount(discount);
                existingItem.setTax(tax);
                productExists = true;
                break;
            }
        }

        // Add new item if it doesn't exist
        if (!productExists) {
            cart.add(item);
        }

        // Store cart back in session
        session.setAttribute("cart", cart);

        // Redirect back to the billing page
        response.sendRedirect("bill.jsp");
    }
}

