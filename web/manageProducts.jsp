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
        body { font-family: Arial, sans-serif; }
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
                    <a href="editProduct.jsp?productCode=<%= code %>">📝 Edit</a> | <br/>
                    <a href="DeleteProductServlet?productCode=<%= code %>" 
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
