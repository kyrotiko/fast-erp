package com.yy.fasterp.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import com.yy.fasterp.utils.pagehelper.PagePlugin;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/22 11:00
 */
@Configuration
public class MybatisConfiguration {


    /**
     * 分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

    /**
     * 配置分页
     *
     * @return
     */
    @Bean
    public PagePlugin pageHelper() {
        PagePlugin pagePlugin = new PagePlugin();
        Properties properties = new Properties();
        properties.setProperty("dialect", "mysql");
        properties.setProperty("pageSqlId", ".*ByLimit.*");
        pagePlugin.setProperties(properties);
        return pagePlugin;
    }
}
