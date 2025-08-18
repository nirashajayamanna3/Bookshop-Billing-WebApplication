package Controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String DB_USER = "root";
    private static final String DB_PASS = ""; // Replace with your DB password if needed

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

            String sql = "SELECT * FROM user_new WHERE username=? AND password=? AND type=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, type);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                if ("cashier".equalsIgnoreCase(type)) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Successful login in home page');");
                    out.println("window.location = 'cart.jsp';");
                    out.println("</script>");
                } else if ("manager".equalsIgnoreCase(type)) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Successful login in Admin Dashboard');");
                    out.println("window.location = 'adminDashboard.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Invalid user role type!');");
                    out.println("window.location = 'login.jsp';");
                    out.println("</script>");
                }
                
            } else {
                out.println("<h3>Login Failed! Invalid username, password or role.</h3><a href='login.jsp'>Try Again</a>");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<h3>Error occurred during login.</h3>");
        }
    }
}
