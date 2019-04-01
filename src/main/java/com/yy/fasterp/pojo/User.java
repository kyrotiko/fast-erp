package com.yy.fasterp.pojo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:15:21
 */
@Data
public class User extends BasePojo {
    private Integer id;
    private String username;
    @JSONField(serialize = false)
    private String password;
    private String nickname;
    private String mobile;
    private String email;
    @JSONField(serialize = false)
    private String salt;
    private List<Role> roles;
    private List<Permission> permissions;

    private Integer status;
}
