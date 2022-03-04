package cn.cyg.enterprise.dao;

import cn.cyg.enterprise.entity.Announcement;
import cn.cyg.enterprise.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnnouncementMapper {

    List<Announcement> findAnnouncementList(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);

    int insertSelective(Announcement record);

    Announcement selectByPrimaryKey(Integer announcementId);

    int updateByPrimaryKeySelective(Announcement record);

    int deleteBatch(Integer[] ids);

    List<Announcement> findAnnouncementByNum(@Param("number") int number);

}
