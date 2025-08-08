package business;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import persistence.DBConnection;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode = request.getParameter("product_code");
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        try (Connection conn = DBConnection.getConnection()) {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM item WHERE product_code = ?");
            stmt.setString(1, productCode);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                boolean found = false;
                for (Map<String, Object> item : cart) {
                    if (item.get("code").equals(productCode)) {
                        int qty = (int) item.get("qty") + 1;
                        double price = (double) item.get("price");
                        double discount = (double) item.get("discount");

                        double total = price * qty;
                        double discountAmount = total * (discount / 100.0);
                        double subtotal = total - discountAmount;

                        item.put("qty", qty);
                        item.put("subtotal", subtotal);

                        found = true;
                        break;
                    }
                }

                if (!found) {
                    String code = rs.getString("product_code");
                    String name = rs.getString("product_name");
                    double price = rs.getDouble("unit_price");
                    double discount = rs.getDouble("discount");

                    int qty = 1;
                    double total = price * qty;
                    double discountAmount = total * (discount );
                    double subtotal = total - discountAmount;

                    Map<String, Object> item = new HashMap<>();
                    item.put("code", code);
                    item.put("name", name);
                    item.put("qty", qty);
                    item.put("price", price);
                    item.put("discount", discount);
                    item.put("subtotal", subtotal);

                    cart.add(item);
                }
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("home.jsp");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (request.getParameter("clear") != null) {
            session.removeAttribute("cart");
            session.removeAttribute("customerName"); // Optional: clear customer
            session.removeAttribute("customerPhone"); // Optional: clear phone
        }
        response.sendRedirect("home.jsp");
    }
}
