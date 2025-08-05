
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            border-collapse: collapse;
            margin: 20px auto;
            width: 90%;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px 15px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f7f7f7;
            color: #555;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <h1>Customer Details</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
        </tr>

        <%
            try {
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM customers");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("accountNumber") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("phone") %></td>
            <td><%= rs.getString("email") %></td>
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
    <div align="center">
	    <a href="home.jsp">⬅ Back to Customer List</a>
	</div>
</body>
</html>
