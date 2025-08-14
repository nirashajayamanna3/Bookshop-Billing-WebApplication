package Controller;



import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import persistence.DBConnection;
import persistence.Supplier.Supplier;
import persistence.Supplier.SupplierDAO;

@WebServlet("/SupplierServlet")
public class SupplierServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Connection conn = DBConnection.getConnection();
        SupplierDAO dao = new SupplierDAO(conn);

        try {
            if ("add".equals(action)) {
                Supplier s = new Supplier();
                s.setCompanyName(request.getParameter("name"));
                s.setContactPerson(request.getParameter("contactPerson"));
                s.setPhone(request.getParameter("phone"));
                s.setEmail(request.getParameter("email"));
                s.setAddress(request.getParameter("address"));
                dao.addSupplier(s);
                response.sendRedirect("manageSuppliers.jsp");

            } else if ("update".equals(action)) {
                Supplier s = new Supplier();
                s.setId(Integer.parseInt(request.getParameter("id")));
                s.setCompanyName(request.getParameter("name"));
                s.setContactPerson(request.getParameter("contactPerson"));
                s.setPhone(request.getParameter("phone"));
                s.setEmail(request.getParameter("email"));
                s.setAddress(request.getParameter("address"));
                dao.updateSupplier(s);
                response.sendRedirect("manageSuppliers.jsp");

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteSupplier(id);
                response.sendRedirect("manageSuppliers.jsp");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
