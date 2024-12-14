package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class Seller {
    private int uid;
    private LocalDate registryDate;
    private double balance;

    public Seller() { }

    public Seller(int uid, LocalDate registryDate, double balance) {
        this.uid = uid;
        this.registryDate = registryDate;
        this.balance = balance;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public LocalDate getRegistryDate() {
        return registryDate;
    }

    public void setRegistryDate(LocalDate registryDate) {
        this.registryDate = registryDate;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
