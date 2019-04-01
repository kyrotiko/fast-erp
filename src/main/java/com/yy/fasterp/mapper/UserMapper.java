package com.yy.fasterp.mapper;

import java.util.List;

import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.pojo.User;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;


/**
 * @author Rio
 */
public interface UserMapper {
    /**
     * 新增用户
     *
     * @param user
     */
    void save(User user);

    /**
     * 新增用户角色
     *
     * @param roles
     * @param user
     */
    void saveUserRole(@Param("roles") List<Role> roles, @Param("user") User user);

    /**
     * 更新用户信息
     *
     * @param user
     */
    void update(User user);

    /**
     * 删除用户
     *
     * @param user
     */
    void delete(User user);

    /**
     * 根据id查找用户
     *
     * @param id
     * @return
     */
    User findById(int id);

    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    User findByUserName(String username);

    /**
     * 查找所有用户
     *
     * @return
     */
    List<User> findAll();

    /**
     * 查找用户分页
     *
     * @param page
     * @param username
     * @return
     */
    List<User> getUserListByLimit(@Param("page") PageInfo page, @Param("username") String username);

    /**
     * 批量删除用户
     *
     * @param userList
     */
    void deleteUserList(List<User> userList);

    /**
     * 批量删除用户角色
     *
     * @param userIds
     */
    void deleteUserRoles(List<Integer> userIds);

    /**
     * 查找所有角色
     *
     * @param id
     * @return
     */
    List<Role> selectAllRoles(Integer id);
}
