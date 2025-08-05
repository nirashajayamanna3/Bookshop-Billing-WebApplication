package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import persistence.User.User;
import persistence.User.UserDAO;

@WebServlet(name = "EditUserServlet", urlPatterns = {"/EditUserServlet"})
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        try {
            int id = Integer.parseInt(idStr);

            // Create updated User object
            User updatedUser = new User(id, username, password, type);

            // Update the user using DAO
            UserDAO userDAO = new UserDAO();
            userDAO.updateUser(updatedUser);

            // Redirect to user management page
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
        response.sendRedirect("manageUser.jsp");
    }
}
