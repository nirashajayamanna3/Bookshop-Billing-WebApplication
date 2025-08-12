package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.User.User;
import persistence.User.UserDAO;

@WebServlet(name = "AdduserServlet", urlPatterns = {"/AdduserServlet"})
public class AdduserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get form parameters
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        try {
            

            // Create User object
            User user = new User( id,username, password, type);

            // Insert user into DB using DAO
            UserDAO userDAO = new UserDAO();
            userDAO.addUser(user); // <-- FIXED METHOD NAME

            // Redirect to user list or success page
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Add User successfully');");
            out.println("window.location = 'manageUser.jsp';");
            out.println("</script>");
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("addUser.jsp");
    }
}
