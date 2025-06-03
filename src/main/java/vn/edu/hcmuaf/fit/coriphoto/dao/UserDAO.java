package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.AccountLock;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.util.List;

public class UserDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public UserDAO() {
    }

    public String getFullName(int uid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT fullname FROM users WHERE uid = ?")
                .bind(0, uid).mapTo(String.class).one());
    }

    public boolean lockUser(AccountLock accountLock) {
        try {
            int rowsAffected = jdbi.withHandle(handle -> handle.createUpdate(
                            "INSERT INTO account_locks (uid, lockTime, lockUntil, lockReason) VALUES (:uid, :lockTime, :lockUntil, :lockReason)")
                    .bind("uid", accountLock.getUid())
                    .bind("lockTime", accountLock.getLockTime())
                    .bind("lockUntil", accountLock.getLockUntil())
                    .bind("lockReason", accountLock.getLockReason())
                    .execute());
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUser(int uid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM users WHERE uid = ?")
                .bind(0, uid).mapToBean(User.class).first());
    }


    public boolean updateAvatarPath(int uid, String avatarPath) {
        int rowsAffected = jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE users SET avtUrl = :avatarPath WHERE uid = :uid")
                        .bind("avatarPath", avatarPath)
                        .bind("uid", uid)
                        .execute()
        );
        return rowsAffected > 0; // Trả về true nếu có ít nhất 1 dòng được cập nhật
    }

    public String getAvatarPath(int uid) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT avtUrl FROM users WHERE uid = :uid")
                        .bind("uid", uid)
                        .mapTo(String.class)
                        .findOne() // Sử dụng findOne() để tránh lỗi nếu không có kết quả
                        .orElse("assets/images/avatar-default.png") // Ảnh mặc định nếu user chưa có ảnh
        );
    }



    public String getUsername(int uid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT username FROM users WHERE uid = ?")
                .bind(0, uid).mapTo(String.class).one());
    }

    public boolean isExistEmail(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM users WHERE email = ?")
                        .bind(0, email)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }


    public String getEmail(int uid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT email FROM users WHERE uid = ?")
                .bind(0, uid).mapTo(String.class).one());
    }

    public String getPaymentTypeNameByPmid(int pmid) {
        String sql = """
                    SELECT pt.pmTypeName 
                    FROM payment_type pt
                    JOIN payment_method pm ON pm.pmTypeId = pt.pmTypeId
                    WHERE pm.pmid = :pmid
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("pmid", pmid)  // Dùng tham số đặt tên
                        .mapTo(String.class)
                        .findOne()
                        .orElse("Khác")
        );
    }


    public User findByEmail(String email, String password) {
        String hashPassword = hashPasswordMD5(password);//Mã hóa pass để so sánh với db
        String query = "SELECT * FROM users WHERE (email = ? OR username = ?) and password = ?";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind(0, email)
                        .bind(1, email)
                        .bind(2, hashPassword)
                        .mapToBean(User.class).findFirst()
                        .orElse(null));
    }

    public User findByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = :email OR username = :email";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("email", email) // Gắn giá trị tham số email
                        .map((rs, ctx) -> new User(
                                rs.getInt("uid"),
                                rs.getInt("role"),
                                rs.getString("fullName"),
                                rs.getString("username"),
                                rs.getString("password"),
                                rs.getString("email"),
                                rs.getObject("createDate", LocalDate.class)
                        ))
                        .findFirst()
                        .orElse(null)
        );
    }


    public String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    public boolean createSeller(User seller) {
        //cập nhật info user gồm role seller / nếu có thay đổi email/username
        updateUser(seller);
        //Thêm info của seller
        jdbi.useHandle(handle -> handle.execute(
                "INSERT INTO sellers (uid, registryDate, balance) VALUES (?, ?, ?)",
                seller.getUid(), LocalDate.now(), 0
        ));
        return true;
    }

    public boolean updateUser(User user) {
        String sql = """
                UPDATE users
                SET 
                    role = :role,
                    fullName = :fullName,
                    username = :username,
                    password = :password,
                    email = :email,
                    createDate = :createDate
                WHERE uid = :uid
                """;

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", user.getUid())
                        .bind("role", user.getRole())
                        .bind("fullName", user.getFullName())
                        .bind("username", user.getUsername())
                        .bind("password", user.getPassword())
                        .bind("email", user.getEmail())
                        .bind("createDate", user.getCreateDate())
                        .execute() > 0
        );
    }

    public User getUserByCredentials(String username, String password) {
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
    }

    public List<PaymentMethod> getAllPaymentMethods(int uid) {
        System.out.println("Database connection established");
        return jdbi.withHandle(handle ->
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
                        )).list()
        );
    }

    public boolean deletePaymentMethodById(int pmid) {
        return jdbi.withHandle(handle ->
                handle.execute("DELETE FROM payment_method WHERE pmid = ?", pmid) > 0
        );
    }

    public boolean isOldPasswordCorrect(int uid, String oldPassword) {
        String currentPassword = jdbi.withHandle(handle ->
                handle.createQuery("SELECT password FROM users WHERE uid = :uid")
                        .bind("uid", uid)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
        String hashedOldPassword = hashPasswordMD5(oldPassword);
        return currentPassword != null && currentPassword.equals(hashedOldPassword);
    }


    public boolean changePassword(int uid, String newPassword) {
        String hashedPassword = hashPasswordMD5(newPassword);
        int updated = jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = :newPassword WHERE uid = :uid")
                        .bind("newPassword", hashedPassword)
                        .bind("uid", uid)
                        .execute()
        );
        return updated > 0;
    }

    public boolean createUser(String email, String password, String username, String name) {
        String hashedPassword = hashPasswordMD5(password);
        if (hashedPassword == null) return false;

        jdbi.useHandle(handle -> handle.execute(
                "INSERT INTO users (role, fullname, username, email, password, createDate) VALUES (?, ?, ?, ?, ?, ?)",
                2, name, username, email, hashedPassword, LocalDate.now()
        ));

        return true;
    }

    public boolean createUser(User user) {
        String hashedPassword = hashPasswordMD5(user.getPassword());
        if (hashedPassword == null) return false;
        jdbi.useHandle(handle -> handle.execute(
                "INSERT INTO users (role, fullname, username, email, password, createDate) VALUES (?, ?, ?, ?, ?, ?)",
                user.getRole(), user.getFullName(), user.getUsername(), user.getEmail(), hashedPassword, LocalDate.now()
        ));
        return true;
    }


    public int getUidByEmail(String email) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT uid FROM users WHERE email = :email")
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(-1) // Trả về -1 nếu không tìm thấy
        );
    }

    public void updateProfileName(int uid, String fullname) {
        jdbi.withHandle(handle -> {
            handle.createUpdate("UPDATE users SET fullname = :fullname WHERE uid = :uid")
                    .bind("fullname", fullname)
                    .bind("uid", uid)
                    .execute();
            return null;
        });
    }

    public void updateProfileEmail(int uid, String email) {
        jdbi.withHandle(handle -> {
            handle.createUpdate("UPDATE users SET email = :email WHERE uid = :uid")
                    .bind("email", email)
                    .bind("uid", uid)
                    .execute();
            return null;
        });
    }

    public boolean addPaymentMethodCard(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate, int cvc) {
        return jdbi.withHandle(handle ->
                handle.execute(
                        "INSERT INTO payment_method (uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc
                ) > 0
        );
    }

    public boolean addPaymentMethodBank(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate) {
        return jdbi.withHandle(handle ->
                handle.execute(
                        "INSERT INTO payment_method (uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        uid, accountName, accountNumber, pmTypeId, provider, expiryDate, null
                ) > 0
        );
    }

    public List<User> getAllCustomers() {
        return jdbi.withHandle(handle -> handle.createQuery("select * from users where role = :role").bind("role", 2)
                .mapToBean(User.class).list());
    }

    public User findById(int id) {
        String query = "SELECT * FROM users WHERE uid = :uid";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", id) // Gắn giá trị tham số email
                        .map((rs, ctx) -> new User(
                                rs.getInt("uid"),             // Mapping cột "uid"
                                rs.getInt("role"),            // Mapping cột "role"
                                rs.getString("fullName"),     // Mapping cột "fullName"
                                rs.getString("username"),     // Mapping cột "username"
                                rs.getString("password"),     // Mapping cột "password"
                                rs.getString("email"),        // Mapping cột "email"
                                rs.getObject("createDate", LocalDate.class) // Mapping cột "createDate"
                        ))
                        .findOne()
                        .orElse(null) // Trả về null nếu không tìm thấy
        );
    }

    public boolean deleteUserById(int userId) {
        return jdbi.withHandle(handle ->
                handle.execute("DELETE FROM users WHERE uid = ?", userId) > 0
        );
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        User test = userDAO.getUser(10);
        System.out.println(test);
    }

    public String getEmailById(int uid) {
        String query = "SELECT email FROM users WHERE uid = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query).bind(0, uid).mapTo(String.class).one());
    }
}
