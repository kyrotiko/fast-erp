package com.yy.fasterp.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.fasterp.mapper.RoleMapper;
import com.yy.fasterp.service.IRoleService;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:50
 */
@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		List<Integer> roleIds = new ArrayList<>();
		roleIds.add(id);
		roleMapper.deleteRolePermissions(roleIds);
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Role record) {
		List<Permission> permissions = record.getPermissions();
		int result = roleMapper.insert(record);
		record = roleMapper.selectByRoleName(record.getRole());
		roleMapper.saveRolePermission(permissions, record);
		return result;
	}

	@Override
	public Role selectByPrimaryKey(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		int result = roleMapper.updateByPrimaryKey(record);
		List<Integer> ids = new ArrayList<>();
		ids.add(record.getId());
		roleMapper.deleteRolePermissions(ids);
		roleMapper.saveRolePermission(record.getPermissions(), record);
		return result;
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

	@Override
	public List<Role> getRoleListByLimit(PageInfo page, String role) {
		return roleMapper.getRoleListByLimit(page, role);
	}

	@Override
	public void deleteRoleList(List<Role> roleList) {
		List<Integer> roleIds = new ArrayList<>();
		for (Role role : roleList) {
			roleIds.add(role.getId());
		}
		roleMapper.deleteRolePermissions(roleIds);
		roleMapper.deleteRoleList(roleList);
	}

	@Override
	public Role selectByRoleName(String role) {
		return roleMapper.selectByRoleName(role);
	}

}
