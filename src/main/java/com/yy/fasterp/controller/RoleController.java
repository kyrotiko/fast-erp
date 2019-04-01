package com.yy.fasterp.controller;

import java.util.ArrayList;
import java.util.List;

import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.pojo.Role;
import com.yy.fasterp.utils.pagehelper.PageInfo;
import com.yy.fasterp.utils.PageReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yy.fasterp.service.IRoleService;
import com.yy.fasterp.utils.Reply;
import com.yy.fasterp.utils.ShiroUtils;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:14:36
 */
@RestController
@RequestMapping("/rest/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/all/list")
    public Reply getRoles(Integer id) {
        return Reply.ok(roleService.selectAll());
    }

    @RequestMapping("/list")
    public PageReply getRolesLimit(int page, int limit, String role) {
        PageInfo pageInfo = new PageInfo();
        if (page <= 0) {
            page = 1;
        }
        int currentResult = (page - 1) * limit;
        pageInfo.setCurrentResult(currentResult);
        pageInfo.setShowCount(limit);
        List<Role> roleList = roleService.getRoleListByLimit(pageInfo, role);
        return PageReply.ok(pageInfo.getTotalResult(), roleList);
    }

    @RequestMapping("/delete")
    public Reply deleteRole(Role role) {
        roleService.deleteByPrimaryKey(role.getId());
        ShiroUtils.clearCachedAuthorizationInfo();
        return Reply.ok("删除成功");
    }

    @RequestMapping("/deletelist")
    public Reply deleteRoleList(@RequestBody List<Role> roles) {
        roleService.deleteRoleList(roles);
        ShiroUtils.clearCachedAuthorizationInfo();
        return Reply.ok("删除成功");
    }

    @RequestMapping("/add")
    public Reply addRole(Role frontRole, @RequestParam(value = "permissionadd[0]") Integer[] permissionadd) {
        Role role = roleService.selectByRoleName(frontRole.getRole());
        if (role != null) {
            return Reply.error("角色名已存在");
        }
        List<Permission> permissionList = new ArrayList<>();
        for (Integer permissionId : permissionadd) {
            Permission permission = new Permission();
            permission.setId(permissionId);
            permissionList.add(permission);
        }

        frontRole.setPermissions(permissionList);
        roleService.insert(frontRole);
        return Reply.ok("添加成功");
    }


    @RequestMapping("/info")
    public Reply getRoleInfo(int id) {
        Role role = roleService.selectByPrimaryKey(id);
        if (role == null) {
            role = new Role();
        }
        return Reply.ok(role);
    }


    @RequestMapping("/update")
    public Reply updateRole(Role role, @RequestParam(value = "permissionadd[]") Integer[] permissionadd) {
        Role backRole = roleService.selectByRoleName(role.getRole());
        if (backRole != null && backRole.getId() != role.getId()) {
            return Reply.error("角色名已存在");
        }
        List<Permission> premisisonList = new ArrayList<>();
        for (Integer permissionId : permissionadd) {
            Permission premisison = new Permission();
            premisison.setId(permissionId);
            premisisonList.add(premisison);
        }
        role.setPermissions(premisisonList);

        roleService.updateByPrimaryKey(role);
        ShiroUtils.refreshAuthorizationInfo();
        return Reply.ok("修改成功");
    }


}
