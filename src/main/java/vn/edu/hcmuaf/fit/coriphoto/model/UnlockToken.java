package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDateTime;

public class UnlockToken {
    private int unlTkId;
    private int uid;
    private String token;
    private LocalDateTime expireTime;

    public UnlockToken() {
    }

    public UnlockToken(int unlTkId, int uid, String token, LocalDateTime expireTime) {
        this.unlTkId = unlTkId;
        this.uid = uid;
        this.token = token;
        this.expireTime = expireTime;
    }

    // Getter và Setter
    public int getUnlTkId() {
        return unlTkId;
    }

    public void setUnlTkId(int unlTkId) {
        this.unlTkId = unlTkId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public LocalDateTime getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(LocalDateTime expireTime) {
        this.expireTime = expireTime;
    }
}