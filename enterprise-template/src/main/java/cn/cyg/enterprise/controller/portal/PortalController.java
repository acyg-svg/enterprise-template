package cn.cyg.enterprise.controller.portal;

import cn.cyg.enterprise.common.Constants;
import cn.cyg.enterprise.controller.vo.AboutVO;
import cn.cyg.enterprise.entity.About;
import cn.cyg.enterprise.service.AboutService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PortalController {

    @Resource
    private AboutService aboutService;

    @GetMapping({"/portal"})
    public String portal(){
        return "portal/index";
    }

    @GetMapping({"/about"})
    public String toAbout(HttpServletRequest request){
        AboutVO abouts = aboutService.getAboutForShow(Constants.PORTAL_ABOUT_NUMBER);
        System.out.println(abouts.toString());
        request.setAttribute("abouts",abouts);
        return "portal/about_us";
    }

    @GetMapping({"/product"})
    public String toProduct(){
        return "portal/products";
    }

    @GetMapping({"/contact"})
    public String toContact(){
        return "portal/contact";
    }

}
