package com.yy.fasterp.controller;

import com.yy.fasterp.constant.LoginLogPlatformConstant;
import com.yy.fasterp.pojo.LoginLog;
import com.yy.fasterp.pojo.Permission;
import com.yy.fasterp.pojo.User;
import com.yy.fasterp.service.ILoginLogService;
import com.yy.fasterp.service.IPermissionService;
import com.yy.fasterp.utils.Reply;
import com.yy.fasterp.utils.ShiroUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-23 下午2:14:25
 */
@RestController
@RequestMapping("/rest/auth")
public class AuthController {

    @Autowired
    private ILoginLogService loginLogService;

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping(value = "/get/menu")
    public Reply getPermission() {
        User user = ShiroUtils.getUser();
        List<Permission> permissionList = permissionService.selectMenu(user.getId());
        return Reply.ok(permissionList);
    }

    @RequestMapping(value = "/login")
    public Reply loginProcess(User user, String captcha, Model model, HttpSession session, HttpServletRequest request) {
        String sessionCaptcha = (String) session.getAttribute("captcha");
        if (sessionCaptcha == null || !sessionCaptcha.toLowerCase().equals(captcha.toLowerCase())) {
            return Reply.error("验证码错误");
        }
        if (isReLogin(user)) {
            return Reply.ok("已经登陆的用户");
        }
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword().toCharArray(),
                null);
        token.setRememberMe(true);
        try {
            //附权限
            SecurityUtils.getSubject().login(token);
            User loginUser = ShiroUtils.getUser();
            List<Permission> permissionList = permissionService.selectTreeByUserId(loginUser.getId());
            loginUser.setPermissions(permissionList);
            //登录日志
            LoginLog loginLog = new LoginLog();
            loginLog.setLoginTime(new Date());
            loginLog.setUserId(loginUser.getId());
            String ip = request.getRemoteAddr();
            loginLog.setPlatform(LoginLogPlatformConstant.PC);
            loginLog.setIp(ip);
            loginLogService.save(loginLog);
        } catch (UnknownAccountException ex) {
            return Reply.error("用户不存在");
        } catch (IncorrectCredentialsException ex) {
            return Reply.error("密码错误");
        } catch (DisabledAccountException ex) {
            return Reply.error("账户已停用");
        } catch (Exception ex) {
            ex.printStackTrace();
            return Reply.error("内部错误，请重试！");
        }
        return Reply.ok("登陆成功");
    }

    @RequestMapping("/current")
    public Reply getCurrentUserInfo() {
        User user = ShiroUtils.getUser();
        return Reply.ok(user);
    }

    private boolean isReLogin(User user) {
        Subject us = SecurityUtils.getSubject();
        if (us.isAuthenticated()) {
            // 参数未改变，无需重新登录，默认为已经登录成功
            return true;
        }
        // 需要重新登陆
        return false;
    }

}
