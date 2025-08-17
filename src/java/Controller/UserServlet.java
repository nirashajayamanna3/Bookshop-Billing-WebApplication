package Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import persistence.User.User;
import persistence.User.UserDAO;
import persistence.DBConnection;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            // ✅ Get a DB connection and pass it to UserDAO
            Connection conn = DBConnection.getConnection();
            UserDAO dao = new UserDAO(conn);

            if ("add".equals(action) || action == null) { // action can be null if not in form
                User user = new User();
                user.setName(request.getParameter("name"));
                user.setUsername(request.getParameter("username"));
                user.setPassword(request.getParameter("password"));
                user.setType(request.getParameter("type"));

                dao.addUser(user);

                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('User added successfully!');");
                response.getWriter().println("window.location='manageUser.jsp';");
                response.getWriter().println("</script>");
            } else if ("update".equals(action)) {
                User u = new User();
                u.setId(Integer.parseInt(request.getParameter("id")));
                u.setName(request.getParameter("name"));
                u.setUsername(request.getParameter("username"));
                u.setPassword(request.getParameter("password"));
                u.setType(request.getParameter("type"));

                dao.updateUser(u);

                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('User updated successfully!');");
                response.getWriter().println("window.location = 'manageUser.jsp';");
                response.getWriter().println("</script>");

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.deleteUser(id);

                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>");
                response.getWriter().println("alert('User deleted successfully!');");
                response.getWriter().println("window.location = 'manageUser.jsp';");
                response.getWriter().println("</script>");
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
