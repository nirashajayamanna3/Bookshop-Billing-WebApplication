
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
	<style>
        body {
            font-family: Arial, sans-serif;
            
        }
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
       
    </style>
</head>
<body>
    
    <div class="sidebar">
        <form action="LogoutServlet" method="get" style="text-align: right; margin: 10px;  ">
    <input type="submit" value="Logout" style="padding: 8px 16px; background-color: #f44336; border: none; border-radius: 4px;">
        </form>
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        
        <a href="#">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">👥 Customer</a>
        
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="#">📊 REPORTS</a>
        <a href="#">📈 Charts</a>
    </div>
</body>
</html>