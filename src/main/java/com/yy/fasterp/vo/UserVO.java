package com.yy.fasterp.vo;

import com.github.kyrotiko.truke.annotation.StringMappingFormat;
import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.pojo.Role;
import lombok.Data;

import java.util.List;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/25 11:37
 */
@Data
public class UserVO {

    private Integer id;
    private String username;
    private String nickname;
    private String mobile;
    private String email;
    private List<Role> roles;
    private List<Permission> permissions;

    @StringMappingFormat(mapping = "0:禁用,1:启用")
    private String status;

}
