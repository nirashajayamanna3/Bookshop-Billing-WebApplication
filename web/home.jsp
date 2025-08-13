<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pahana Edu Bookshop - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }
        .container {
            display: flex;
            justify-content: space-between;
        }
        .left-panel {
            flex: 1;
            margin-right: 20px;
        }
        .right-panel {
            flex: 1;
            margin-left: 20px;
        }
        .header-bar {
            display: flex;
            justify-content: space-between;
/*            align-items: center;*/
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
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
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 12px;
        }
        th {
            background-color: #444;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .cart-btn {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
        }
        .cart-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="header-bar">
    <h2>Products</h2>
    <a href="cart.jsp">Go to Cart</a>
    <form action="LogoutServlet" method="get">
        <input type="submit" value="Logout" class="logout-btn">
    </form>
    
</div>

<div class="container">
    <div class="left-panel">
        <table>
            <thead>
                <tr>
                    <th>Product Code</th>
                    <th>Product Name</th>
                    <th>Unit Price</th>
                    <th>Discount (%)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        conn = DBConnection.getConnection();
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM item");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("product_code") %></td>
                    <td><%= rs.getString("product_name") %></td>
                    <td>Rs <%= String.format("%.2f", rs.getDouble("unit_price")) %></td>
                    <td><%= rs.getDouble("discount") %>%</td>
                    <td>
                        <form method="post" action="CartServlet">
                            <input type="hidden" name="product_code" value="<%= rs.getString("product_code") %>">
                            <button type="submit" class="cart-btn">🛒 Add to Cart</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) {}
                        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
                    }
                %>
            </tbody>
        </table>
    </div>

    
</div>

</body>
</html>