package com.crowdfunding.intercepter;

import com.crowdfunding.bean.User;
import com.crowdfunding.util.Const;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.Set;

public class LoginIntercepter extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1、定义哪些路径不需要拦截（设置白名单）
        Set<String>uri=new HashSet<>();
        uri.add("/user/reg.do");
        uri.add("/user/reg.htm");
        uri.add("/login.htm");
        uri.add("/doLogin.do");
        uri.add("/logout.do");
        uri.add("/index.htm");
        //请求路径
        String servletPath=request.getServletPath();
        if(uri.contains(servletPath)){
            return true;
        }
        //2、判断用户是否登录，如果登录就被放行
        User user=(User)request.getSession().getAttribute(Const.LOGIN_USER);
        if(null!=user){
            return true;
        }else{
            response.sendRedirect(request.getContextPath()+"/login.htm");
            return false;
        }

    }
}
