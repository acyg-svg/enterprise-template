package cn.cyg.enterprise.controller.vo;

import java.io.Serializable;

public class AboutVO implements Serializable {

    private Integer aboutId;

    private String aboutContent;

    public Integer getAboutId() {
        return aboutId;
    }

    public void setAboutId(Integer aboutId) {
        this.aboutId = aboutId;
    }

    public String getAboutContent() {
        return aboutContent;
    }

    public void setAboutContent(String aboutContent) {
        this.aboutContent = aboutContent;
    }

    @Override
    public String toString() {
        return "AboutVO{" +
                "aboutId=" + aboutId +
                ", aboutContent='" + aboutContent + '\'' +
                '}';
    }
}

