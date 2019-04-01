package com.yy.fasterp.mapper;

import java.util.List;

import com.yy.fasterp.pojo.Permission;
import org.apache.ibatis.annotations.Param;

/**
 * @author Rio
 */
public interface PermissionMapper {
    /**
     * 删除
     *
     * @param id
     * @return
     */
    int deleteById(Integer id);

    int insert(Permission record);

    Permission selectById(Integer id);

    int updateById(Permission record);

    List<Permission> queryAll();

    List<Permission> selectByUserId(Integer id);

    List<Permission> selectByTypeUserId(@Param("userId") Integer userId, @Param("type") String type);

    Permission selectByContent(String content);
}