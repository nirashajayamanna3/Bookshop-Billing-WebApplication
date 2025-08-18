package business.reports;



import business.reports.ReportGenerator;



public class SalesReport extends ReportGenerator {

    @Override
    protected void fetchData() {
        // Example: fetch sales data from DB
        System.out.println("Fetching sales transactions from database...");
    }

    @Override
    protected void formatData() {
        // Example: format sales data into tables
        System.out.println("Formatting sales data into report structure...");
    }
}
