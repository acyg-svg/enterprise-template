package cn.cyg.enterprise.controller.admin;

import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.entity.Announcement;
import cn.cyg.enterprise.service.AnnouncementService;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.Result;
import cn.cyg.enterprise.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AnnouncementController {

    @Resource
    private AnnouncementService announcementService;

    @GetMapping("/announcement")
    public String AnnouncementPage(HttpServletRequest request){
        request.setAttribute("path","announcement");
        return "admin/announcement";
    }

    @RequestMapping(value = "/announcement/list",method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String,Object> params){
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))){
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(announcementService.getAnnouncementPage(pageUtil));
    }

    @RequestMapping(value = "/announcement/save",method = RequestMethod.POST)
    @ResponseBody
    public Result save(@RequestBody Announcement announcement){
        if (StringUtils.isEmpty(announcement.getContent())){
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = announcementService.saveAnnouncement(announcement);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult(result);
        }
    }

    @RequestMapping(value = "/announcement/update",method = RequestMethod.POST)
    @ResponseBody
    public Result update(@RequestBody Announcement announcement){
        if (StringUtils.isEmpty(announcement.getAnnouncementId())
                  || StringUtils.isEmpty(announcement.getContent())){
            return ResultGenerator.genFailResult("参数异常！");
        }
        String result = announcementService.updateAnnouncement(announcement);
        if (ServiceResultEnum.SUCCESS.getResult().equals(result)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult(result);
        }
    }

    @RequestMapping(value = "/announcement/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result delete(@RequestBody Integer[] ids){
        if (ids.length < 1){
            return ResultGenerator.genFailResult("参数异常！");
        }
        if (announcementService.deleteBatch(ids)){
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult("删除失败");
        }
    }

}