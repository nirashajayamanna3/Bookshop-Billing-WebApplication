<%@page import="java.sql.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Transaction </title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }

        h3 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .customer-form {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .customer-form label {
            font-weight: 600;
            color: #555;
            white-space: nowrap;
        }

        .customer-form input[type="text"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        .customer-form input[type="text"]:focus {
            outline: none;
            border-color: #007bff;
        }

        .customer-form button,
        .customer-form a button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .customer-form .search-btn {
            background-color: #007bff;
        }

        .customer-form .search-btn:hover {
            background-color: #0056b3;
        }

        .customer-form .add-btn {
            background-color: #28a745;
        }

        .customer-form .add-btn:hover {
            background-color: #218838;
        }

        .customer-info {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #eaf6ff;
            border: 1px solid #b3e0ff;
            border-radius: 8px;
            color: #333;
        }

        .customer-info h4 {
            margin-top: 0;
            color: #007bff;
        }

        .customer-info p {
            margin: 5px 0;
        }

        .cart-summary {
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow-x: auto;
        }

        .cart-summary table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-summary th,
        .cart-summary td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .cart-summary thead tr {
            background-color: #f8f9fa;
            color: #495057;
        }

        .cart-summary tbody tr:hover {
            background-color: #f1f1f1;
        }

        .cart-summary .total-row {
            background-color: #e9ecef;
            font-weight: bold;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }
        
        .action-btns {
            margin-top: 20px;
            text-align: right;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .action-btns button {
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .pay-btn {
            background-color: #28a745;
        }

        .pay-btn:hover {
            background-color: #218838;
        }

        .clear-btn {
            background-color: #6c757d;
        }

        .clear-btn:hover {
            background-color: #5a6268;
        }

        .cart-empty {
            text-align: center;
            padding: 20px;
            color: #6c757d;
            font-style: italic;
        }
        .print{
            background-color: red;
        }
        .print-btn {
            margin-top: 20px;
            text-align: center;
            
        }
        .no-print {
            display: block;
        }

        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>
<body>

    <h3>Sales Transaction</h3>
    <h1>Pahana Edu Bookshop</h1>
    
    <div class="no-print">
        <div class="customer-form">
            <form action="SearchCustomerServlet" method="post" name="searchForm">
                <label>Customer's Phone Number:</label>
                <input type="text" placeholder="Enter phone number" name="phone" required>
                <button type="submit" class="search-btn">Search</button>
            </form>
            <a href="AddCustomer.jsp">
                <button class="add-btn">Add Customer</button>
            </a>
        </div>
    </div>
    <%
        String customerName = (String) session.getAttribute("customerName");
        String customerPhone = (String) session.getAttribute("customerPhone");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String formattedDate = sdf.format(new java.util.Date());
        Boolean notFound = (Boolean) session.getAttribute("notFound");

        if (customerName != null) {
    %>
    <div class="print-btn ">
            
        <div class="customer-info">
            <h4>Customer Details</h4>
            <p><strong>Name:</strong> <%= customerName %></p>
            <p><strong>Phone:</strong> <%= customerPhone %></p>
            <p>Date: <%= formattedDate %></p>
        </div>
        <%
            } else if (notFound != null && notFound) {
        %>
        <script>
            alert("Phone number is invalid or not found. Please add a new customer.");
             
        </script>
        <%
            session.removeAttribute("notFound");
            }
        %>

        <div class="cart-summary">
            <table>
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Qty</th>
                        <th>Unit Price</th>
                        <th>Discount (%)</th>
                        <th>Subtotal</th>
                        <th class="no-print">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                        double total = 0;
                        if (cart != null && !cart.isEmpty()) {
                            for (Map<String, Object> item : cart) {
                                String code = (String) item.get("code");
                                String name = (String) item.get("name");
                                double price = (double) item.get("price");
                                int qty = (int) item.get("qty");
                                double discount = (double) item.get("discount");

                                double subTotal = price * qty * (1 - discount / 100.0);
                                total += subTotal;
                    %>
                    <tr>
                        <td><%= code %></td>
                        <td><%= name %></td>
                        <td><%= qty %></td>
                        <td>Rs <%= String.format("%.2f", price) %></td>
                        <td><%= discount %>%</td>
                        <td>Rs <%= String.format("%.2f", subTotal) %></td>
                        <td>
                            <form method="post" action="DeleteItemServlet" class="no-print">
                                <input type="hidden" name="product_code" value="<%= code %>">
                                <button type="submit" class="delete-btn">🗑️</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="cart-empty">Your cart is empty.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr class="total-row">
                        <td colspan="5" style="text-align:right;"><strong>Total Amount</strong></td>
                        <td colspan="2"><strong>Rs <%= String.format("%.2f", total) %></strong></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
       <div class="no-print">               
        <div class="action-btns" >

               <button class="print" onclick="window.print()">Print Bill</button>

                <button class="clear-btn" onclick="location.href='CartServlet?clear=true'">Clear Cart</button>
                <form action="CheckoutServlet" method="post" style="display:inline;">
                <input type="hidden" name="customerName" value="<%= customerName %>">
                <input type="hidden" name="customerPhone" value="<%= customerPhone %>">
                <input type="hidden" name="totalAmount" value="<%= total %>">
                <button type="submit" class="pay-btn">Pay</button>
            </form>
            </div>
       </div>
    
</body>
</html>