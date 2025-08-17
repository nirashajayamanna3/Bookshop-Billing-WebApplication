<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New User</title>
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
    .content {
        margin-left: 220px;
        padding: 20px;
    }
    form {
        width: 300px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
        border-radius: 5px;
    }
    label, input, select {
        display: block;
        width: 100%;
        margin-bottom: 10px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px;
        cursor: pointer;
    }
</style>
</head>
<body>

<div class="sidebar">
    <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
    <a href="AdminDashboard.jsp">🏠 Home</a>
    <a href="manageUser.jsp">👥 User</a>
    <a href="manageProducts.jsp">📦 Product</a>
    <a href="manageCustomer.jsp">👥 Customer</a>
    <a href="manageBill.jsp">📒 Bill</a>
    <a href="AdminDashboard.jsp">📊 REPORTS</a>
    <a href="AdminDashboard.jsp">📈 Charts</a>
    
</div>

<div class="content">
    <h2 align="center">Add New User</h2>

    <form action="UserServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        <!-- Username -->
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <!-- User Type -->
        <label for="type">User Type:</label>
        <select id="type" name="type" required>
            <option value="">--Select--</option>
            <option value="manager">Manager</option>
            <option value="cashier">Cashier</option>
        </select><br><br>

        <!-- Submit -->
        <input type="submit" value="Add User">
    </form>

    <div style="text-align:center; margin-top:20px;">
        <a href="manageUser.jsp">⬅ Back to User List</a>
    </div>
</div>

</body>
</html>