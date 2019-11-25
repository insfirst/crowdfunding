package com.crowdfunding.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.User;
import com.crowdfunding.service.UserService;
import com.crowdfunding.util.AjaxResult;
import com.crowdfunding.util.Page;
import com.crowdfunding.util.StringUtil;
import com.crowdfunding.vo.Data;
@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/toIndex")
	public String toIndex() {
		return "user/index";
	}
	@RequestMapping("/toAdd")
	public String toAdd() {
		return "user/add";
	}
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id,Map<String,User> map) {
		User user=userService.getUserById(id);
		map.put("user", user);
		return "user/update";
	}
	
	//分配角色doAssignRole
	@ResponseBody
	@RequestMapping("/doAssignRole")
	public Object doAssignRole(Integer userid,Data data) {
		
		AjaxResult result=new AjaxResult();
		
		try {
			userService.saveUserRoleRelationship(userid,data);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
			result.setMessage("分配出错！");
		}
		
		return result;
		
	}
	
	//取消角色
	@ResponseBody
	@RequestMapping("/doUnAssignRole")
	public Object doUnAssignRole(Integer userid,Data data) {
		
		AjaxResult result=new AjaxResult();
		
		try {
			userService.deleteUserRoleRelationship(userid,data);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
			result.setMessage("分配出错！");
		}
		
		return result;
		
	}
	//显示分配角色数据
	@RequestMapping("/assignRole")
	public String assignRole(Integer id,Map map) {
		List<Role>allListRole=userService.querAllRole();
		List<Integer>roleIds=userService.queryRoleUserid(id);
		List<Role>leftRoleList=new ArrayList<Role>();//未分配角色
		List<Role>rightRoleList=new ArrayList<Role>();//已分配角色
		for (Role role : allListRole) {
			if(roleIds.contains(role.getId())) {
				rightRoleList.add(role);
			}else {
				leftRoleList.add(role);
			}
		}
		map.put("leftRoleList",leftRoleList);
		map.put("rightRoleList",rightRoleList);
		return "user/assignrole";
	}
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(User user) {
		AjaxResult result=new AjaxResult();
		try {
			int count=userService.update(user);
			result.setSuccess(count==1);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
			result.setMessage("更新用户失败！");
		}
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		AjaxResult result=new AjaxResult();
		try {
			int count=userService.deleteUser(id);
			result.setSuccess(count==1);
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
			result.setMessage("删除出错！");
		}
		return result;
		
	}
	//通过json传递多个对象属性
	@ResponseBody
	@RequestMapping("/doDeleteBatch")
	public Object doDeleteBatch(Integer[]ids) {
		
		AjaxResult result=new AjaxResult();
		
		try {
			int count=userService.deleteBatchUser(ids);
			result.setSuccess(true);
//			result.setSuccess(count==data.getDatas().size());
		} catch (Exception e) {
			result.setSuccess(false);
			e.printStackTrace();
			result.setMessage("删除出错！");
		}
		
		return result;
		
	}
//	通过字符串拼接，传递多个参数
//	@ResponseBody
//	@RequestMapping("/doDeleteBatch")
//	public Object doDeleteBatch(Integer[] id) {
//		
//		AjaxResult result=new AjaxResult();
//		
//		try {
//			int count=userService.deleteBatchUser(id);
//			result.setSuccess(count==id.length);
//		} catch (Exception e) {
//			result.setSuccess(false);
//			e.printStackTrace();
//			result.setMessage("删除出错！");
//		}
//		
//		return result;
//		
//	}
//	
	@ResponseBody
	@RequestMapping("/index")
	public Object index(@RequestParam(value = "pageno",required = false,defaultValue ="1")Integer pageno,@RequestParam(value="pagesize",required = false,defaultValue="10")Integer pagesize,String queryText) {
		AjaxResult result=new AjaxResult();
		Map<String,Object> param=new HashMap<>();
		param.put("pageno", pageno);
		param.put("pagesize", pagesize);
		if(StringUtil.isNotEmpty(queryText)) {
			param.put("queryText", queryText);
		}
		try {
			Page page=userService.queryPage(param);
			result.setSuccess(true);
			result.setPage(page);
		} catch (Exception e) {
			e.printStackTrace();
			result.setSuccess(false);
			result.setMessage("查询出错！");
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/doAdd")
	public Object doAdd(User user) {
		AjaxResult result=new AjaxResult();
		try {
			int count=userService.addUser(user);
			result.setSuccess(count==1);
		} catch (Exception e) {
			e.printStackTrace();
			result.setMessage("保存用户失败！");
		}
		return result;
	}
	
//	@ResponseBody
//	@RequestMapping("/index")
//	public Object index(@RequestParam(value = "pageno",required = false,defaultValue ="1")Integer pageno,@RequestParam(value="pagesize",required = false,defaultValue="10")Integer pagesize) {
//		AjaxResult result=new AjaxResult();
//		try {
//			Page page=userService.queryPage(pageno,pagesize);
//			result.setSuccess(true);
//			result.setPage(page);
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.setSuccess(false);
//			result.setMessage("查询出错！");
//		}
//		return result;
//	}
	//同步请求
//	@RequestMapping("/index")
//	public String index(@RequestParam(value = "pageno",required = false,defaultValue ="1")Integer pageno,@RequestParam(value="pagesize",required = false,defaultValue="10")Integer pagesize,Map<String,Object>map) {
//		Page  page=userService.queryPage(pageno,pagesize);
//		map.put("page", page);
//		return "user/index";
//	}
	
}
