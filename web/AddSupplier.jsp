<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Supplier</title>
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
<h2 style="text-align:center;">Add New Supplier</h2>
<form style="width:300px; margin: auto;">
    <label>Name:</label><br>
    <input type="text" name="name"><br><br>

    <label>Contact Person:</label><br>
    <input type="text" name="contactPerson"><br><br>

    <label>Phone:</label><br>
    <input type="text" name="phone"><br><br>

    <label>Email:</label><br>
    <input type="email" name="email"><br><br>

    <label>Address:</label><br>
    <textarea name="address"></textarea><br><br>

    <input type="submit" value="Save">
    <a href="supplierList.jsp">Cancel</a>
</form>
</body>
</html>