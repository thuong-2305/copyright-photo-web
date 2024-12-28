package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.time.LocalDate;

public class UserDAO {
    private static final Jdbi jdbi = new DBConnect().get();
    public UserDAO() { }

    public User findByEmail(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM users WHERE email = ? and password = ?";
            user = jdbi.withHandle(handle ->
                    handle.createQuery(query)
                            .bind(0, email)
                            .bind(1, password)
                            .mapToBean(User.class).findFirst()
                            .orElse(null)
            );
        } catch (Exception _) { }
        return user;
    }
}
