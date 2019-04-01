package com.yy.fasterp.mapper;

import com.yy.fasterp.pojo.LoginLog;

public interface LoginLogMapper {
    /**
     * 查询
     * @param id
     * @return
     */
    LoginLog queryById(Integer id);

    /**
     * 插入一条记录
     * @param loginLog
     */
    void insertByLoginLog(LoginLog loginLog);
}
