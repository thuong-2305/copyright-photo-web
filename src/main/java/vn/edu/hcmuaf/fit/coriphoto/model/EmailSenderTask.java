package vn.edu.hcmuaf.fit.coriphoto.model;

import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

public class EmailSenderTask implements Runnable {
    private final String to;
    private final String subject;
    private final String body;

    public EmailSenderTask(String to, String subject, String body) {
        this.to = to;
        this.subject = subject;
        this.body = body;
    }

    @Override
    public void run() {
        EmailUtils.sendEmail(to, subject, body);
    }
}