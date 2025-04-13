package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class UserService {
    private UserDAO userDao;

    public UserService() {
        this.userDao = new UserDAO();
    }

    public boolean updateAvatarPath(int uid, String avatarPath) {
        return userDao.updateAvatarPath(uid, avatarPath);
    }

    public String getAvatarPath(int uid) {
        return userDao.getAvatarPath(uid);
    }


    public boolean isExistEmail(String email) {
        return userDao.isExistEmail(email);
    }

    public User getUser(int uid) { return userDao.getUser(uid); }

    public String hashPasswordMD5(String password) {
        return userDao.hashPasswordMD5(password);
    }

    public int getUidByEmail(String email) {
        return userDao.getUidByEmail(email);
    }


    public String getFullName(int uid) {
        return userDao.getFullName(uid);
    }

    public String getEmailById(int uid) {
        return userDao.getEmailById(uid);
    }

    public String getUsername(int uid) {
        return userDao.getUsername(uid);
    }

    public User getUserByCredentials(String username, String password) {
        return userDao.getUserByCredentials(username, password);
    }

    public List<PaymentMethod> getAllPaymentMethods(int uid) {
        return userDao.getAllPaymentMethods(uid);
    }

    public boolean deletePaymentMethodById(int pmid) {
        return userDao.deletePaymentMethodById(pmid);
    }

    public boolean isOldPasswordCorrect(int uid, String oldPassword) {
        return userDao.isOldPasswordCorrect(uid, oldPassword);
    }

    public boolean changePassword(int uid, String newPassword) {
        return userDao.changePassword(uid, newPassword);
    }

    public boolean updateProfileName(int uid, String fullname) {
        if (fullname != null && !fullname.trim().isEmpty()) {
            userDao.updateProfileName(uid, fullname);
            return true;
        }
        return false;
    }

    public boolean updateProfileEmail(int uid, String email) {
        if (email != null && !email.trim().isEmpty()) {
            userDao.updateProfileEmail(uid, email);
            return true;
        }
        return false;
    }

    public boolean addPaymentMethodCard(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate, int cvc) {
        return userDao.addPaymentMethodCard(uid, accountName, accountNumber, 1, provider, expiryDate, cvc);
    }

    public boolean addPaymentMethodBank(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate) {
        return userDao.addPaymentMethodBank(uid, accountName, accountNumber, 2, provider, expiryDate);
    }

    public List<User> getAllCustomers() {
        return userDao.getAllCustomers();
    }

    public String getEmail(int uid) {
        return userDao.getEmail(uid);
    }

    public String getPaymentTypeNameByPmid(int pmid) {
        return userDao.getPaymentTypeNameByPmid(pmid);
    }

    public boolean deleteUserById(int userId) {
        return userDao.deleteUserById(userId);
    }

    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    public static void main(String[] args) {
        System.out.println(new UserService().getUser(5));
    }
}
