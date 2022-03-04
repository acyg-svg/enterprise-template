package cn.cyg.enterprise.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Announcement {

    private Integer announcementId;

    private String content;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date uptime;

    public Integer getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(Integer announcementId) {
        this.announcementId = announcementId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    @Override
    public String toString() {
        return "Announcement{" +
                "announcementId=" + announcementId +
                ", content='" + content + '\'' +
                ", uptime=" + uptime +
                '}';
    }
}
