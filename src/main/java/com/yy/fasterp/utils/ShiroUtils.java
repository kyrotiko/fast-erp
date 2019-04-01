package com.yy.fasterp.utils;

import com.yy.fasterp.pojo.User;
import com.yy.fasterp.shiro.ShiroRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * @author Rio(417168602 @ qq.com)
 * @date 2018-04-28 上午10:17:26
 */
public class ShiroUtils extends SecurityUtils {

    public static Session getSession() {
        return getSubject().getSession();
    }

    public static void setSessionAttribute(Object key, Object value) {
        getSession().setAttribute(key, value);
    }

    public static Object getSessionAttribute(Object key) {
        return getSession().getAttribute(key);
    }

    public static User getUser() {
        return (User) getSubject().getPrincipal();
    }

    public static void refreshAuthorizationInfo() {
        clearCachedAuthorizationInfo();
        RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        ShiroRealm realm = (ShiroRealm) rsm.getRealms().iterator().next();
        realm.doGetAuthorizationInfo(getSubject().getPrincipals());
    }

    public static void clearCachedAuthorizationInfo() {
        RealmSecurityManager rsm = (RealmSecurityManager) SecurityUtils.getSecurityManager();
        ShiroRealm realm = (ShiroRealm) rsm.getRealms().iterator().next();
        realm.clearCachedAuthorizationInfo();
    }
}
