package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.PermissionRoleDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.PermissionRole;

import java.util.List;

public class PermissionRoleService {
    private final PermissionRoleDAO permissionRoleDAO = new PermissionRoleDAO();

    public String getPermissionNameById(int idPermission) {
        return permissionRoleDAO.getPermissionNameById(idPermission);
    }

    public List<PermissionRole> getPermissionRolesByRoleId(int idRole) {
        return permissionRoleDAO.getPermissionRolesByRoleId(idRole);
    }

    public Integer getIdPermissionByIdPR(int idPR) {
        return permissionRoleDAO.getIdPermissionByIdPR(idPR);
    }

    public Integer getIdPRByIdPermission(int idPermission) {
        return permissionRoleDAO.getIdPRByIdPermission(idPermission);
    }
}
