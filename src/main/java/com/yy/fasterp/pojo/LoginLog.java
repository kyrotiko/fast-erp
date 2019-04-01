package com.yy.fasterp.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 登录日志类
 *
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/23 9:34
 */
@Data
public class LoginLog extends BasePojo {
    private Integer id;
    private Integer userId;
    private Date loginTime;
    private String platform;
    private String ip;
}
