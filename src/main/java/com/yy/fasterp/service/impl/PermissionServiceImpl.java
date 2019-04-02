package com.yy.fasterp.service.impl;

import com.yy.fasterp.constant.PermissionType;
import com.yy.fasterp.mapper.PermissionMapper;
import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.service.IPermissionService;
import com.yy.fasterp.utils.CollectionUtils;
import com.yy.fasterp.utils.PermissionTreeBuilder;
import com.yy.fasterp.utils.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:15:46
 */
@Service
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return permissionMapper.deleteById(id);
    }

    @Override
    public Reply insert(Permission record) {
        permissionMapper.insert(record);
        return Reply.ok();
    }

    @Override
    public Permission selectById(Integer id) {
        return permissionMapper.selectById(id);
    }


    @Override
    public int updateById(Permission record) {
        return permissionMapper.updateById(record);
    }

    @Override
    public List<Permission> queryTreeAll() {
        List<Permission> permissionList = permissionMapper.queryAll();
        return PermissionTreeBuilder.buildByRecursive(permissionList);
    }

    @Override
    public List<Permission> selectByUserId(Integer id) {
        return permissionMapper.selectByUserId(id);
    }

    @Override
    public List<Permission> selectTreeByUserId(Integer id) {
        List<Permission> permissionList = selectByUserId(id);
        if (CollectionUtils.isEmpty(permissionList)) {
            return permissionList;
        }
        return PermissionTreeBuilder.buildByRecursive(permissionList);
    }

    @Override
    public Permission selectByContent(String content) {
        return permissionMapper.selectByContent(content);
    }

    @Override
    public List<Permission> selectMenu(Integer userId) {
        List<Permission> permissionList = permissionMapper.selectByTypeUserId(userId, PermissionType.MENU);
        return PermissionTreeBuilder.buildByRecursive(permissionList);
    }
    @Override
    public List<Permission> selectFunction(Integer userId) {
        List<Permission> permissionList = permissionMapper.selectByTypeUserId(userId, PermissionType.FUNCTION);
        return permissionList;
    }

}
