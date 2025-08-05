<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
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
            width: 80%;
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
        <a href="#">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
    </div>

    <div style="margin-left:220px; padding:20px;">
        <h2 align="center">Manage Users</h2>
        <div style="text-align: right; margin: 10px;">
            <a href="addUser.jsp">➕ Add New User</a>
        </div>

        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Type</th>
                <th>Actions</th>
            </tr>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    con = DBConnection.getConnection();
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM users");

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String password = rs.getString("password");
                        String type = rs.getString("type");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= username %></td>
                <td><%= password %></td>
                <td><%= type %></td>
                <td>
                    <a href="editUser.jsp?id=<%= id %>">📝 Edit</a> |
                    <a href="DeleteUserServlet?id=<%= rs.getInt("id") %>" 
				       onclick="return confirm('Are you sure you want to delete this user?');">🗑️ Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
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

