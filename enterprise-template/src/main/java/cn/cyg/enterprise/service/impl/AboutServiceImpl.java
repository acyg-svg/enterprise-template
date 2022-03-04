package cn.cyg.enterprise.service.impl;

import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.AboutVO;
import cn.cyg.enterprise.dao.AboutMapper;
import cn.cyg.enterprise.entity.About;
import cn.cyg.enterprise.service.AboutService;
import cn.cyg.enterprise.util.BeanUtil;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class AboutServiceImpl implements AboutService {

    @Autowired
    private AboutMapper aboutMapper;

    @Override
    public PageResult getAboutPage(PageQueryUtil pageUtil) {
        List<About> abouts = aboutMapper.findAboutList(pageUtil);
        int total = aboutMapper.getTotalAbouts(pageUtil);
        PageResult pageResult = new PageResult(abouts,total,pageUtil.getLimit(),pageUtil.getPage());
        return pageResult;
    }

    @Override
    public String saveAbout(About about) {
        if (aboutMapper.insertSelective(about) > 0){
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public About getAboutById(Integer id){
        return aboutMapper.selectByPrimaryKey(id);
    }

    @Override
    public AboutVO getAboutForShow(int number) {
        AboutVO aboutVOS = new AboutVO();
        About abouts = aboutMapper.findAboutByNum(number);
            aboutVOS = (AboutVO) BeanUtil.copyProperties(abouts,aboutVOS);
        System.out.println(aboutVOS);
        return aboutVOS;
    }

    @Override
    public boolean deleteBatch(Integer[] ids) {
        if (ids.length < 1){
            return false;
        }
        return aboutMapper.deleteBatch(ids) > 0;
    }

    @Override
    public String updateAbout(About about) {
        if (aboutMapper.updateByPrimaryKeySelective(about) > 0){
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

}
