package com.yy.fasterp.service.task;

import com.yy.fasterp.FastErpApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = FastErpApplication.class)
public class TaskCoolTest {

    /**
     * 测试定时器
     */
    @Test
    public void taskTest() {
        try {
            Thread.sleep(11000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
