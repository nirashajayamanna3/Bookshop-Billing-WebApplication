<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Items</title>
    <style>
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #aaa;
            padding: 8px 12px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<h1>Product Items</h1>

<table>
    <tr>
        <th>Product Code</th>
        <th>Product Name</th>
        <th>Description</th>
        <th>Unit Price (LKR)</th>
        <th>Discount (%)</th>
        <th>Tax (%)</th>
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
        <td><%= rs.getString("description") %></td>
        <td><%= rs.getDouble("unit_price") %></td>
        <td><%= rs.getDouble("discount") %></td>
        <td><%= rs.getDouble("tax") %></td>
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
</body>
</html>

