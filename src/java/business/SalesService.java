/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package business;

import persistence.Product.Product;
import persistence.Product.ProductDAO;

public class SalesService {
    private ProductDAO productDAO = new ProductDAO();

    public double calculateTotal(String productCode, int qty) throws Exception {
        Product p = productDAO.getProductByCode(productCode);
        if (p == null) {
            throw new IllegalArgumentException("Product not found: " + productCode);
        }

        double subtotal = p.getUnitPrice() * qty;

        // Discount (assuming it's stored as percentage, e.g., 10 = 10%)
        double discountAmount = (subtotal * p.getDiscount()) / 100.0;

        // Apply discount first
        double afterDiscount = subtotal - discountAmount;

        // Tax (assuming percentage, e.g., 15 = 15%)
        double taxAmount = (afterDiscount * p.getTax()) / 100.0;

        return afterDiscount + taxAmount;
    }
}
