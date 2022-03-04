package cn.cyg.enterprise.service;

import cn.cyg.enterprise.controller.vo.UserVO;
import cn.cyg.enterprise.entity.User;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;

import javax.servlet.http.HttpSession;

public interface UserService {
    /**
     * 后台分页
     *
     * @param pageUtil
     * @return
     */
    PageResult getUsersPage(PageQueryUtil pageUtil);

    /**
     * 用户注册
     *
     * @param loginName
     * @param password
     * @return
     */
    String register(String loginName, String password);

    /**
     * 登录
     *
     * @param loginName
     * @param passwordMD5
     * @param httpSession
     * @return
     */
    String login(String loginName, String passwordMD5, HttpSession httpSession);

    /**
     * 用户信息修改并返回最新的用户信息
     *
     * @param user
     * @return
     */
    UserVO updateUserInfo(User user, HttpSession httpSession);

    /**
     * 用户禁用与解除禁用(0-未锁定 1-已锁定)
     *
     * @param ids
     * @param lockStatus
     * @return
     */
    Boolean lockUsers(Integer[] ids, int lockStatus);
}
