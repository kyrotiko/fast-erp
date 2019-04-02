package com.yy.fasterp.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.*;

import javax.validation.constraints.NotNull;
import java.util.List;

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
