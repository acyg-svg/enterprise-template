package cn.cyg.enterprise.service;

import cn.cyg.enterprise.controller.vo.AnnouncementVO;
import cn.cyg.enterprise.entity.Announcement;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;

import java.util.List;

public interface AnnouncementService {

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);

    String saveAnnouncement(Announcement announcement);

    String updateAnnouncement(Announcement announcement);

    Boolean deleteBatch(Integer[] ids);

    List<AnnouncementVO> getAnnouncementsForIndex(int number);

}