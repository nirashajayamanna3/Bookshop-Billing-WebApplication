package persistence.Bill;

import java.sql.Timestamp;

public class Bill {
    private String billId;
    private String name;
    private String accountNumber;
    private String phone;
    private double totalAmount;
    private Timestamp billDate;
    private BillStatus status;

    public Bill() {
        // Remove unsupported operation exception
    }

    // getters and setters
    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getCustomerName() {
        return name;
    }

    public void setCustomerName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

   public BillStatus getStatus() {
        return status;
    }

    public void setStatus(BillStatus status) {
        this.status = status;
    }

    public String getAccountNumber() {
        
       return accountNumber;
    }
     public void setAccoountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
     public Timestamp getBillDate() {
        
        return billDate;
    }
    public void setBillDate(Timestamp timestamp) {
        this.billDate= timestamp;
    }

    
}
