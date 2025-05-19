package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.AuthenticationDAO;
import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.time.LocalDateTime;

public class AuthService {
    private final UserDAO users = new UserDAO();
    private final AuthenticationDAO auth = new AuthenticationDAO();

    public boolean checkEmail(String email) {
        return users.findByEmail(email) != null;
    }

    public User checkLogin(String email, String password) {
        return users.findByEmail(email, password);
    }

    public User getUserByCredentials(String username, String password) {
        return users.getUserByCredentials(username, password);
    }

    public boolean isEmailExist(String email) {
        // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
        return users.findByEmail(email) != null;
    }

    public boolean registerUser(String email, String password, String username, String name) {
        return users.createUser(email, password, username, name);
    }

    public boolean registerSeller(User seller) {
        return users.createSeller(seller);
    }

    public User getUserByEmail(String email) {
        return users.findByEmail(email);
    }

    public User getUserById(int id) {
        return users.findById(id);
    }

    public void insertFailedLoginAttempt(int uid) {
        auth.insertFailedLoginAttempt(uid);
    }

    public int countFailedLoginAttempts(int uid) {
        return auth.countFailedLoginAttempts(uid);
    }

    public void updateLockUntil(int uid) {
        auth.updateLockUntil(uid);
    }

    public void insertUnlockToken(int uid, String token, LocalDateTime expireTime) {
        auth.insertUnlockToken(uid, token, expireTime);
    }

    public Integer getUidFromToken(String token) {
        return auth.getUidFromToken(token);
    }

    public void unlockAccount(int uid) {
        auth.unlockAccount(uid);
    }

    public void deleteFailedAttempts(int uid) {
        auth.deleteFailedAttempts(uid);
    }

    public void deleteUnlockToken(String token) {
        auth.deleteUnlockToken(token);
    }

    public int countFailedLoginAttemptsInHour(int uid) {
        return auth.countFailedLoginAttemptsInHour(uid);
    }

    public void lockAccount(int uid) {
        auth.lockAccount(uid);
    }

    public LocalDateTime getLockUntil(int uid) {
        return auth.getLockUntil(uid);
    }
}
