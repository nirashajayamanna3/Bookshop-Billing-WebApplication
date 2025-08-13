<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="persistence.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Bills</title>
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
        select {
            padding: 4px;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            color: white;
        }
        .btn-update { background-color: #27ae60; }
        .btn-delete { background-color: #e74c3c; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="#">📒 Bill</a>
        
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <div style="margin-left:220px; padding:20px;">
        <h2 align="center">Bill History</h2>
        
        <table>
            <tr>
                <th>Bill ID</th>
                <th>Customer Name</th>
                <th>Customer Phone</th>
                <th>Bill Date</th>
                <th>Total Amount</th>
               
                
            </tr>

            <%
                try {
                    Connection con = DBConnection.getConnection();
                    Statement st = con.createStatement();
                    String sql = "SELECT bill_id, customer_name, customer_phone, bill_date, total_amount FROM bill";
                    ResultSet rs = st.executeQuery(sql);

                    while (rs.next()) {
                        int billId = rs.getInt("bill_id");
                        String name = rs.getString("customer_name");
                        String phone = rs.getString("customer_phone");
                        String date = rs.getString("bill_date");
                        double total = rs.getDouble("total_amount");
                        
            %>
            <tr>
                <form action="UpdateBillServlet" method="post">
                    <td><%= billId %></td>
                    <td><%= name %></td>
                    <td><%= phone %></td>
                    <td><%= date %></td>
                    <td><%= String.format("%.2f", total) %></td>
                   
                    
                </form>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='7'>Error loading data: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>
