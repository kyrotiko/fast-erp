package com.yy.fasterp.shiro;

import com.alibaba.fastjson.JSON;
import com.yy.fasterp.utils.Reply;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.filter.authc.UserFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/22 11:45
 */
public class ShiroAuthFilter extends UserFilter {


    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        if (this.isLoginRequest(request, response)) {
            return true;
        } else {
            Subject subject = this.getSubject(request, response);
            if (subject.getPrincipal() == null) {
                try {
                    response.setCharacterEncoding("UTF-8");
                    PrintWriter out = null;
                    out = response.getWriter();
                    out.print(JSON.toJSONString(Reply.error("用户未登录")));
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }finally {
                    return false;
                }
            }
            return true;
        }
    }


    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        return false;
    }
}
