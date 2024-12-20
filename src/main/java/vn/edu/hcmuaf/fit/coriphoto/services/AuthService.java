package vn.edu.hcmuaf.fit.coriphoto.services;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDao;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

public class AuthService {
    public boolean checkLogin(String email, String password) {
        UserDao userDao = new UserDao();
        User user = userDao.findByEmail(email);
        if (user == null) {return false;}
        return user.getPassword().equalsIgnoreCase(password);
    }

//    public static void main(String[] args) {
//        AuthService authService = new AuthService();
//        System.out.println(authService.checkLogin("cust1@gmail.com", "customer1"));
//
//    }
}
