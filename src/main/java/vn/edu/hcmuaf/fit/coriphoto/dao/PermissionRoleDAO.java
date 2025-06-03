package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.PermissionRole;

import java.util.List;

public class PermissionRoleDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public String getPermissionNameById(int idPermission) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT description FROM permissions WHERE idPermission = :idPermission")
                        .bind("idPermission", idPermission)
                        .mapTo(String.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    public List<PermissionRole> getPermissionRolesByRoleId(int idRole) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM permission_role WHERE idRole = :idRole")
                        .bind("idRole", idRole)
                        .mapTo(PermissionRole.class)
                        .list()
        );
    }

    public Integer getIdPermissionByIdPR(int idPR) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT idPermission FROM permission_role WHERE idPR = :idPR")
                        .bind("idPR", idPR)
                        .mapTo(Integer.class)
                        .findFirst()
                        .orElse(null)
        );
    }

    public Integer getIdPRByIdPermission(int idPermission) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT idPR FROM permission_role WHERE idPermission = :idPermission")
                        .bind("idPermission", idPermission)
                        .mapTo(Integer.class)
                        .findFirst()
                        .orElse(null)
        );
    }
}
