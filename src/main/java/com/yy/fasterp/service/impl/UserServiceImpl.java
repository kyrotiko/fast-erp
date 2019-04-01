package com.yy.fasterp.service.impl;

import com.yy.fasterp.mapper.UserMapper;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.pojo.User;
import com.yy.fasterp.service.IUserService;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import com.yy.fasterp.utils.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:15:54
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userDAO;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveUser(User user) {
        List<Role> roles = user.getRoles();
        userDAO.save(user);
        user = userDAO.findByUserName(user.getUsername());
        userDAO.saveUserRole(roles, user);
    }

    @Override
    public User findUserByUserName(String username) {
        return userDAO.findByUserName(username);
    }

    @Override
    public void updateUser(User user) {
        userDAO.update(user);
        List<Integer> ids = new ArrayList<>();
        ids.add(user.getId());
        userDAO.deleteUserRoles(ids);
        userDAO.saveUserRole(user.getRoles(), user);
    }

    @Override
    public List<User> getUserListByLimit(PageInfo page, String username) {
        return userDAO.getUserListByLimit(page, username);
    }

    @Override
    public Reply deleteUser(User user) {
        if (user.getId() == null) {
            return Reply.error("用户ID不能为空");
        }
        user.setDeleted(true);
        userDAO.update(user);
        return Reply.ok();
    }

    @Override
    public void deleteUserList(List<User> userList) {
        List<Integer> userIds = new ArrayList<>();
        for (User user : userList) {
            userIds.add(user.getId());
        }
        userDAO.deleteUserRoles(userIds);
        userDAO.deleteUserList(userList);
    }

    @Override
    public User findUserById(int id) {
        return userDAO.findById(id);
    }

}
