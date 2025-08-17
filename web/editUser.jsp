<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="persistence.User.UserDAO"%>
<%@page import="persistence.User.User"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = DBConnection.getConnection();
            UserDAO dao = new UserDAO(conn); // ✅ no arguments
    User s = null;
    try {
        s = dao.getUserByID(id);
        if (s == null) {
            response.sendRedirect("manageUser.jsp"); // user not found
            return;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("manageUser.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background-color: #f8f9fa; }
        .sidebar { width: 220px; position: fixed; top: 0; left: 0; height: 100%; background-color: #2c3e50; padding-top: 20px; box-shadow: 2px 0 5px rgba(0,0,0,0.1); }
        .sidebar h3 { color: white; text-align: center; margin-bottom: 20px; }
        .sidebar a { display: block; padding: 12px 20px; text-decoration: none; color: #ecf0f1; font-size: 16px; border-left: 4px solid transparent; transition: all 0.3s ease; }
        .sidebar a:hover { background-color: #34495e; border-left: 4px solid #1abc9c; }
        .logout-btn { padding: 8px 16px; background-color: #e74c3c; border: none; border-radius: 4px; color: white; cursor: pointer; margin: 10px auto; display: block; width: 80%; }
        input[type="text"], input[type="password"], select { width: 300px; padding: 8px; margin: 5px 0; }
        input[type="submit"] { padding: 10px 20px; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">🧾 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="manageSuppliers.jsp">👥 Supplier</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <div style="margin-left:500px; padding:20px;">
        <h2>Edit User</h2>
        <form action="UserServlet" method="post">
            <!-- Hidden input for numeric ID -->
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= s.getId() %>">

            <label>Name:</label><br>
            <input type="text" name="name" value="<%= s.getName() %>" required><br>

            <label>Username:</label><br>
            <input type="text" name="username" value="<%= s.getUsername() %>" required><br>

            <label>Password:</label><br>
            <input type="password" name="password" value="<%= s.getPassword() %>" required><br>

            <label>Type:</label><br>
            <select name="type" required>
                <option value="manager" <%= "manager".equals(s.getType()) ? "selected" : "" %>>Manager</option>
                <option value="cashier" <%= "cashier".equals(s.getType()) ? "selected" : "" %>>Cashier</option>
            </select><br><br>

            <input type="submit" value="Update">
        </form>
        <br>
        <a href="manageUser.jsp">🔙 Back to User List</a>
    </div>
</body>
</html>

