package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.datetime.LocalDateTimeTypeAdapter;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;

import java.time.LocalDateTime;
import java.util.List;

public class LogDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public void insertLog(ActivityLog log) {
        String sql = "INSERT INTO activity_log (severity, uid, username, eventDate, message) VALUES (:severity, :uid, :username, :eventDate, :message)";
        jdbi.withHandle(handle -> (Integer) handle.createUpdate(sql)
                .bind("severity", log.getSeverity())
                .bind("uid", log.getUid())
                .bind("username", log.getUsername())
                .bind("eventDate", log.getEventDate())
                .bind("message", log.getMessage())
                .execute());
    }

    public List<ActivityLog> getLogs() {
        String sqlQuery = "SELECT * FROM activity_log";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .mapToBean(ActivityLog.class).list());
    }
}
