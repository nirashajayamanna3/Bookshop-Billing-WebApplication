<%@ page import="persistence.User.UserDAO" %>
<%@ page import="persistence.User.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idStr = request.getParameter("id");
    int id = 0;
    User user = null;
    if (idStr != null) {
        try {
            id = Integer.parseInt(idStr);
            UserDAO dao = new UserDAO();
            user = dao.getUserByID(id);
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p style='color:red;'>User ID is missing!</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <style>
        
        body { font-family: Arial, sans-serif; }
        .sidebar {
            width: 200px;
            float: left;
            background-color: #f1f1f1;
            height: 100vh;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #000;
            border-bottom: 1px solid #ccc;
        }
        label { display: block; margin-top: 10px; }
        input, select { width: 250px; padding: 5px; }
        input[type=submit] { margin-top: 15px; width: auto; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
    </div>

    <div style="margin-left:500px; padding:20px;">
        <h2 >Edit Users</h2>
    
    <% if (user != null) { %>
        <form action="EditUserServlet" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <label>Username:</label>
            <input type="text" name="username" value="<%= user.getUsername() %>" required>

            <label>Password:</label>
            <input type="password" name="password" value="<%= user.getPassword() %>" required>

            <label>User Type:</label>
            <select name="type" required>
                <option value="manager" <%= user.getType().equals("manager") ? "selected" : "" %>>Manager</option>
                <option value="cashier" <%= user.getType().equals("cashier") ? "selected" : "" %>>Cashier</option>
            </select>
            <br/>
            <input type="submit" value="Update User">
        </form>
        <br>
        <a href="manageUser.jsp">← Back to User List</a>
    <% } %>
    </div>
</body>
</html>
