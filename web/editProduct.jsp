<%@ page import="persistence.Product.Product" %>
<%@ page import="persistence.Product.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String code = request.getParameter("product_code");

    Product product = null;
    if (code != null && !code.trim().isEmpty()) {
        ProductDAO dao = new ProductDAO();
        product = dao.getProductByCode(code);
    }

    if (product == null) {
%>
    <h2 style="color:red; text-align: center;">Error: Product not found or invalid product code.</h2>
    <p style="text-align: center;"><a href="manageProducts.jsp">Back to Product List</a></p>
<%
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
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
        .container {
            margin: 50px auto;
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            width: 100%;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Product</h2>
        <form action="EditProductServlet" method="post">
            <input type="hidden" name="originalCode" value="<%= product.getProductCode() %>" />

            <label>Product Code:</label>
            <input type="text" name="product_code" value="<%= product.getProductCode() %>" required><br/>

            <label>Product Name:</label>
            <input type="text" name="product_name" value="<%= product.getProductName() %>" required><br/>

            <label>Description:</label>
            <input type="text" name="description" value="<%= product.getDescription() %>"><br/>

            <label>Unit Price (LKR):</label>
            <input type="number" name="unit_price" step="0.01" value="<%= product.getUnitPrice() %>" required><br/>

            <label>Discount (%):</label>
            <input type="number" name="discount" step="0.01" value="<%= product.getDiscount() %>"><br/>

            <label>Tax (%):</label>
            <input type="number" name="tax" step="0.01" value="<%= product.getTax() %>"><br/>

            <input type="submit" value="Update Product">
        </form>
    </div>
</body>
</html>
