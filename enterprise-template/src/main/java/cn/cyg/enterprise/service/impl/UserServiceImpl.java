package cn.cyg.enterprise.service.impl;

import cn.cyg.enterprise.common.Constants;
import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.UserVO;
import cn.cyg.enterprise.dao.UserMapper;
import cn.cyg.enterprise.entity.User;
import cn.cyg.enterprise.service.UserService;
import cn.cyg.enterprise.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageResult getUsersPage(PageQueryUtil pageUtil) {
        List<User> users = userMapper.findMallUserList(pageUtil);
        int total = userMapper.getTotalMallUsers(pageUtil);
        PageResult pageResult = new PageResult(users, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public String register(String loginName, String password) {
        if (userMapper.selectByLoginName(loginName) != null) {
            return ServiceResultEnum.SAME_LOGIN_NAME_EXIST.getResult();
        }
        User registerUser = new User();
        registerUser.setLoginName(loginName);
        registerUser.setNickName(loginName);
        String passwordMD5 = MD5Util.MD5Encode(password, "UTF-8");
        registerUser.setPasswordMd5(passwordMD5);
        if (userMapper.insertSelective(registerUser) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String login(String loginName, String passwordMD5, HttpSession httpSession) {
        User user = userMapper.selectByLoginNameAndPasswd(loginName, passwordMD5);
        if (user != null && httpSession != null) {
            if (user.getLockedFlag() == 1) {
                return ServiceResultEnum.LOGIN_USER_LOCKED.getResult();
            }
            //昵称太长 影响页面展示
            if (user.getNickName() != null && user.getNickName().length() > 7) {
                String tempNickName = user.getNickName().substring(0, 7) + "..";
                user.setNickName(tempNickName);
            }
            UserVO userVO = new UserVO();
            BeanUtil.copyProperties(user, userVO);
            //设置购物车中的数量
            httpSession.setAttribute(Constants.MALL_USER_SESSION_KEY, userVO);
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.LOGIN_ERROR.getResult();
    }

    @Override
    public UserVO updateUserInfo(User user, HttpSession httpSession) {
        UserVO userTemp = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        User userFromDB = userMapper.selectByPrimaryKey(userTemp.getUserId());
        if (userFromDB != null) {
            if (!StringUtils.isEmpty(user.getNickName())) {
                userFromDB.setNickName(UriUtils.cleanString(user.getNickName()));
            }
            if (!StringUtils.isEmpty(user.getAddress())) {
                userFromDB.setAddress(UriUtils.cleanString(user.getAddress()));
            }
            if (!StringUtils.isEmpty(user.getIntroduceSign())) {
                userFromDB.setIntroduceSign(UriUtils.cleanString(user.getIntroduceSign()));
            }
            if (userMapper.updateByPrimaryKeySelective(userFromDB) > 0) {
                UserVO userVO = new UserVO();
                userFromDB = userMapper.selectByPrimaryKey(user.getUserId());
                BeanUtil.copyProperties(userFromDB, userVO);
                httpSession.setAttribute(Constants.MALL_USER_SESSION_KEY, userVO);
                return userVO;
            }
        }
        return null;
    }

    @Override
    public Boolean lockUsers(Integer[] ids, int lockStatus) {
        if (ids.length < 1) {
            return false;
        }
        return userMapper.lockUserBatch(ids, lockStatus) > 0;
    }
}
