package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

import java.util.List;

public class PermissionUserDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public int insertPermissionUser(int idPR, int uid) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO permission_user (idPR, uid) VALUES (:idPR, :uid)")
                        .bind("idPR", idPR)
                        .bind("uid", uid)
                        .executeAndReturnGeneratedKeys("idPU")
                        .mapTo(int.class)
                        .one()
        );
    }

    public List<Integer> getPermissionRolesByUserId(int uid) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT idPR FROM permission_user WHERE uid = :uid")
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .list()
        );
    }

    public boolean hasPermission(int uid, int idPR) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM permission_user WHERE uid = :uid AND idPR = :idPR")
                        .bind("uid", uid)
                        .bind("idPR", idPR)
                        .mapTo(Integer.class)
                        .one() > 0
        );
    }

    public boolean removePermissionUser(int uid, int idPR) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM permission_user WHERE uid = :uid AND idPR = :idPR")
                        .bind("uid", uid)
                        .bind("idPR", idPR)
                        .execute() > 0
        );
    }

}
