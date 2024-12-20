package vn.edu.hcmuaf.fit.coriphoto;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public User getUserByCredentials(String username, String password) {
        try {
            Jdbi jdbi = DBConnect.get();
            return jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM users WHERE username = :username AND password = :password")
                            .bind("username", username)
                            .bind("password", password)
                            .map((rs, ctx) -> new User(
                                    rs.getInt("uid"),
                                    rs.getInt("role"),
                                    rs.getString("fullName"),
                                    rs.getString("username"),
                                    rs.getString("password"),
                                    rs.getString("email"),
                                    rs.getDate("createDate").toLocalDate()
                            )).findOne().orElse(null)
            );
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<PaymentMethod> getAllPaymentMethods(int uid) {
        List<PaymentMethod> res = new ArrayList<>();
        try {
            Jdbi jdbi = DBConnect.get();
            System.out.println("Database connection established");
            res = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM payment_method WHERE uid = :uid")
                            .bind("uid", uid)
                            .map((rs, ctx) -> new PaymentMethod(
                                    rs.getInt("pmid"), // Ensure correct column name
                                    rs.getInt("uid"),
                                    rs.getString("accountName"),
                                    rs.getString("accountNumber"),
                                    rs.getInt("pmTypeId"),
                                    rs.getString("provider"),
                                    rs.getObject("expiryDate", LocalDate.class),
                                    rs.getInt("cvc")
                            ))
                            .list()
            );
            System.out.println("Query executed successfully");
        } catch (SQLException e) {
            System.out.println("Error while fetching data: " + e.getMessage());
            e.printStackTrace();
        }
        return res;
    }
    public boolean deletePaymentMethodById(int pmid) {
        try {
            Jdbi jdbi = DBConnect.get();
            return jdbi.withHandle(handle ->
                    handle.execute("DELETE FROM payment_method WHERE pmid = ?", pmid) > 0
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean isOldPasswordCorrect(int uid, String oldPassword) {
        try {
            Jdbi jdbi = DBConnect.get();
            String currentPassword = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT password FROM users WHERE uid = :uid")
                            .bind("uid", uid)
                            .mapTo(String.class)
                            .findOne()
                            .orElse(null)
            );
            return currentPassword != null && currentPassword.equals(oldPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean changePassword(int uid, String newPassword) {
        try {
            Jdbi jdbi = DBConnect.get();
            int updated = jdbi.withHandle(handle ->
                    handle.createUpdate("UPDATE users SET password = :newPassword WHERE uid = :uid")
                            .bind("newPassword", newPassword)
                            .bind("uid", uid)
                            .execute()
            );
            return updated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public void updateProfileName(int uid, String fullname) {
        try {
            Jdbi jdbi = DBConnect.get();
            jdbi.withHandle(handle -> {
                int rowsUpdated = handle.createUpdate("UPDATE users SET fullname = :fullname WHERE uid = :uid")
                        .bind("fullname", fullname)
                        .bind("uid", uid)
                        .execute();
                return null;
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateProfileEmail(int uid, String email) {
        try {
            Jdbi jdbi = DBConnect.get();
            jdbi.withHandle(handle -> {
                int rowsUpdated = handle.createUpdate("UPDATE users SET email = :email WHERE uid = :uid")
                        .bind("email", email)
                        .bind("uid", uid)
                        .execute();
                return null;
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean addPaymentMethodCard(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate, int cvc) {
        try {
            Jdbi jdbi = DBConnect.get();
            return jdbi.withHandle(handle ->
                    handle.execute(
                            "INSERT INTO payment_method (uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc) VALUES (?, ?, ?, ?, ?, ?, ?)",
                            uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc
                    ) > 0
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addPaymentMethodBank(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate) {
        try {
            Jdbi jdbi = DBConnect.get();
            return jdbi.withHandle(handle ->
                    handle.execute(
                            "INSERT INTO payment_method (uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc) VALUES (?, ?, ?, ?, ?, ?, ?)",
                            uid, accountName, accountNumber, pmTypeId, provider, expiryDate, null
                    ) > 0
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }








    // Test lấy data từ database
    public static void main(String[] args) {
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByCredentials("customer1", "customer1");
        if (user != null) {
            System.out.print(user.getEmail() + " " + user.getUsername());
        }
        else {
            System.out.print("Không tim thấy User");
        }
    }



}
