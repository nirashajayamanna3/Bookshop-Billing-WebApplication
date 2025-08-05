package Controller;

import java.io.IOException;
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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        try {
            

            // Create User object
            User user = new User( username, password, type);

            // Insert user into DB using DAO
            UserDAO userDAO = new UserDAO();
            userDAO.addUser(user); // <-- FIXED METHOD NAME

            // Redirect to user list or success page
            response.sendRedirect("manageUser.jsp");

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
