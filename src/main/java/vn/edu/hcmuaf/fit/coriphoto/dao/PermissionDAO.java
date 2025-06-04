package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Permission;

import java.util.List;

public class PermissionDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public List<Permission> getAllPermissions() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT idPermission, description FROM permissions")
                        .mapToBean(Permission.class)
                        .list()
        );
    }

    public List<Permission> getPermissionsByUserAndRole(int uid, int idRole) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT p.* " +
                                "FROM permissions p " +
                                "JOIN permission_role pr ON p.idPermission = pr.idPermission " +
                                "JOIN permission_user pu ON pr.idPR = pu.idPR " +
                                "WHERE pu.uid = :uid AND pr.idRole = :idRole")
                        .bind("uid", uid)
                        .bind("idRole", idRole)
                        .mapToBean(Permission.class)
                        .list()
        );
    }
}
