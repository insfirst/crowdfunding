package com.crowdfunding.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 监听容器根路径  需要基于EL表达式来实现
 *
 * @author suiguozhen on 19-2-25 下午10:14
 */
public class ContextPathListener implements ServletContextListener {
    private static final String APP_PATH = "APP_PATH";

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        servletContext.setAttribute(APP_PATH, servletContext.getContextPath());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
