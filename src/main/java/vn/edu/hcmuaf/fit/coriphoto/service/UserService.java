package vn.edu.hcmuaf.fit.coriphoto.services;

import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.time.LocalDate;
import java.util.List;

public class UserService {
    private UserDAO userDao;

    public UserService() {
        this.userDao = new UserDAO();
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
        return userDao.addPaymentMethodCard(uid, accountName,accountNumber,1,provider,expiryDate,cvc);
    }

    public boolean addPaymentMethodBank(int uid, String accountName, String accountNumber, int pmTypeId, String provider, LocalDate expiryDate) {
        return userDao.addPaymentMethodBank(uid, accountName,accountNumber,2,provider,expiryDate);
    }
}
