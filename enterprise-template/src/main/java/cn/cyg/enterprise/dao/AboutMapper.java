package cn.cyg.enterprise.dao;

import cn.cyg.enterprise.entity.About;
import cn.cyg.enterprise.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AboutMapper {

    List<About> findAboutList(PageQueryUtil pageUtil);

    int getTotalAbouts(PageQueryUtil pageUtil);

    int insertSelective(About record);

    About selectByPrimaryKey(Integer aboutId);

    About findAboutByNum(@Param("number") int number);

    int deleteBatch(Integer[] ids);

    int updateByPrimaryKeySelective(About record);
}
