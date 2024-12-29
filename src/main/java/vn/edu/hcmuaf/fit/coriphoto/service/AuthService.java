package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

public class AuthService {
    private UserDAO userDao;

    public AuthService() {
        this.userDao = new UserDAO();
    }

    public User getUserByCredentials(String username, String password) {
        return userDao.getUserByCredentials(username, password);
    }
}
