package cn.cyg.enterprise.controller.portal;

import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.entity.About;
import cn.cyg.enterprise.service.AboutService;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.Result;
import cn.cyg.enterprise.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AboutController {

    @Resource
    private AboutService aboutService;

    @GetMapping("/aboutpage")
    public String toAboutPage(){
        return "admin/about";
    }

    @RequestMapping(value = "/about/list",method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String,Object> params){
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))){
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(aboutService.getAboutPage(pageUtil));
    }

    @GetMapping("/about/edit")
    public String edit(HttpServletRequest request){
        request.setAttribute("path","about-edit");
        return "admin/about_edit";
    }

    /**
     * 添加
     *
     */
    @RequestMapping(value = "/about/save",method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody About about){
        if (StringUtils.isEmpty(about.getAboutTitle())
                || ObjectUtils.isEmpty(about.getAboutRank())
                || StringUtils.isEmpty(about.getAboutContent())){
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = aboutService.saveAbout(about);
        System.out.println(result);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult(result);
        }
    }

    @GetMapping("/about/edit/{aboutId}")
    public String edit(HttpServletRequest request,@PathVariable("aboutId") Integer aboutId){
        request.setAttribute("path","about-edit");
        About about = aboutService.getAboutById(aboutId);
        //System.out.println(about);
        if (about == null){
            return "error/error_400";
        }
        request.setAttribute("about",about);
        return "admin/about_edit";
    }

    @RequestMapping(value = "/about/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        if (ids.length < 1){
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (aboutService.deleteBatch(ids)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult("删除失败！");
        }
    }

    @RequestMapping(value = "/about/update",method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody About about) {
        if (StringUtils.isEmpty(about.getAboutId())
                || StringUtils.isEmpty(about.getAboutTitle())
                || ObjectUtils.isEmpty(about.getAboutRank())
                || StringUtils.isEmpty(about.getAboutContent())) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = aboutService.updateAbout(about);
        System.out.println(result);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult(result);
        }
    }

}