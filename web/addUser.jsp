<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New User</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
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
    <a href="manageProduct.jsp">📦 Product</a>
    <a href="manageCustomer.jsp">👥 Customer</a>
    <a href="manageBill.jsp">📒 Bill</a>
    <a href="AdminDashboard.jsp">📊 REPORTS</a>
    <a href="AdminDashboard.jsp">📈 Charts</a>
</div>

<div class="content">
    <h2 align="center">Add New User</h2>

    <form action="AdduserServlet" method="post">
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