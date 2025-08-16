package persistence.customer;

public class customer {
    private String accountNumber;
    private String name;
    private String address;
    private String phone;
    private String email;

    // No-arg constructor (required for JSP/Servlet frameworks)
    public customer() {
    }

    // Constructor with all fields
    public customer(String accountNumber, String name, String address, String phone, String email) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    // Getters
    public String getAccountNumber() {
        return accountNumber;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    // Setters
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
