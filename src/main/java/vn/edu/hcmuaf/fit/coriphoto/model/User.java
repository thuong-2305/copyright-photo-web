package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class User {
    private int uid;
    private int role;
    private String fullName;
    private String username;
    private String password;
    private String email;
    private LocalDate createDate;

    public User() {}

    public User(int uid, int role, String fullName, String username, String password, String email, LocalDate createDate) {
        this.uid = uid;
        this.role = role;
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.email = email;
        this.createDate = createDate;
    }

    public User(int uid, int role, String fullName, String username, String password, String email) {
        this.uid = uid;
        this.role = role;
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }
}
