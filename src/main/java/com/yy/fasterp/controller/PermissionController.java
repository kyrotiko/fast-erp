package com.yy.fasterp.controller;

import com.yy.fasterp.pojo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.fasterp.service.IPermissionService;
import com.yy.fasterp.utils.Reply;
import com.yy.fasterp.utils.ShiroUtils;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:14:29
 */
@RestController
@RequestMapping("/rest/permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/all/list")
    public Reply getPermissions(Integer id) {
        if (id != null && id != 0) {
            return Reply.ok(permissionService.selectById(id));
        }
        return Reply.ok(permissionService.queryTreeAll());
    }

    @RequestMapping("/list")
    public Reply getPermission(String content) {
        return Reply.ok(permissionService.selectByContent(content));
    }

    @RequestMapping("/update")
    public Reply update(Permission permission) {
        permissionService.updateById(permission);
        ShiroUtils.refreshAuthorizationInfo();
        return Reply.ok("修改成功");
    }

    @RequestMapping("/add")
    public Reply add(Permission permission) {
        permissionService.insert(permission);
        ShiroUtils.refreshAuthorizationInfo();
        return Reply.ok("新增成功");
    }

    @RequestMapping("/delete")
    public Reply delete(Permission permission) {
        permissionService.deleteByPrimaryKey(permission.getId());
        ShiroUtils.refreshAuthorizationInfo();
        return Reply.ok("删除成功");
    }

}
