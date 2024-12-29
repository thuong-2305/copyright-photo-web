package vn.edu.hcmuaf.fit.coriphoto.services;
import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

public class AuthService {
    private final UserDAO userDao = new UserDAO();

    public boolean isEmailExist(String email) {
        // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
        return userDao.findByEmail(email) != null;
    }

    public boolean registerUser(String email, String password, String username) {
        // Tạo tài khoản mới
        return userDao.createUser(email, password, username);
    }


    public boolean checkLogin(String email, String password) {
        UserDAO userDao = new UserDAO();
        User user = userDao.findByEmail(email);

        if (user == null) {
            return false;
        }

        // Băm mật khẩu nhập vào và so sánh với mật khẩu trong cơ sở dữ liệu
        String hashedPassword = userDao.hashPasswordMD5(password);
        assert hashedPassword != null;
        return hashedPassword.equals(user.getPassword());
    }

    public User getUserByEmail(String email) {
        return userDao.findByEmail(email);
    }
}
