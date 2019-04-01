package com.yy.fasterp.service;

import com.yy.fasterp.FastErpApplication;
import com.yy.fasterp.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/22 13:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = FastErpApplication.class)
public class UserServiceTest {

    @Autowired
    IUserService userService;

    @Test
    public void testFind() {
        String userName = "user";
        User user = userService.findUserByUserName(userName);
        System.out.println(user);
    }
}
