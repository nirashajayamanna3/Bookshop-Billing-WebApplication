package business;




public class BillItem {
    private String productCode;
    private String productName;
    private int quantity;
    private double unitPrice;
    private double discount; // absolute or percent depending on your logic

    public BillItem() {}

    public BillItem(String productCode, String productName, int quantity, double unitPrice, double discount) {
        this.productCode = productCode;
        this.productName = productName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.discount = discount;
    }

    public String getProductCode() { return productCode; }
    public void setProductCode(String productCode) { this.productCode = productCode; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }

    public double getDiscount() { return discount; }
    public void setDiscount(double discount) { this.discount = discount; }

    public double getLineTotal() {
        double total = unitPrice * quantity;
        // If discount is percent (0-100) change logic accordingly. Here we treat discount as absolute amount per line.
        return total - discount;
    }
}