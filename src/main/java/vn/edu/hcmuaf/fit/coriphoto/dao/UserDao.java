package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.sql.ResultSet;
import java.time.LocalDate;

public class UserDao {
    public UserDao() {
    }

    public User findByEmail(String email) {
        User user = null;
        try {
            Jdbi jdbi = DBConnect.get();
            String query = "SELECT * FROM users WHERE email = :email";

            user = jdbi.withHandle(handle ->
                    handle.createQuery(query)
                            .bind("email", email) // Gắn giá trị tham số email
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

        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
        }
        return user;
    }
}
