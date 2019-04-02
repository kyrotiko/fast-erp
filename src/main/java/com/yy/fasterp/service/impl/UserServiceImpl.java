package com.yy.fasterp.service.impl;

import com.yy.fasterp.mapper.UserMapper;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.pojo.User;
import com.yy.fasterp.service.IUserService;
import com.yy.fasterp.utils.*;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:15:54
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveUser(User user) {
        List<Role> roles = user.getRoles();
        userMapper.save(user);
        user = userMapper.findByUserName(user.getUsername());
        userMapper.saveUserRole(roles, user);
    }

    @Override
    public User findUserByUserName(String username) {
        return userMapper.findByUserName(username);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Reply updateUser(User user) {
        if (!StringUtils.isEmpty(user.getUsername())) {
            User backUser = findUserByUserName(user.getUsername());
            if (backUser != null && !backUser.getId().equals(user.getId())) {
                return Reply.error("用户名已存在");
            }
        }
        if (!StringUtils.isEmpty(user.getPassword())) {
            user.setSalt(CommonUtils.randomSalt());
            String password = CommonUtils.toHex(CommonUtils.digest(user.getPassword(), user.getSalt().getBytes()));
            user.setPassword(password);
        }
        //更新用户信息
        userMapper.update(user);
        //更新用户权限
        if (!CollectionUtils.isEmpty(user.getRoles())) {
            List<Integer> ids = new ArrayList<>();
            ids.add(user.getId());
            userMapper.deleteUserRoles(ids);
            userMapper.saveUserRole(user.getRoles(), user);
            ShiroUtils.refreshAuthorizationInfo();
        }
        return Reply.ok("修改成功");
    }

    @Override
    public List<User> getUserListByLimit(PageInfo page, String username) {
        return userMapper.getUserListByLimit(page, username);
    }

    @Override
    public Reply deleteUser(User user) {
        if (user.getId() == null) {
            return Reply.error("用户ID不能为空");
        }
        user.setDeleted(true);
        userMapper.update(user);
        return Reply.ok();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Reply deleteUserList(Integer[] ids) {
        if (!ArrayUtils.isEmpty(ids)) {
            for (int i = 0; i < ids.length; i++) {
                User user = new User();
                user.setId(ids[i]);
                user.setDeleted(true);
                userMapper.update(user);
            }
        }
        return Reply.ok();
    }

    @Override
    public User findUserById(int id) {
        return userMapper.findById(id);
    }

}
