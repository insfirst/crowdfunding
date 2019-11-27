package com.crowdfunding.intercepter;

import com.crowdfunding.bean.Permission;
import com.crowdfunding.service.PermissionService;
import com.crowdfunding.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AuthIntercepter extends HandlerInterceptorAdapter {
   @Autowired
    private PermissionService permissionService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1、查询所有许可uri
        /*List<Permission> queryAllPermission = permissionService.queryAllPermission();
        Set<String>allUris=new HashSet<>();
        for (Permission permission :
                queryAllPermission) {
            allUris.add("/"+permission.getUrl());
        }*/
        //改进效率：在服务器启动的时候将所有许可放到application域里面
        Set<String>allUris=(Set<String>)request.getSession().getServletContext().getAttribute(Const.ALL_PERMISSION_URI);
        //2、判断请求路劲是否在所有许可范围内
        String servletPath=request.getServletPath();
        if(allUris.contains(servletPath)){
            //3、判断请求路径是否在用户拥有的权限内
            Set<String>myUris=(Set<String>)request.getSession().getAttribute(Const.MY_URIS);
            if(myUris.contains(servletPath)){
                return true;
            }else{
                response.sendRedirect(request.getContextPath()+"/login.htm");
                return false;
            }
        }else{
            return true;
        }
    }
}
