package business;

import persistence.Product.Product;


public class BillItem {
    private String product_code;
    private String product_name;
    private int quantity;
    private double unit_price;
    private double discount;
    private double tax;
    private double subtotal;
    private Product product;

    public BillItem(String code, String name, int quantity, double unitPrice, double discount, double tax) {
        this.product_code = code;
        this.product_name = name;
        this.quantity = quantity;
        this.unit_price = unitPrice;
        this.discount = discount;
        this.tax = tax;
        this.subtotal = calculateSubtotal();
    }

    BillItem() {
        
    }

    private double calculateSubtotal() {
        double total = quantity * unit_price;
        double discountAmount = total * (discount / 100.0);
        double taxAmount = (total - discountAmount) * (tax / 100.0);
        return total - discountAmount + taxAmount;
    }


    public Product getProduct() { return product; }
    public int getQuantity() { return quantity; }
    public double getDiscount() { return discount; }
    public double getTax() { return tax; }

    public double getSubtotal() {
        double base = product.getUnitPrice() * quantity;
        double discounted = base - (base * discount / 100);
        return discounted + (discounted * tax / 100);
    }

     // ✅ Implement these setters properly
    public void setProduct(String productName) {
        this.product_name = productName;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.subtotal = calculateSubtotal();
    }

    public void setUnitPrice(double unitPrice) {
        this.unit_price = unitPrice;
        this.subtotal = calculateSubtotal();
    }

    public void setDiscount(double discount) {
        this.discount = discount;
        this.subtotal = calculateSubtotal();
    }

    public void setTax(double tax) {
        this.tax = tax;
        this.subtotal = calculateSubtotal();
    }
}
