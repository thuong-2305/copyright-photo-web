package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.LogDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;

import java.util.List;

public class LogService {

    private final LogDAO log = new LogDAO();

    public void insertLog(ActivityLog actLog) {
        log.insertLog(actLog);
    }

    public List<ActivityLog> getLogs() { return log.getLogs(); }

}
