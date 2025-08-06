package persistence.Product;

public class Product {
    private String productCode;
    private String productName;
    private String description;
    private double unitPrice;
    private double discount;
    private double tax;

    // Default constructor
    public Product() {}

    // Parameterized constructor
    public Product(String productCode, String productName, String description,
                   double unitPrice, double discount, double tax) {
        this.productCode = productCode;
        this.productName = productName;
        this.description = description;
        this.unitPrice = unitPrice;
        this.discount = discount;
        this.tax = tax;
    }

    // Getters and Setters

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    @Override
    public String toString() {
        return "Product [productCode=" + productCode + ", productName=" + productName +
               ", description=" + description + ", unitPrice=" + unitPrice +
               ", discount=" + discount + ", tax=" + tax + "]";
    }
}
