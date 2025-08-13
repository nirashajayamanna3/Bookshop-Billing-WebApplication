<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
    // Database connection info
    String jdbcURL = "jdbc:mysql://localhost:3306/bookstore"; // Change if needed
    String dbUser = "root";  // Change if needed
    String dbPassword = "";  // Change if needed

    int totalUsers = 0;
    int totalProducts = 0;
    int totalCustomers = 0;
    int totalBills = 0;

    // Map to hold bill statuses and their counts for the pie chart
    Map<String, Integer> billStatusCounts = new HashMap<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Count total users
        PreparedStatement ps1 = conn.prepareStatement("SELECT COUNT(*) FROM user");
        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) totalUsers = rs1.getInt(1);

        // Count total products
        PreparedStatement ps2 = conn.prepareStatement("SELECT COUNT(*) FROM item");
        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) totalProducts = rs2.getInt(1);

        // Count total customers
        PreparedStatement ps3 = conn.prepareStatement("SELECT COUNT(*) FROM customers");
        ResultSet rs3 = ps3.executeQuery();
        if (rs3.next()) totalCustomers = rs3.getInt(1);

        // Count total bills
        PreparedStatement ps4 = conn.prepareStatement("SELECT COUNT(*) FROM bill");
        ResultSet rs4 = ps4.executeQuery();
        if (rs4.next()) totalBills = rs4.getInt(1);

        // Query bill status counts for pie chart
        Statement st = conn.createStatement();
        ResultSet rsStatus = st.executeQuery("SELECT status, COUNT(*) AS count FROM bill GROUP BY status");
        while (rsStatus.next()) {
            billStatusCounts.put(rsStatus.getString("status"), rsStatus.getInt("count"));
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- Google Charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Status', 'Count'],
      <% for (Map.Entry<String, Integer> entry : billStatusCounts.entrySet()) { %>
        ['<%= entry.getKey() %>', <%= entry.getValue() %>],
      <% } %>
    ]);

    var options = {
      title: 'Bill Status Distribution',
      pieHole: 0.4,
      colors: ['#1abc9c', '#3498db', '#e74c3c', '#f39c12', '#9b59b6', '#34495e'],
      chartArea: {width: '90%', height: '80%'}
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(data, options);
  }
</script>

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
    .main-content {
        margin-left: 220px;
        padding: 20px;
    }
    .header {
        background-color: #ecf0f1;
        padding: 15px 20px;
        border-bottom: 1px solid #ccc;
        font-size: 20px;
        font-weight: bold;
    }
    .stats-container {
        display: flex;
        gap: 20px;
        margin-top: 20px;
        justify-content: space-between;
        flex-wrap: nowrap;
    }
    .stat-card {
        background-color: white;
        padding: 15px;
        border-radius: 8px;
        box-shadow: 0 2px 2px rgba(0,0,0,0.1);
        width: 23%;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        opacity: 0;
        transform: translateY(20px);
        animation: fadeInUp 0.6s ease forwards;
    }
    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .stat-card:nth-child(1) { animation-delay: 0.2s; }
    .stat-card:nth-child(2) { animation-delay: 0.6s; }
    .stat-card:nth-child(3) { animation-delay: 1.0s; }
    .stat-card:nth-child(4) { animation-delay: 1.4s; }

    /* Chart card styling */
    .chart-card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        margin-top: 30px;
        padding: 20px;
        max-width: 600px;
    }
</style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3>Pahana Edu Bookshop</h3>
        <a href="adminDashboard.jsp">🏠 Home</a>
        <a href="manageUser.jsp">👥 User</a>
        <a href="manageProducts.jsp">📦 Product</a>
        <a href="manageCustomer.jsp">🧾 Customer</a>
        <a href="manageBill.jsp">📒 Bill</a>
       
        <form action="LogoutServlet" method="get">
            <input type="submit" value="Logout" class="logout-btn">
        </form>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">Welcome, Admin</div>

        <div class="stats-container">
            <div class="stat-card">Total Users<br><%= totalUsers %></div>
            <div class="stat-card">Total Products<br><%= totalProducts %></div>
            <div class="stat-card">Total Customers<br><%= totalCustomers %></div>
            <div class="stat-card">Total Bills<br><%= totalBills %></div>
        </div>

        <div class="chart-card">
            <div id="piechart" style="width: 100%; height: 400px;"></div>
        </div>
    </div>

</body>
</html>
