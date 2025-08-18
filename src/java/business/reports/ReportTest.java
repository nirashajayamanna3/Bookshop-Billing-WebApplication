/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business.reports;



public class ReportTest {
    public static void main(String[] args) {
        ReportGenerator salesReport = new SalesReport();
        ReportGenerator stockReport = new StockReport();
        ReportGenerator supplierReport = new SupplierReport();

        System.out.println("=== Generating Sales Report ===");
        salesReport.generateReport();

        System.out.println("\n=== Generating Stock Report ===");
        stockReport.generateReport();

        System.out.println("\n=== Generating Supplier Report ===");
        supplierReport.generateReport();
    }
}
