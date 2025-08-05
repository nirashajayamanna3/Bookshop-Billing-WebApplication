
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer and Product Info</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        label {
            display: inline-block;
            width: 140px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            width: 200px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        input[type="button"],
        button {
            padding: 8px 16px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover,
        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        hr {
            margin: 30px 0;
            border: none;
            height: 1px;
            background-color: #ccc;
        }

        
    </style>
</head>
<body>
    <div>
        <!-- Customer Search Form -->
        <form method="get">
            <label for="name">Customer Name:</label>
            <input type="text" id="name" name="name">
            <input type="submit" value="Search">
            <input type="button" value="Add" onclick="window.location.href='AddCustomer.jsp';">
        </form>
        <table>
        	<tr>
			    <td>Account Number</td>
			    <td>Account Number</td>
			</tr>
			<tr>
			    <td>Name</td>
			    <td>Name</td>
			</tr>
			<tr>
			    <td>Address</td>
			    <td>Address</td>
			</tr>
			<tr>
			    <td>Phone</td>
			    <td>Phone</td>
			</tr>
        </table>

        <hr>

        <!-- Product Selection Form -->
        <form method="get">
            <label for="product">Search Product:</label>
           
            <input type="submit" value="Add">
        </form>

      </div>  
</body>
</html>
