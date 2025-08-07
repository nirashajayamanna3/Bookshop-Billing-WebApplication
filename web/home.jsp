<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill System - Customer & Product Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #ffffff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            
        }

        header h1 {
            margin: 0;
            font-size: 28px;
        }

        .logout-btn {
            background-color: #f44336;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #d73833;
        }

        .container {
            padding: 30px 40px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        input[type="text"],
        input[type="number"] {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        input[type="button"] {
            padding: 8px 16px;
            margin-left: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }

        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-family: Arial, sans-serif;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .info-table th, .info-table td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .info-table th {
            background-color: #f8f8f8;
            font-weight: bold;
            color: #333;
        }

        .info-table tr:hover {
            background-color: #f1f1f1;
        }

        .info-table td {
            color: #555;
        }
        

        .section-title {
            margin-bottom: 10px;
            font-size: 18px;
            color: #333;
        }

    </style>
</head>
<body>

    <header>
        <h1 style="text-align: center;">Bill System</h1>
        <form action="LogoutServlet" method="get" style="margin: 0;">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </header>

    <div class="container">

        <!-- Customer Search Section -->
        <div>
            <div class="section-title">Search Customer</div>
            <form method="get">
                <label for="name">Customer Name:</label>
                <input type="text" id="name" name="name">
                <input type="submit" value="Search">
                <input type="button" value="Add" onclick="window.location.href='AddCustomer.jsp';">
            </form>

            <!-- Customer Info Table -->
            <table  class="info-table" border="1" style="width: 100%; border-collapse: collapse;">
                <tr>
                    <th>Field</th>
                    <th>Value</th>
                </tr>
                <tr>
                    <td>Account Number</td>
                    <td><!-- Dynamic value here --></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><!-- Dynamic value here --></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><!-- Dynamic value here --></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><!-- Dynamic value here --></td>
                </tr>
            </table>

        </div>

        <!-- Product Search Section -->
        <div style="margin-top: 40px;">
            <div class="section-title">Search Product</div>
            <form method="get">
                <label for="product">Product Name:</label>
                <input type="text" id="product" name="product" value="<%= request.getParameter("product") != null ? request.getParameter("product") : "" %>">
                <input type="button" value="Item" onclick="window.location.href='Product.jsp';">
                <input type="submit" value="Add">
            </form>
        </div>

    </div>

</body>
</html>
