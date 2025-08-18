<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@ page import="business.reports.SupplierReport" %>
<%@ page import="business.reports.StockReport" %>
<%@ page import="business.reports.SalesReport" %>
<%@ page import="business.reports.ReportGenerator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Bookshop Reports</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        main {
            max-width: 800px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            margin-top: 0;
            color: #34495e;
        }
        form {
            margin-bottom: 20px;
        }
        select, input[type="submit"], .back-btn {
            padding: 10px 15px;
            font-size: 16px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #27ae60;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #219150;
        }
        .back-btn {
            background-color: #3498db;
            color: white;
            text-decoration: none;
            display: inline-block;
        }
        .back-btn:hover {
            background-color: #2980b9;
        }
        .report-output {
            margin-top: 20px;
            padding: 15px;
            background-color: #ecf0f1;
            border-radius: 6px;
            white-space: pre-wrap;
        }
    </style>
</head>
<body>
<header>
    <h1>Admin Dashboard - Bookshop Reports</h1>
</header>
<main>
    <h2>Generate Reports</h2>

    <form method="post">
        <label for="reportType">Select Report:</label>
        <select name="reportType" id="reportType">
            <option >Report Type</option>
            <option value="sales">Sales Report</option>
            <option value="stock">Stock Report</option>
            <option value="supplier">Supplier Report</option>
        </select>
        <input type="submit" value="Generate">
        <a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
    </form>

     <%
    String type = request.getParameter("reportType");
    if (type != null) {
        ReportGenerator report = null;

        if ("sales".equals(type)) report = new SalesReport();
        else if ("stock".equals(type)) report = new StockReport();
        else if ("supplier".equals(type)) report = new SupplierReport();

        if (report != null) {
            // Redirect System.out to capture the report output
            java.io.ByteArrayOutputStream baos = new java.io.ByteArrayOutputStream();
            java.io.PrintStream ps = new java.io.PrintStream(baos);
            java.io.PrintStream oldOut = System.out;
            System.setOut(ps);

            report.generateReport(); // calls your existing method

            System.out.flush();
            System.setOut(oldOut); // restore original System.out

            String reportHtml = baos.toString();

            out.println("<div class='report-output'><h3>" + type.substring(0,1).toUpperCase() + type.substring(1) + " Report</h3>");
            out.println(reportHtml.replaceAll("\n", "<br>")); // preserve line breaks in HTML
            out.println("</div>");
        }
    }
%>

</main>
</body>
</html>
