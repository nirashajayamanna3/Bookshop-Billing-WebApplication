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
        /* Reset some default browser styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
            color: #333;
        }

        /* Header styles */
        .header-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #2a3f54;
            color: #fff;
            padding: 15px 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .header-bar h1 {
            font-size: 24px;
        }

        .header-actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .logout-btn, .cart-link {
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: #fff;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .cart-link {
            background-color: #27ae60;
            color: #fff;
        }

        .cart-link:hover {
            background-color: #1e8449;
        }

        /* Container and layout */
        .container {
            display: flex;
            justify-content: center;
            padding: 30px;
        }

        .product-table {
            width: 100%;
            max-width: 1000px;
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        .product-table th {
            background-color: #34495e;
            color: #fff;
            padding: 12px;
            text-align: center;
            border-radius: 5px 5px 0 0;
        }

        .product-table td {
            background-color: #fff;
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #ddd;
            border-radius: 0 0 5px 5px;
        }

        .product-table tr:hover td {
            background-color: #f1f7fc;
        }

        .cart-btn {
            background-color: #2980b9;
            color: #fff;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 5px;
            transition: 0.3s;
        }

        .cart-btn:hover {
            background-color: #1c5980;
        }

        /* Responsive adjustments */
        @media(max-width: 768px) {
            .container {
                padding: 20px;
            }

            .header-bar {
                flex-direction: column;
                gap: 10px;
            }

            .product-table th, .product-table td {
                font-size: 14px;
                padding: 10px;
            }

            .cart-btn {
                padding: 6px 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<div class="header-bar">
    <h1>Pahana Edu Bookshop</h1>
    <div class="header-actions">
        <a href="cart.jsp" class="cart-link">🛒 Cart</a>
        <form action="LogoutServlet" method="get" style="display:inline;">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>
</div>

<div class="container">
    <table class="product-table">
        <thead>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Price</th>
                <th>Discount</th>
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
                        <button type="submit" class="cart-btn">Add to Cart</button>
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

</body>
</html>
