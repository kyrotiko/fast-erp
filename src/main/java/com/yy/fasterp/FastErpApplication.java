package com.yy.fasterp;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/22 10:16
 */
@MapperScan("com.yy.fasterp.mapper")
@SpringBootApplication
public class FastErpApplication {

    public static void main(String[] args) {
        SpringApplication.run(FastErpApplication.class, args);
    }
}
