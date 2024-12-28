package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

public class AuthService {
    private final UserDAO users = new UserDAO();

    public User checkLogin(String email, String password) {
        return users.findByEmail(email, password);
    }

}
