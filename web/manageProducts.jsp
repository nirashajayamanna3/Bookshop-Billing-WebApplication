<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products</title>
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
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="#">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <div style="margin-left:220px; padding:20px;">
        <h2 align="center">Manage Products</h2>
        <div style="text-align: right; margin: 10px;">
            <a href="addProduct.jsp">➕ Add New Product</a>
        </div>

        <table>
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Unit Price (LKR)</th>
                <th>Discount (%)</th>
                <th>Tax (%)</th>
                <th>Actions</th>
            </tr>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    con = DBConnection.getConnection();
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM item");

                    while (rs.next()) {
                        String code = rs.getString("product_code");
                        String name = rs.getString("product_name");
                        String desc = rs.getString("description");
                        double price = rs.getDouble("unit_price");
                        double discount = rs.getDouble("discount");
                        double tax = rs.getDouble("tax");
            %>
            <tr>
                <td><%= code %></td>
                <td><%= name %></td>
                <td><%= desc %></td>
                <td><%= price %></td>
                <td><%= discount %></td>
                <td><%= tax %></td>
                <td>
                    <a href="editProduct.jsp?product_code=<%= code %>">📝 Edit</a> | <br/>
                    <a href="DeleteProductServlet?product_code=<%= code %>" 
                       onclick="return confirm('Are you sure you want to delete this product?');">🗑️ Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            %>
        </table>
    </div>
</body>
</html>
