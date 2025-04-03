package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDateTime;

public class LoginAttempt {
    private int lgAttId;
    private int uid;
    private LocalDateTime attemptTime;
    private LocalDateTime lockUntil;

    // Constructor mặc định
    public LoginAttempt() {
    }

    // Constructor đầy đủ
    public LoginAttempt(int lgAttId, int uid, LocalDateTime attemptTime, LocalDateTime lockUntil) {
        this.lgAttId = lgAttId;
        this.uid = uid;
        this.attemptTime = attemptTime;
        this.lockUntil = lockUntil;
    }

    // Getter và Setter
    public int getLgAttId() {
        return lgAttId;
    }

    public void setLgAttId(int lgAttId) {
        this.lgAttId = lgAttId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public LocalDateTime getAttemptTime() {
        return attemptTime;
    }

    public void setAttemptTime(LocalDateTime attemptTime) {
        this.attemptTime = attemptTime;
    }

    public LocalDateTime getLockUntil() {
        return lockUntil;
    }

    public void setLockUntil(LocalDateTime lockUntil) {
        this.lockUntil = lockUntil;
    }
}