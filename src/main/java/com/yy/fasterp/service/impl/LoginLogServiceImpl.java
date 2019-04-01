package com.yy.fasterp.service.impl;

import com.yy.fasterp.pojo.LoginLog;
import com.yy.fasterp.mapper.LoginLogMapper;
import com.yy.fasterp.service.ILoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginLogServiceImpl implements ILoginLogService {

    @Autowired
    LoginLogMapper loginLogMapper;

    @Override
    public LoginLog queryById(Integer id) {
        return loginLogMapper.queryById(id);
    }

    @Override
    public void insertByLoginLog(LoginLog loginLog) {
        loginLogMapper.insertByLoginLog(loginLog);
    }
}
