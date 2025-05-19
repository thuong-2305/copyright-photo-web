package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDateTime;

public class AccountLock {
    private int accLkId;
    private int uid;
    private LocalDateTime lockTime;
    private LocalDateTime lockUntil;
    private String lockReason; // Có thể null

    // Constructor mặc định
    public AccountLock() {
    }

    // Constructor đầy đủ
    public AccountLock(int accLkId, int uid, LocalDateTime lockTime, LocalDateTime lockUntil, String lockReason) {
        this.accLkId = accLkId;
        this.uid = uid;
        this.lockTime = lockTime;
        this.lockUntil = lockUntil;
        this.lockReason = lockReason;
    }

    // Getter và Setter
    public int getAccLkId() {
        return accLkId;
    }

    public void setAccLkId(int accLkId) {
        this.accLkId = accLkId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public LocalDateTime getLockTime() {
        return lockTime;
    }

    public void setLockTime(LocalDateTime lockTime) {
        this.lockTime = lockTime;
    }

    public LocalDateTime getLockUntil() {
        return lockUntil;
    }

    public void setLockUntil(LocalDateTime lockUntil) {
        this.lockUntil = lockUntil;
    }

    public String getLockReason() {
        return lockReason;
    }

    public void setLockReason(String lockReason) {
        this.lockReason = lockReason;
    }
}