package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class View {
    private int id;
    private int pid;
    private LocalDate date;

    public View(int id, int pid, LocalDate date) {
        this.id = id;
        this.pid = pid;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
