package com.yy.fasterp.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 基础pojo类
 *
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/23 9:34
 */
@Data
public class BasePojo implements Serializable {
    /**
     * 创建时间
     */
    private Date createdTime = new Date();
    /**
     * 更新时间
     */
    private Date updatedTime = new Date();

    /**
     * 是否已经删除
     */
    private Boolean deleted = false;


}
