package cn.cyg.enterprise.controller.vo;

import java.io.Serializable;

/**
 * 首页轮播图VO
 */
public class IndexCarouselVO implements Serializable {

    private String carouselUrl;

    private String redirectUrl;

    public String getCarouselUrl() {
        return carouselUrl;
    }

    public void setCarouselUrl(String carouselUrl) {
        this.carouselUrl = carouselUrl;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    @Override
    public String toString() {
        return "IndexCarouselVO{" +
                "carouselUrl='" + carouselUrl + '\'' +
                ", redirectUrl='" + redirectUrl + '\'' +
                '}';
    }
}
