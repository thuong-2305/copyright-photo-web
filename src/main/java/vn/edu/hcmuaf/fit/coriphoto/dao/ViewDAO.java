package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

public class ViewDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public ViewDAO() {
    }

    // Tăng view_count cho sản phẩm có pid; nếu chưa có bản ghi thì insert mới
    public void incrementView(String pid, int uid, String sessionId) {
        int updated = jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE views SET view_count = view_count + 1, updated_at = NOW() WHERE pid = :pid")
                        .bind("pid", pid)
                        .execute()
        );
        if (updated == 0) {
            // Nếu bản ghi không tồn tại => INSERT
            jdbi.useHandle(handle ->
                    handle.createUpdate("INSERT INTO views (uid, pid, created_at, updated_at, view_count, session_id) " +
                                    "VALUES (:uid, :pid, NOW(), NOW(), 1, :sessionId)")
                            .bind("uid", uid)
                            .bind("pid", pid)
                            .bind("sessionId", sessionId)
                            .execute()
            );
        }
    }
}