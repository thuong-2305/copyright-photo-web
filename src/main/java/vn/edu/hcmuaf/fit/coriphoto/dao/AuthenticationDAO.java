package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

import java.time.LocalDateTime;

public class AuthenticationDAO {
    private static final Jdbi jdbi = new DBConnect().get();


    // === CHỨC NĂNG KHÓA ĐĂNG NHẬP ===

    // Thêm 1 hàng khi user đăng nhập sai
    public void insertFailedLoginAttempt(int uid) {
        String sql = "INSERT INTO login_attempts (uid, attemptTime) VALUES (:uid, NOW())";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .execute()
        );
    }

    // Đếm số lần đăng nhập sai trong 10 phút trước
    public int countFailedLoginAttempts(int uid) {
        String sql = "SELECT COUNT(*) FROM login_attempts WHERE uid = :uid AND attemptTime > NOW() - INTERVAL 10 MINUTE";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Cập nhật lockUntil khi đăng nhập sai >= 5 lần
    public void updateLockUntil(int uid) {
        String sql = "UPDATE login_attempts " +
                "SET lockUntil = NOW() + INTERVAL 10 MINUTE " +
                "WHERE uid = :uid " +
                "AND attemptTime = (SELECT MAX(attemptTime) FROM login_attempts WHERE uid = :uid)";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .execute()
        );
    }

    // Thêm token vào bảng unlock_tokens
    public void insertUnlockToken(int uid, String token, LocalDateTime expireTime) {
        String sql = "INSERT INTO unlock_tokens (uid, token, expireTime) VALUES (:uid, :token, :expireTime)";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .bind("token", token)
                        .bind("expireTime", expireTime)
                        .execute()
        );
    }

    // Kiểm tra token hợp lệ và lấy uid
    public Integer getUidFromToken(String token) {
        String sql = "SELECT uid FROM unlock_tokens WHERE token = :token AND expireTime > NOW()";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("token", token)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(null) // Trả về null nếu không tìm thấy
        );
    }

    // Cập nhật lockUntil về null khi mở khóa
    public void unlockAccount(int uid) {
        String sql = "UPDATE login_attempts SET lockUntil = NULL WHERE uid = :uid";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .execute()
        );
    }

    // Xóa các lượt đăng nhập thất bại trong 10 phút trước
    public void deleteFailedAttempts(int uid) {
        String sql = "DELETE FROM login_attempts WHERE uid = :uid AND attemptTime > NOW() - INTERVAL 10 MINUTE";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .execute()
        );
    }

    // Xóa token sau khi sử dụng
    public void deleteUnlockToken(String token) {
        String sql = "DELETE FROM unlock_tokens WHERE token = :token";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("token", token)
                        .execute()
        );
    }

    // === CHỨC NĂNG KHÓA TÀI KHOẢN ===

    // Đếm số lần đăng nhập sai trong 1 giờ trước
    public int countFailedLoginAttemptsInHour(int uid) {
        String sql = "SELECT COUNT(*) FROM login_attempts WHERE uid = :uid AND attemptTime > NOW() - INTERVAL 60 MINUTE";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Thêm bản ghi vào account_locks khi đăng nhập sai >= 200 lần
    public void lockAccount(int uid) {
        String sql = "INSERT INTO account_locks (uid, lockTime, lockUntil, lockReason) " +
                "VALUES (:uid, NOW(), NOW() + INTERVAL 24 HOUR, 'Nhập sai quá 200 lần trong 1 giờ')";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .execute()
        );
    }

    // Kiểm tra tài khoản có bị khóa hay không
    public LocalDateTime getLockUntil(int uid) {
        String sql = "SELECT lockUntil FROM account_locks " +
                "WHERE uid = :uid AND lockUntil > NOW() " +
                "ORDER BY lockTime DESC LIMIT 1";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("uid", uid)
                        .mapTo(LocalDateTime.class)
                        .findOne()
                        .orElse(null) // Trả về null nếu không có khóa
        );
    }

}
