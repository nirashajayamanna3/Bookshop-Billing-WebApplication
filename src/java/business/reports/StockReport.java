package business.reports;

public class StockReport extends ReportGenerator {

    @Override
    protected void fetchData() {
        // Example: fetch stock data from DB
        System.out.println("Fetching stock inventory from database...");
    }

    @Override
    protected void formatData() {
        // Example: format stock data into report layout
        System.out.println("Formatting stock inventory into report structure...");
    }
}
