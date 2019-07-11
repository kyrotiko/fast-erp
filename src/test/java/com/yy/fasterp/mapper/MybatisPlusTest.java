package com.yy.fasterp.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yy.fasterp.pojo.LoginLog;
import com.yy.fasterp.pojo.Permission;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import sun.rmi.runtime.Log;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Rio(417168602@qq.com)
 * @date 2019/4/8 16:08
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class MybatisPlusTest {


    @Autowired
    private MLoginLogMapper mLoginLogMapper;

    @Test
    public void testInsert() {
        System.out.println(("----- selectAll method test ------"));
        LoginLog loginLog = new LoginLog();
        loginLog.setIp("192.168.1.1");
        loginLog.setUserId(1);
        loginLog.setLoginTime(new Date());
        loginLog.setUpdatedTime(new Date());
        loginLog.setPlatform("PC");
        loginLog.setDeleted(false);
        loginLog.setCreatedTime(new Date());
        mLoginLogMapper.insert(loginLog);
    }

    @Test
    public void testSelect() {
        LambdaQueryWrapper<LoginLog> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(LoginLog::getUserId, 1);
        List<LoginLog> loginLogList = mLoginLogMapper.selectList(lambdaQueryWrapper);
        loginLogList.forEach(System.out::println);

    }

    @Test
    public void testSelectPage() {
        LambdaQueryWrapper<LoginLog> lambdaQueryWrapper = Wrappers.lambdaQuery();
        lambdaQueryWrapper.in(LoginLog::getUserId, 1);
        Page<LoginLog> page = new Page<>(2, 10);
        IPage<LoginLog> result = mLoginLogMapper.selectPage(page, lambdaQueryWrapper);
        result.getRecords().forEach(System.out::println);
    }
}
