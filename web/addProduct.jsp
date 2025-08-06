<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
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
    <div class="sidebar">
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProduct.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
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
