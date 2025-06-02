package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ActivityLog {
    private int id;
    private String severity;
    private int uid;
    private String username;
    private LocalDateTime eventDate;
    private String message;

    public ActivityLog() { }

    public ActivityLog(String severity, int uid, String username, LocalDateTime eventDate, String message) {
        this.severity = severity;
        this.uid = uid;
        this.username = username;
        this.eventDate = eventDate;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LocalDateTime getEventDate() {
        return eventDate;
    }

    public void setEventDate(LocalDateTime eventDate) {
        this.eventDate = eventDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFormatOrderDateTime() {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss, dd/MM/yyyy");
        return dateTimeFormatter.format(this.eventDate);
    }
}
