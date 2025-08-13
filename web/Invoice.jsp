<%@ page import="business.BillItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            padding: 20px;
        }
        .invoice-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 800px;
            margin: auto;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        table th {
            background: #eee;
        }
        .total {
            font-weight: bold;
        }
        .print-btn {
            margin-top: 20px;
            text-align: center;
        }
        .no-print {
            display: block;
        }
        @media print {
            .no-print {
                display: none;
            }
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="invoice-box">
        <%
            String customerNameInv = (String) session.getAttribute("customerName");
            String customerPhoneInv = (String) session.getAttribute("customerPhone");

            Object billIdObj = session.getAttribute("billId");
            String billIdStr = "N/A";
            if (billIdObj != null) {
                if (billIdObj instanceof Integer) {
                    billIdStr = String.valueOf(((Integer) billIdObj).intValue());
                } else {
                    billIdStr = billIdObj.toString();
                }
            }

            List<BillItem> cartInv = (List<BillItem>) session.getAttribute("cartInv");
            double totalInv = 0;

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            String formattedDate = sdf.format(new Date());
        %>
        <h2>Pahana Edu Bookshop</h2>
        <p><b>INVOICE TO:</b><br>
        <%= customerNameInv != null ? customerNameInv : "Walk-in Customer" %><br>
        Phone: <%= customerPhoneInv != null ? customerPhoneInv : "" %></p>
        <p>Invoice No: <%= billIdStr %></p>
        <p>Date: <%= formattedDate %></p>

        <h3>Purchased Items</h3>
        <table>
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Discount (%)</th>
                <th>Subtotal</th>
            </tr>
            <%
                if (cartInv != null && !cartInv.isEmpty()) {
                    for (BillItem item : cartInv) {
                        String code = item.getProductCode();
                        String name = item.getProductName();
                        double price = item.getUnitPrice();
                        int qty = item.getQuantity();
                        double discount = item.getDiscount();
                        double subtotal = price * qty * (1 - discount / 100.0);
                        totalInv += subtotal;
            %>
            <tr>
                <td><%= code %></td>
                <td><%= name %></td>
                <td><%= qty %></td>
                <td>Rs<%= String.format("%.2f", price) %></td>
                <td><%= String.format("%.2f", discount) %></td>
                <td>Rs<%= String.format("%.2f", subtotal) %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No items purchased.</td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="5" style="text-align:right;"><strong>Total Amount</strong></td>
                <td><strong>Rs<%= String.format("%.2f", totalInv) %></strong></td>
            </tr>
        </table>
        <div class="print-btn no-print">
            <button onclick="window.print()">Print Bill</button>
            <button onclick="window.location.href='home.jsp'">Back</button>
        </div>
        <div class="footer">
            <p>Thank you for your purchase!</p>
        </div>
    </div>
</body>
</html>