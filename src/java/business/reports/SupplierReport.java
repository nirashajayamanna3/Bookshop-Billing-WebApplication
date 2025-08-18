
package business.reports;



public class SupplierReport extends ReportGenerator {

    @Override
    protected void fetchData() {
        // Example: fetch supplier data from DB
        System.out.println("Fetching supplier details from database...");
    }

    @Override
    protected void formatData() {
        // Example: format supplier data into report
        System.out.println("Formatting supplier details into report structure...");
    }
}

