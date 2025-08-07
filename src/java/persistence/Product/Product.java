package persistence.Product;

public class Product {
    private String product_code;
    private String product_name;
    private String description;
    private double unit_price;
    private double discount;
    private double tax;

    // Default constructor
    public Product() {}

    // Parameterized constructor
    public Product(String product_code, String product_name, String description,
                   double unit_price, double discount, double tax) {
        this.product_code = product_code;
        this.product_name = product_name;
        this.description = description;
        this.unit_price = unit_price;
        this.discount = discount;
        this.tax = tax;
    }

    // Getters and Setters

    public String getProductCode() {
        return product_code;
    }

    public void setProductCode(String product_code) {
        this.product_code = product_code;
    }

    public String getProductName() {
        return product_name;
    }

    public void setProductName(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getUnitPrice() {
        return unit_price;
    }

    public void setUnitPrice(double unit_price) {
        this.unit_price = unit_price;
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
        return "Product [product_code=" + product_code + ", product_name=" + product_name +
               ", description=" + description + ", unit_price=" + unit_price +
               ", discount=" + discount + ", tax=" + tax + "]";
    }

    public boolean equalsIgnoreCase(String productName) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
