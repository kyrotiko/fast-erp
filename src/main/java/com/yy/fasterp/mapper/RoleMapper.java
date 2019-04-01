package com.yy.fasterp.mapper;

import java.util.List;

import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	List<Role> selectAll();

	List<Permission> selectAllPermission(Integer id);

	List<Role> getRoleListByLimit(@Param("page") PageInfo page, @Param("role") String role);

	void deleteRoleList(List<Role> roleList);

	void deleteRolePermissions(List<Integer> roleIds);

	void saveRolePermission(@Param("permissions") List<Permission> permissions, @Param("role") Role role);
	
	Role selectByRoleName(String role);

}