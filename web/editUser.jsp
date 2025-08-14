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
        body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .sidebar {
        width: 220px;
        position: fixed;
        top: 0;
        left: 0;
        height: 100%;
        background-color: #2c3e50;
        padding-top: 20px;
        box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    }
    .sidebar h3 {
        color: white;
        text-align: center;
        margin-bottom: 20px;
    }
    .sidebar a {
        display: block;
        padding: 12px 20px;
        text-decoration: none;
        color: #ecf0f1;
        font-size: 16px;
        border-left: 4px solid transparent;
        transition: all 0.3s ease;
    }
    .sidebar a:hover {
        background-color: #34495e;
        border-left: 4px solid #1abc9c;
    }
    .logout-btn {
        padding: 8px 16px;
        background-color: #e74c3c;
        border: none;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        margin: 10px auto;
        display: block;
        width: 80%;
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
