package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.PermissionDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Permission;

import java.util.List;

public class PermissionService {
    private static final PermissionDAO permissionDAO = new PermissionDAO();

    public List<Permission> getAllPermissions() {
        return permissionDAO.getAllPermissions();
    }

    public List<Permission> getPermissionsByUserAndRole(int uid, int idRole) {
        return permissionDAO.getPermissionsByUserAndRole(uid, idRole);
    }
}
