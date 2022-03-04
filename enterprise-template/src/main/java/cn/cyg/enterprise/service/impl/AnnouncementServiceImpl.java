package cn.cyg.enterprise.service.impl;

import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.AnnouncementVO;
import cn.cyg.enterprise.dao.AnnouncementMapper;
import cn.cyg.enterprise.entity.Announcement;
import cn.cyg.enterprise.service.AnnouncementService;
import cn.cyg.enterprise.util.BeanUtil;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementMapper announcementMapper;

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<Announcement> announcements = announcementMapper.findAnnouncementList(pageUtil);
        int total = announcementMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(announcements,total,pageUtil.getLimit(),pageUtil.getPage());
        return pageResult;
    }

    @Override
    public String saveAnnouncement(Announcement announcement){
     if (announcementMapper.insertSelective(announcement) > 0){
         return ServiceResultEnum.SUCCESS.getResult();
     }
     return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String updateAnnouncement(Announcement announcement){
        if (announcementMapper.selectByPrimaryKey(announcement.getAnnouncementId()) == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        if (announcementMapper.updateByPrimaryKeySelective(announcement) > 0){
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public Boolean deleteBatch(Integer[] ids){
        if (ids.length < 1){
            return false;
        }
        //删除数据
        return announcementMapper.deleteBatch(ids) > 0;

    }

    @Override
    public List<AnnouncementVO> getAnnouncementsForIndex(int number){
        List<AnnouncementVO> announcementVOS = new ArrayList<>(number);
        List<Announcement> announcements = announcementMapper.findAnnouncementByNum(number);
        if (!CollectionUtils.isEmpty(announcements)){
            announcementVOS = BeanUtil.copyList(announcements,AnnouncementVO.class);
        }
        return announcementVOS;
    }
}