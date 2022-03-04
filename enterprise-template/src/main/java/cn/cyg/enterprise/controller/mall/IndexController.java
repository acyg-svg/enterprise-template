package cn.cyg.enterprise.controller.mall;

import cn.cyg.enterprise.controller.vo.*;
import cn.cyg.enterprise.service.AnnouncementService;
import cn.cyg.enterprise.service.CarouselService;
import cn.cyg.enterprise.service.GoodsCategoryService;
import cn.cyg.enterprise.common.Constants;
import cn.cyg.enterprise.common.IndexConfigTypeEnum;
import cn.cyg.enterprise.service.IndexConfigService;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private CarouselService carouselService;

    @Resource
    private IndexConfigService indexConfigService;

    @Resource
    private GoodsCategoryService goodsCategoryService;

    @Resource
    private AnnouncementService announcementService;

    @GetMapping({"/index", "/", "/index.html"})
    public String indexPage(HttpServletRequest request) {
        List<IndexCategoryVO> categories = goodsCategoryService.getCategoriesForIndex();
        System.out.println(categories.toString());
        if (CollectionUtils.isEmpty(categories)) {
            return "error/error_5xx";
        }
        List<IndexCarouselVO> carousels = carouselService.getCarouselsForIndex(Constants.INDEX_CAROUSEL_NUMBER);
        List<AnnouncementVO> announcements = announcementService.getAnnouncementsForIndex(Constants.INDEX_ANNOUNCEMENT_NUMBER);
        List<IndexConfigGoodsVO> newGoodses = indexConfigService.getConfigGoodsesForIndex(IndexConfigTypeEnum.INDEX_GOODS_NEW.getType(), Constants.INDEX_GOODS_NEW_NUMBER);
        List<RecommendVO> recommends = indexConfigService.getRecommends(Constants.INDEX_GOODS_RECOMMOND_NUMBER);
        System.out.println(recommends.toString());
        request.setAttribute("categories", categories);//分类数据
        request.setAttribute("carousels", carousels);//轮播图
        request.setAttribute("announcements",announcements);//公告
        request.setAttribute("newGoodses", newGoodses);//新品
        request.setAttribute("recommends",recommends);//推荐
        return "mall/index";
    }
}