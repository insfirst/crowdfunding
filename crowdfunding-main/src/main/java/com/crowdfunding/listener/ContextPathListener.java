package com.crowdfunding.listener;

import com.crowdfunding.bean.Permission;
import com.crowdfunding.service.PermissionService;
import com.crowdfunding.util.Const;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 监听容器根路径  需要基于EL表达式来实现
 *
 * @author suiguozhen on 19-2-25 下午10:14
 */
public class ContextPathListener implements ServletContextListener {
    private static final String APP_PATH = "APP_PATH";


    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //1、讲项目上下文路径(request.getContextPath())放置到application域中
        ServletContext application = servletContextEvent.getServletContext();
        application.setAttribute(APP_PATH, application.getContextPath());
        //2、加载所有许可路径
        ApplicationContext ioc= WebApplicationContextUtils.getWebApplicationContext(application);
        PermissionService permissionService=ioc.getBean(PermissionService.class);
        List<Permission> queryAllPermission = permissionService.queryAllPermission();
        Set<String> allUris=new HashSet<>();
        for (Permission permission :
                queryAllPermission) {
            allUris.add("/"+permission.getUrl());
        }
        application.setAttribute(Const.ALL_PERMISSION_URI,allUris);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
