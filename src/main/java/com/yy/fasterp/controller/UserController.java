package com.yy.fasterp.controller;

import com.github.kyrotiko.truke.core.FormatTransfer;
import com.yy.fasterp.constant.StatusConstant;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.pojo.User;
import com.yy.fasterp.service.IUserService;
import com.yy.fasterp.utils.*;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import com.yy.fasterp.vo.UserVO;
import org.apache.ibatis.reflection.ArrayUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:14:42
 */
@RestController
@RequestMapping("/rest/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequiresPermissions("user:list")
    @RequestMapping("/info")
    public Reply getUserInfo(int id) {
        User user = userService.findUserById(id);
        if (user == null) {
            user = new User();
        }
        return Reply.ok(user);
    }

    @RequiresPermissions("user:list")
    @RequestMapping("/list")
    public PageReply getUserList(int page, int limit, String username) {
        PageInfo pageInfo = new PageInfo();
        if (page <= 0) {
            page = 1;
        }
        int currentResult = (page - 1) * limit;
        pageInfo.setCurrentResult(currentResult);
        pageInfo.setShowCount(limit);
        List<User> userList = userService.getUserListByLimit(pageInfo, username);
        return PageReply.ok(pageInfo.getTotalResult(), FormatTransfer.transferList(userList, UserVO.class));
    }

    @RequiresPermissions("user:del")
    @RequestMapping("/delete")
    public Reply deleteUser(User user) {
        return userService.deleteUser(user);
    }

    @RequiresPermissions("user:del")
    @RequestMapping("/deleteList")
    public Reply deleteUserList(Integer[] ids) {
        return userService.deleteUserList(ids);
    }

    @RequiresPermissions("user:add")
    @RequestMapping("/add")
    public Reply addUser(User frontUser, @RequestParam(value = "roleadd[0]") Integer[] roleAdd) {
        User user = userService.findUserByUserName(frontUser.getUsername());
        if (user != null) {
            return Reply.error("用户名已存在");
        }
        List<Role> roleList = new ArrayList<>();
        for (Integer roleId : roleAdd) {
            Role role = new Role();
            role.setId(roleId);
            roleList.add(role);
        }
        frontUser.setRoles(roleList);
        frontUser.setSalt(CommonUtils.randomSalt());
        String password = CommonUtils.toHex(CommonUtils.digest(CommonUtils.MD5(frontUser.getPassword()), frontUser.getSalt().getBytes()));
        frontUser.setPassword(password);
        frontUser.setStatus(StatusConstant.ENABLE);
        userService.saveUser(frontUser);
        return Reply.ok("添加成功");
    }

    @RequiresPermissions("user:update")
    @RequestMapping("/update")
    public Reply updateUserInfo(User user, @RequestParam(value = "roleadd[]", required = false) Integer[] roleAdd) {
        if (user.getId() == null) {
            return Reply.error("Id不能为空");
        }
        if (roleAdd != null) {
            List<Role> roleList = new ArrayList<>();
            for (Integer roleId : roleAdd) {
                Role role = new Role();
                role.setId(roleId);
                roleList.add(role);
            }
            user.setRoles(roleList);
        }
        User updateUser = new User();
        updateUser.setId(user.getId());
        updateUser.setUsername(user.getUsername());
        updateUser.setNickname(user.getNickname());
        updateUser.setMobile(user.getMobile());
        updateUser.setEmail(user.getEmail());
        updateUser.setStatus(user.getStatus());
        updateUser.setPassword(user.getPassword());
        updateUser.setDeleted(user.getDeleted());
        updateUser.setRoles(user.getRoles());
        return userService.updateUser(updateUser);
    }


    @RequestMapping("/changePwd")
    public Reply changePwd(String original, @RequestParam("new") String newPwd, @RequestParam("renew") String reNewPwd) {
        if (StringUtils.isEmpty(original)) {
            return Reply.error("原始密码不能为空");
        }
        if (StringUtils.isEmpty(newPwd)) {
            return Reply.error("新密码不能为空");
        }
        if (!newPwd.equals(reNewPwd)) {
            return Reply.error("两次密码不一样");
        }
        User currentUser = ShiroUtils.getUser();
        //使用前台传入密码计算真实密码
        String pwd = CommonUtils.toHex(CommonUtils.digest(original, currentUser.getSalt().getBytes()));
        //如果对不上则密码错误
        if (!pwd.equals(currentUser.getPassword())) {
            return Reply.error("原始密码不正确");
        }
        User user = new User();
        user.setId(currentUser.getId());
        user.setPassword(newPwd);
        userService.updateUser(user);
        ShiroUtils.getSubject().logout();
        return Reply.ok();
    }
}
