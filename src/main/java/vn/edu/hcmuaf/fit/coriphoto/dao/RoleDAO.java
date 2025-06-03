package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Role;

import java.util.List;

public class RoleDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public List<Role> getAllRoles() {
        String sql = "SELECT id, roleName FROM roles";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> new Role(
                                rs.getInt("id"),
                                rs.getString("roleName")
                        ))
                        .list()
        );
    }
}
