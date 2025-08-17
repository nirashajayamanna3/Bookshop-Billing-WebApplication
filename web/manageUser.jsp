<%@page import="persistence.User.User"%>
<%@page import="java.util.List"%>
<%@page import="persistence.User.UserDAO"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection conn = DBConnection.getConnection();
    UserDAO dao = new UserDAO(conn);
    List<User> users = dao.getAllUsers();
%>

<html>
<head>
    <title>Manage Users</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background-color: #f8f9fa; }
        .sidebar { width: 220px; position: fixed; top: 0; left: 0; height: 100%; background-color: #2c3e50; padding-top: 20px; box-shadow: 2px 0 5px rgba(0,0,0,0.1); }
        .sidebar h3 { color: white; text-align: center; margin-bottom: 20px; }
        .sidebar a { display: block; padding: 12px 20px; text-decoration: none; color: #ecf0f1; font-size: 16px; border-left: 4px solid transparent; transition: all 0.3s ease; }
        .sidebar a:hover { background-color: #34495e; border-left: 4px solid #1abc9c; }
        .logout-btn { padding: 8px 16px; background-color: #e74c3c; border: none; border-radius: 4px; color: white; cursor: pointer; margin: 10px auto; display: block; width: 80%; }
        table { width: 80%; border-collapse: collapse; margin: 20px auto; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #eee; }
        .action-form { display: inline; }
        .action-form input[type=submit] { background: none; border: none; color: #e74c3c; cursor: pointer; text-decoration: underline; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="#">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="manageSuppliers.jsp">👥 Supplier</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <div style="margin-left:220px; padding:20px;">
        <h2 align="center">Manage Users</h2>
        <div style="text-align: right; margin: 10px;">
            <a href="addUser.jsp">➕ Add New User</a>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Password</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
            <%
                for (User u : users) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getUsername() %></td>
                <td><%= u.getPassword() %></td>
                <td><%= u.getType() %></td>
                <td>
                    <a href="editUser.jsp?id=<%= u.getId() %>">📝 Edit</a> | 
                    <form class="action-form" action="UserServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= u.getId() %>">
                        <input type="submit" value="🗑️ Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>
