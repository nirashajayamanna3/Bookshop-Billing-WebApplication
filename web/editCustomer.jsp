<%@page import="persistence.customer.customerDAO"%>
<%@page import="persistence.customer.customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accountNumber = request.getParameter("accountNumber");
    customerDAO dao = new customerDAO();
    customer customer = dao.getCustomerByAccountNumber(accountNumber);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
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
    }        input[type="text"], input[type="email"] {
            width: 300px;
            padding: 8px;
            margin: 5px 0;
        }
        input[type="submit"] {
            padding: 10px 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h3>Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">🧾 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
         <a href="manageSuppliers.jsp">👥 Supplier</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>
    <div style="margin-left:500px; padding:20px;">
        <h2 >Edit Customer</h2>
    
    <form action="EditCustomerServlet" method="post">
        <label>Account Number:</label><br>
        <input type="text" name="accountNumber" value="<%=customer.getAccountNumber()%>" readonly><br>

        <label>Name:</label><br>
        <input type="text" name="name" value="<%=customer.getName()%>" required><br>

        <label>Address:</label><br>
        <input type="text" name="address" value="<%=customer.getAddress()%>" required><br>

        <label>Phone:</label><br>
        <input type="text" name="phone" value="<%=customer.getPhone()%>" required><br>

        <label>Email:</label><br>
        <input type="email" name="email" value="<%=customer.getEmail()%>" required><br>

        <input type="submit" value="Update">
    </form>
    <br>
    <a href="manageCustomer.jsp">🔙 Back to Customer List</a>
    </div>
</body>
</html>
