<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suppliers List</title>
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
    table {
        text-align: center;
            width: 65%;
            border-collapse: collapse;
            margin: 40px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 5px;
            text-align: center;
        }
        th {
            background-color: #eee;
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
         <a href="#">👥 Supplier</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>
<h2 style="text-align:center;">Suppliers List</h2>
<div style="text-align:center; margin-bottom:20px;">
    <a href="AddSupplier.jsp">Add New Supplier</a>
</div>
<table>
    <tr>
        <th>ID</th>
        <th>Company Name</th>
        <th>Contact Person</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Actions</th>
    </tr>
    <tr>
        <td>1</td>
        <td>ABC Traders</td>
        <td>John Doe</td>
        <td>0771234567</td>
        <td>abc@gmail.com</td>
        <td>Colombo</td>
        <td>
            <a href="editSupplier.jsp?id=1">Edit</a>
            <button onclick="return confirm('Delete this supplier?')">Delete</button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>XYZ Supplies</td>
        <td>Jane Smith</td>
        <td>0777654321</td>
        <td>xyz@gmail.com</td>
        <td>Kandy</td>
        <td>
            <a href="editSupplier.jsp?id=2">Edit</a>
            <button onclick="return confirm('Delete this supplier?')">Delete</button>
        </td>
    </tr>
</table>
</body>
</html>
