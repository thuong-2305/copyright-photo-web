package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

public class AuthService {
    private final UserDAO users = new UserDAO();

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

}
