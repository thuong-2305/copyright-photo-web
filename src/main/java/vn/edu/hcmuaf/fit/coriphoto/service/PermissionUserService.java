package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.PermissionUserDAO;

import java.util.List;

public class PermissionUserService {
    private final PermissionUserDAO permissionUserDAO = new PermissionUserDAO();

    public int insertPermissionUser(int idPR, int uid) {
        return permissionUserDAO.insertPermissionUser(idPR, uid);
    }

    public List<Integer> getPermissionRolesByUserId(int uid) {
        return permissionUserDAO.getPermissionRolesByUserId(uid);
    }

    public boolean hasPermission(int uid, int idPR) {
        return permissionUserDAO.hasPermission(uid, idPR);
    }

    public boolean removePermissionUser(int uid, int idPR) {
        return permissionUserDAO.removePermissionUser(uid, idPR);
    }

}
