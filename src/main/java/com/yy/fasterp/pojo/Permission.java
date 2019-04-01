package com.yy.fasterp.pojo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.ToString;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午3:53:57
 */
@Data
@ToString
public class Permission extends BasePojo {
	private Integer id;

	private Integer parentid;

	private String type;

	private String content;

	private String path;

	private String ico;

	private String remark;

	private List<Permission> children;
}