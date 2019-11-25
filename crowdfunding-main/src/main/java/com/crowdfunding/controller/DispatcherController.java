package com.crowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crowdfunding.bean.User;
import com.crowdfunding.service.UserService;
import com.crowdfunding.util.AjaxResult;
import com.crowdfunding.util.Const;
import com.crowdfunding.util.MD5Util;

@Controller
public class DispatcherController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();//销毁session对象
		return "redirect:index.htm";
	}
	//同步登录请求
	/**
	@RequestMapping("/doLogin")
	public String doLogin(String loginacct,String userpswd,String type,HttpSession session) {
		Map<String,Object>paramMap=new HashMap<>();
		paramMap.put("loginacct", loginacct);
		paramMap.put("userpswd", userpswd);
		paramMap.put("type", type);
		User user=userService.queryLogin(paramMap);
		session.setAttribute(Const.LOGIN_USER, user);
		return "redirect:main.htm";
	}
	 */
	@ResponseBody
	@RequestMapping("doLogin")
	public Object doLogin(String loginacct,String userpswd,String type,HttpSession session) {
		AjaxResult result=new AjaxResult();
		try {
			Map<String,Object>paramMap=new HashMap<>();
			paramMap.put("loginacct", loginacct);
			paramMap.put("userpswd", MD5Util.digest(userpswd));
			paramMap.put("type", type);
			User user=userService.queryLogin(paramMap);
			session.setAttribute(Const.LOGIN_USER, user);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage(e.getMessage());
		}
		return result;
	}
}
