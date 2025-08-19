package business.reports;

public abstract class ReportGenerator {

    // Template Method (cannot be overridden)
    public final void generateReport() {
        fetchData();     // Step 1: Get data
        formatData();    // Step 2: Format
        export();        // Step 3: Export
    }

    // Steps to be implemented by subclasses
    protected abstract void fetchData();
    protected abstract void formatData();

    // Default export method (can be overridden if needed)
    protected void export() {
        System.out.println("Exporting report to PDF...");
    }
}

