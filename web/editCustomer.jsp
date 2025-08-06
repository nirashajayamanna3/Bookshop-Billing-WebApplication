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
        <h3 style="padding-left:10px;">Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="#">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
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
