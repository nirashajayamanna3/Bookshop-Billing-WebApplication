package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String productCode = request.getParameter("product_code");

       HttpSession session = request.getSession();
       List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

       if (cart != null && productCode != null) {
           Iterator<Map<String, Object>> iterator = cart.iterator();
           while (iterator.hasNext()) {
               Map<String, Object> item = iterator.next();
               if (productCode.equals(item.get("code"))) {
                   iterator.remove();
               }
           }
           session.setAttribute("cart", cart);
       }

       response.sendRedirect("home.jsp");
   }
}

