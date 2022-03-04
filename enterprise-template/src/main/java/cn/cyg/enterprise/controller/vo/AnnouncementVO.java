package cn.cyg.enterprise.controller.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告栏项VO
 */
public class AnnouncementVO implements Serializable {

    private Integer announcementId;

    private String content;

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
        return "AnnouncementVO{" +
                "announcementId=" + announcementId +
                ", content='" + content + '\'' +
                ", uptime=" + uptime +
                '}';
    }
}