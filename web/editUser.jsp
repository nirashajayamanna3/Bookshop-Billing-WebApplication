<%@page import="persistence.User.UserDAO"%>
<%@page import="persistence.User.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get user ID from URL
    String id = request.getParameter("id");
    

    // Retrieve user data
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByID(id);
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
        input[type="text"], input[type="password"], select {
            width: 300px;
            padding: 8px;
            margin: 5px 0;
        }
        input[type="submit"] {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="#">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
    </div>
    <div style="margin-left:500px; padding:20px;">
        <h2 >Edit User</h2>
    <form action="EditUserServlet" method="post">
        <label>ID:</label><br>
        <input type="text" name="id" value="<%= user.getId() %>"required><br>

        <label>Username:</label><br>
        <input type="text" name="username" value="<%= user.getUsername() %>" required><br>

        <label>Password:</label><br>
        <input type="password" name="password" value="<%= user.getPassword() %>" required><br>

        <label>Type:</label><br>
        <select name="type" required>
            <option value="manager" <%= "manager".equals(user.getType()) ? "selected" : "" %>>Manager</option>
            <option value="cashier" <%= "cashier".equals(user.getType()) ? "selected" : "" %>>Cashier</option>
        </select><br>

        <input type="submit" value="Update">
    </form>
    <br>
    
    <a href="manageUser.jsp">🔙 Back to User List</a>
    </div>
</body>
</html>
