package cn.cyg.enterprise.service;

import cn.cyg.enterprise.controller.vo.AboutVO;
import cn.cyg.enterprise.entity.About;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;

import java.util.List;

public interface AboutService {

    PageResult getAboutPage(PageQueryUtil pageUtil);

    /**
     * 添加介绍
     *
     * @param about
     * @return
     */
    String saveAbout(About about);

    /**
     * 获取介绍详情
     *
     * @param id
     * @return
     */
    About getAboutById(Integer id);

    AboutVO getAboutForShow(int number);

    boolean deleteBatch(Integer[] ids);

    String updateAbout(About about);
}
