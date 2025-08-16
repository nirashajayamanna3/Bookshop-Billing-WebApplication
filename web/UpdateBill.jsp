<%@page import="persistence.Bill.Bill"%>
<%@page import="persistence.Bill.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String billIdParam = request.getParameter("billId");
    
    int billId = 0;
    

    BillDAO dao = new BillDAO();
    Bill billObj = null;
    try {
        billObj = dao.getBillById(billId);
        if(billObj == null) {
            out.println("Error: Bill not found with id " + billId);
            return;
        }
    } catch(Exception e) {
        out.println("Error loading bill: " + e.getMessage());
        e.printStackTrace();
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Bill</title>
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
        input, select {
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
        <a href="manageCustomer.jsp">👥 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
        <a href="adminDashboard.jsp">📊 REPORTS</a>
        <a href="adminDashboard.jsp">📈 Charts</a>
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <div style="margin-left:500px; padding:20px;">
        <h2>Update Bill</h2>

        <form action="UpdateBillServlet" method="post">
            <label>Bill ID:</label><br>
            <input type="text" name="billId" value="<%=billObj.getBillId()%>" readonly><br>

            <label>Customer Name:</label><br>
            <input type="text" name="customerName" value="<%=billObj.getCustomerName()%>" readonly><br>

            <label>Customer Phone:</label><br>
            <input type="text" name="customerPhone" value="<%=billObj.getPhone()%>" readonly><br>

            <label>Bill Date:</label><br>
            <input type="text" name="billDate" value="<%=billObj.getBillDate()%>" readonly><br>

            <label>Total Amount:</label><br>
            <input type="text" name="totalAmount" value="<%=billObj.getTotalAmount()%>" readonly><br>

            <label>Status:</label><br>
            <select name="status">
                <option value="PENDING" <%= "PENDING".equals(billObj.getStatus()) ? "selected" : "" %>>PENDING</option>
                <option value="PAID" <%= "PAID".equals(billObj.getStatus()) ? "selected" : "" %>>PAID</option>
                <option value="CANCELLED" <%= "CANCELLED".equals(billObj.getStatus()) ? "selected" : "" %>>CANCELLED</option>
            </select><br>

            <input type="submit" value="Update">
        </form>
        <br>
        <a href="manageBill.jsp">🔙 Back to Bill List</a>
    </div>
</body>
</html>
