package com.crowdfunding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.crowdfunding.bean.Permission;
import com.crowdfunding.service.PermissionService;
import com.crowdfunding.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("permission")
@Controller
public class PermissionController extends BaseController {
	@Autowired
	private PermissionService permissionService;
	@RequestMapping("/index")
	public String index() {
		return "permission/index";
	}
	@RequestMapping("/toAdd")
	public String toAdd(){
		return "permission/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id,Map<String,Permission>map){
		Permission permission=permissionService.getPermissionById(id);
		map.put("permission",permission);
		return "permission/update";
	}
	@ResponseBody
	@RequestMapping("/doAdd")
	public Object doAdd(Permission permission){
		AjaxResult result=new AjaxResult();
		try{
			int count = permissionService.savePermission(permission);
			result.setSuccess(count==1);

		}catch(Exception e){
			result.setSuccess(false);
			result.setMessage("保存许可树数据出错");
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(Permission permission){
		AjaxResult result=new AjaxResult();
		try{
			int count = permissionService.updatePermission(permission);
			result.setSuccess(count==1);
		}catch(Exception e){
			result.setSuccess(false);
			result.setMessage("修改许可树数据出错");
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id){
		start();
		try{
			int count = permissionService.deletePermissionById(id);
			success(count==1);
		}catch(Exception e){
			success(false);
			message("删除许可树数据出错");
		}
		return end();
	}
//	demo1
//	@ResponseBody
//	@RequestMapping("/loadData")
//	public Object loadData() {
//		AjaxResult result=new AjaxResult();
//		try {
//			List<Permission>root=new ArrayList<>();
//			//父
//			Permission permission=new Permission();
//			permission.setName("系统权限菜单");
//			permission.setOpen(true);
//			root.add(permission);
//			//子
//			List<Permission>children=new ArrayList<>();
//			Permission p1=new Permission();
//			p1.setName("控制面板");
//			Permission p2=new Permission();
//			p2.setName("权限管理");
//			children.add(p1);
//			children.add(p2);
//			permission.setChildren(children);
//			result.setData(root);
//			result.setSuccess(true);
//		} catch (Exception e) {
//			result.setSuccess(false);
//			result.setMessage("加载许可数据失败！");
//		}
//		return result;
//	}
//	
//	demo2:通过数据库查询数据，一次请求生成许可树
//	@ResponseBody
//	@RequestMapping("/loadData")
//	public Object loadData() {
//		AjaxResult result=new AjaxResult();
//		try {
//			List<Permission>root=new ArrayList<>();
//			//父
//			Permission permission=permissionService.getRootPermission();
//			permission.setOpen(true);
//			root.add(permission);
//			//子
//			List<Permission>childrens=permissionService.getChildrenPermissionByPid(permission.getId());
//			//设置父-子关系
//			permission.setChildren(childrens);
//			for (Permission child : childrens) {
//				child.setOpen(true);
//				//孙
//				List<Permission> innerChildren=permissionService.getChildrenPermissionByPid(child.getId());
//				//设置子-孙关系
//				child.setChildren(innerChildren);
//			}
//			result.setData(root);
//			result.setSuccess(true);
//		} catch (Exception e) {
//			result.setSuccess(false);
//			result.setMessage("加载许可数据失败！");
//		}
//		return result;
//	}
//	demo3：采用递归调用查询许可树
//	@ResponseBody
//	@RequestMapping("/loadData")
//	public Object loadData() {
//		AjaxResult result=new AjaxResult();
//		try {
//			List<Permission>root=new ArrayList<>();
//			//父
//			Permission permission=permissionService.getRootPermission();
//			permission.setOpen(true);
//			root.add(permission);
//			//调用递归查询子递归方法
//			queryChildPermission(permission);
//			result.setData(root);
//			result.setSuccess(true);
//		} catch (Exception e) {
//			result.setSuccess(false);
//			result.setMessage("加载许可数据失败！");
//		}
//		return result;
//	}
//	/**
//	 * 递归使用条件：
//	 * 1、调用自身方法
//	 * 2、不断调用自身方法，操作范围一定要缩小
//	 * 3、一定要存在退出条件
//	 * @param permission
//	 */
//	private void queryChildPermission(Permission permission) {
//		List<Permission>children=permissionService.getChildrenPermissionByPid(permission.getId());
//		//组合父子关系
//		permission.setChildren(children);
//		permission.setOpen(true);
//		for (Permission innerChildren : children) {
//			queryChildPermission(innerChildren);
//		}
//	}
//	demo4:一次加载所有permission数据，减少与数据库之间的交互次数
//	@ResponseBody
//	@RequestMapping("/loadData")
//	public Object loadData() {
//		AjaxResult result=new AjaxResult();
//		try {
//			//根
//			List<Permission>root=new ArrayList<>();
//			List<Permission>childrenPermissions=permissionService.queryAllPermission();
//			for (Permission permission : childrenPermissions) {
//				Permission child=permission;//子节点
//				if(null==permission.getPid()) {
//					root.add(permission);
//				}else {
//					for (Permission innerPermission : childrenPermissions) {
//						Permission parent=innerPermission;//父节点
//						if(permission.getPid()==innerPermission.getId()) {
//							parent.getChildren().add(child);
//							break;
//						}
//					}
//				}
//			}
//			result.setData(root);
//			result.setSuccess(true);
//		} catch (Exception e) {
//			result.setSuccess(false);
//			result.setMessage("加载许可数据失败！");
//		}
//		return result;
//	}
	//demo5：避免循环次数，提升查询效率
	@ResponseBody
	@RequestMapping("/loadData")
	public Object loadData() {
		AjaxResult result=new AjaxResult();
		try {
			//根
			List<Permission>root=new ArrayList<>();
			List<Permission>childrenPermissions=permissionService.queryAllPermission();
			//所有节点
			Map<Integer,Permission>map=new HashMap<Integer,Permission>();
			for (Permission innerChildren : childrenPermissions) {
				map.put(innerChildren.getId(),innerChildren);
			}
			
			for (Permission permission : childrenPermissions) {
				Permission child=permission;//子节点
				if(null==permission.getPid()) {
					root.add(permission);
				}else {
					Permission parent=map.get(permission.getPid());//通过pid查找父节点
					parent.getChildren().add(child);//设置父子关系
				}
			}
			result.setData(root);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("加载许可数据失败！");
		}
		return result;
	}
}
 