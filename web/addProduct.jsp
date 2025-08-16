<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
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
        .form-container {
            margin-left: 220px;
            padding: 20px;
        }
        form {
            max-width: 600px;
            margin: auto;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
    <h3>Pahana Edu Bookshop</h3>
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
    <div class="form-container">
        <h2 align="center">Add New Product</h2>
        <form action="AddProductServlet" method="post">
            <label for="productCode">Product Code:</label>
            <input type="text" id="productCode" name="product_code" required>

            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="product_name" required>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description">

            <label for="unitPrice">Unit Price (LKR):</label>
            <input type="number" step="0.01" id="unitPrice" name="unit_price" required>

            <label for="discount">Discount (%):</label>
            <input type="number" step="0.01" id="discount" name="discount" required>

            <label for="tax">Tax (%):</label>
            <input type="number" step="0.01" id="tax" name="tax" required>

            <input type="submit" value="Add Product">
        </form>
    </div>
</body>
</html>
