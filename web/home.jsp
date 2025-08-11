<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pahana Edu Bookshop</title>
    <script>
        // Optional: client-side check
        function validatePhone() {
            const phone = document.forms["searchForm"]["phone"].value;
            if (phone === "") {
                alert("Please enter a phone number.");
                return false;
            }
            return true;
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .logout-btn {
            padding: 8px 16px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #d32f2f;
        }
        h2 {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #444;
            color: white;
            padding: 10px;
        }
        td {
            padding: 8px;
        }
        .cart-btn {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 5px 10px;
            cursor: pointer;
        }
        .cart-btn:hover {
            background-color: #218838;
        }
        .action-btns button {
            margin: 5px;
            padding: 8px 16px;
            font-size: 14px;
            border: none;
            cursor: pointer;
            color: white;
        }
        .update-btn { background-color: #007bff; }
        .pay-btn { background-color: #28a745; }
        .clear-btn { background-color: #dc3545; }
        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 4px 8px;
            cursor: pointer;
        }
        .right-panel {
            float: right;
            width: 40%;
        }
        .left-panel {
            width: 55%;
            float: left;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
        .form-group {
            margin-bottom: 10px;
            display: flex;
            padding: 5px;
            margin: 5px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 50%;
            padding: 6px;
        }
        .form-group button{
            margin: 5px;
        }
    </style>
</head>
<body>

<div class="header-bar">
    <h2>Sales Transaction</h2>
    <form action="LogoutServlet" method="get">
        <input type="submit" value="Logout" class="logout-btn">
    </form>
</div>
<div class="clearfix">
    <div class="left-panel">
        
        <table>
            <tr>
                
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Unit Price</th>
                <th>Discount</th>
                
                <th>Act.</th>
            </tr>
            <%
                try {
                    Connection conn = DBConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM item");

                    while (rs.next()) {
            %>
            <tr>
                
                
                <td><%= rs.getString("product_code") %></td>
                <td><%= rs.getString("product_name") %></td>
                <td>Rs<%= rs.getDouble("unit_price") %></td>
                <td><%= rs.getDouble("discount") %>%</td>
                
                <td>
                    <form method="post" action="CartServlet">
                        <input type="hidden" name="product_code" value="<%= rs.getString("product_code") %>">
                        <button type="submit" class="cart-btn">🛒</button>
                    </form>
                </td>
            </tr>
            <%
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
    </div>

     <div class="right-panel">
        <div class="form-group">
            <form action="SearchCustomerServlet" method="post" name="searchForm" onsubmit="return validatePhone()">
                <label>Customer's Phone Number:</label>
                <input type="text" placeholder="Enter customer's Phone Number" name="phone">
                <button type="submit">Search</button>
                <button type="button" onclick="location.href='AddCustomer.jsp'">Add Customer</button>
            </form>
    </div>

    <div id="customerInfo" style="margin-top: 10px; font-weight: bold;"></div>
    <%
    String customerName = (String) session.getAttribute("customerName");
    String customerPhone = (String) session.getAttribute("customerPhone");
    
    Boolean notFound = (Boolean) session.getAttribute("notFound");

    if (customerName != null) {
    %>
            <h3>Customer Name: <%= customerName %></h3>
            <p>Phone: <%= customerPhone %></p>
    <%
        } else if (notFound != null && notFound) {
    %>
            <script>
                alert("Phone number is invalid. Please add a new customer.");
            </script>
    <%
        session.removeAttribute("notFound"); // Clear flag after showing alert
    }
%>

    <script>
        function searchCustomer() {
            const phone = document.getElementById("phoneInput").value;

            if (phone.trim() === "") {
                alert("Please enter a phone number.");
                return;
            }

            fetch("SearchCustomerServlet", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "phone=" + encodeURIComponent(phone)
            })
            .then(response => response.json())
            .then(data => {
                if (data.found) {
                    document.getElementById("customerInfo").innerText = "Customer Name: " + data.name;
                } else {
                    if (confirm("Phone number not found. Do you want to add a new customer?")) {
                        window.location.href = "AddCustomer.jsp";
                    }
                }
            })
            .catch(error => {
                alert("Error: " + error);
            });
        }
    </script>
         
        <table>
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Discount</th>
                
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
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

                    // Apply discount to subtotal
                    double subTotal = price * qty * (1 - discount / 100.0);
                    total += subTotal;
            %>
            <tr>
                <td><%= item.get("code") %></td>
                <td><%= item.get("name") %></td>
                <td><%= item.get("qty") %></td>
                
                <td>Rs<%= item.get("price") %></td>
                <td><%= item.get("discount") %></td>
                <td>Rs<%= subTotal %></td>
                <td><form method="post" action="DeleteItemServlet">
                        <button name="product_code" value="<%= item.get("code") %>" class="delete-btn">🗑️</button>
                    </form></td>
            </tr>
            <%
                    }
                }
            %>
            <tr>
                <td colspan="4" style="text-align:right;"><strong>Total Amount</strong></td>
                <td colspan="2"><strong>Rs<%= total %></strong></td>
            </tr>
        </table>

        <div class="action-btns">
            
            
<!--               <form action="/PayServlet" method="post">-->
                    <button type="submit" class="pay-btn"onclick="location.href='Invoice.jsp'" >Pay</button>
<!--                  </form>-->
            
            <button class="clear-btn" onclick="location.href='CartServlet?clear=true'">Clear Cart</button>
        </div>
    </div>
</div>
</body>
</html>
