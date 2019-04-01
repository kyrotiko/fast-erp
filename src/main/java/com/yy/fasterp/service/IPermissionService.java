package com.yy.fasterp.service;

import java.util.List;

import com.yy.fasterp.pojo.Permission;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:15:34
 */
public interface IPermissionService {
    /**
     * 删除
     *
     * @param id
     * @return
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入
     *
     * @param record
     * @return
     */
    int insert(Permission record);

    /**
     * 查询
     *
     * @param id
     * @return
     */
    Permission selectById(Integer id);

    /**
     * 更新
     *
     * @param record
     * @return
     */
    int updateById(Permission record);

    /**
     * 查询顶级权限
     *
     * @return
     */
    List<Permission> queryTreeAll();

    /**
     * 查询
     *
     * @param id
     * @return
     */
    List<Permission> selectByUserId(Integer id);

    /**
     * 查询树
     *
     * @param id
     * @return
     */
    List<Permission> selectTreeByUserId(Integer id);

    /**
     * 查询权限
     *
     * @param content
     * @return
     */
    Permission selectByContent(String content);


    /**
     * 查询菜单权限
     *
     * @param userId
     * @return
     */
    List<Permission> selectMenu(Integer userId);


    /**
     * 查询功能权限
     *
     * @param userId
     * @return
     */
    List<Permission> selectFunction(Integer userId);
}
