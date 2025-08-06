<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Customers</title>
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
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="#">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
    </div>

    <div style="margin-left:220px; padding:20px;">
        <h2 align="center">Manage Customers</h2>
        

        <table>
            <tr>
                <th>Account Number</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    con = DBConnection.getConnection();
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM customers");

                    while (rs.next()) {
                        String accNo = rs.getString("accountNumber");
                        String name = rs.getString("name");
                        String address = rs.getString("address");
                        String phone = rs.getString("phone");
                        String email = rs.getString("email");
            %>
            <tr>
                <td><%= accNo %></td>
                <td><%= name %></td>
                <td><%= address %></td>
                <td><%= phone %></td>
                <td><%= email %></td>
                <td>
                    <a href="editCustomer.jsp?accountNumber=<%= accNo %>">📝 Edit</a> | <br/>
                    <a href="DeleteCustomerServlet?accountNumber=<%= accNo %>" 
                       onclick="return confirm('Are you sure you want to delete this customer?');">🗑️ Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
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
