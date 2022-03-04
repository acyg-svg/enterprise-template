package cn.cyg.enterprise.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class About {
    private Integer aboutId;

    private Integer aboutRank;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date subTime;

    private String aboutTitle;

    private String aboutContent;

    public Integer getAboutId() {
        return aboutId;
    }

    public void setAboutId(Integer aboutId) {
        this.aboutId = aboutId;
    }

    public Integer getAboutRank() {
        return aboutRank;
    }

    public void setAboutRank(Integer aboutRank) {
        this.aboutRank = aboutRank;
    }

    public Date getSubTime() {
        return subTime;
    }

    public void setSubTime(Date subTime) {
        this.subTime = subTime;
    }

    public String getAboutTitle() {
        return aboutTitle;
    }

    public void setAboutTitle(String aboutTitle) {
        this.aboutTitle = aboutTitle;
    }

    public String getAboutContent() {
        return aboutContent;
    }

    public void setAboutContent(String aboutContent) {
        this.aboutContent = aboutContent;
    }

    @Override
    public String toString() {
        return "About{" +
                "aboutId=" + aboutId +
                ", aboutRank=" + aboutRank +
                ", subTime=" + subTime +
                ", aboutTitle='" + aboutTitle + '\'' +
                ", aboutContent='" + aboutContent + '\'' +
                '}';
    }
}