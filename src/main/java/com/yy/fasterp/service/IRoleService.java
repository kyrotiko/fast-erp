package com.yy.fasterp.service;

import java.util.List;

import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.utils.pagehelper.PageInfo;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:29
 */
public interface IRoleService {

	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKey(Role record);

	List<Role> selectAll();

	List<Role> getRoleListByLimit(PageInfo page, String role);

	void deleteRoleList(List<Role> roles);
	
	Role selectByRoleName(String role);
}
