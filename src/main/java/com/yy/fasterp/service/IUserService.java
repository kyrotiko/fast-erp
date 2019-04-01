package com.yy.fasterp.service;

import java.util.List;

import com.yy.fasterp.pojo.User;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import com.yy.fasterp.utils.Reply;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:38
 */
public interface IUserService {
	void saveUser(User user);
	void updateUser(User user);
	User findUserById(int id);
	User findUserByUserName(String username);
	List<User> getUserListByLimit(PageInfo page, String username);
	Reply deleteUser(User user);
	void deleteUserList(List<User> userList);
}
