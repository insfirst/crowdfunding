package com.crowdfunding.controller;

import com.crowdfunding.bean.Permission;
import com.crowdfunding.bean.Role;
import com.crowdfunding.service.PermissionService;
import com.crowdfunding.service.RoleService;
import com.crowdfunding.util.AjaxResult;
import com.crowdfunding.util.Page;
import com.crowdfunding.vo.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermissionService permissionService;
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "role/index";
    }

    @RequestMapping("/assignPermission")
    public String assignPermission(){
        return "role/assignPermission";
    }
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "role/add";
    }

    @ResponseBody
    @RequestMapping("/doAdd")
    public Object doAdd(Role role){
        start();
        try{
            int count = roleService.save(role);
            success(count==1);
        }catch (Exception e){
            success(false);
            message("新增角色出错");
        }

        return end();
    }

    @ResponseBody
    @RequestMapping("/doDelete")
    public Object doDelete(Integer id){
        start();
        try{
            int count = roleService.deleteRoleById(id);
            success(count==1);
        }catch (Exception e){
            success(false);
            message("删除角色出错");
        }
        return end();
    }
    @ResponseBody
    @RequestMapping("/doDeleteBatch")
    public Object doDeleteBatch(Integer[]ids){
        start();
        try{
             roleService.deleteBatch(ids);
            success(true);
        }catch (Exception e){
            success(false);
            message(e.getMessage());
            System.out.println(e.getMessage());
        }
        return end();
    }

    @ResponseBody
    @RequestMapping("/doAssignPermission")
    public Object doAssignPermission(Integer roleid, Data datas){
        start();
        try{
            int count=roleService.saveRolePermissionRelationship(roleid,datas);
            success(count==datas.getIds().size());
        }catch (Exception e){
            success(false);
            message(e.getMessage());
        }
        return end();
    }
    @ResponseBody
    @RequestMapping("/doIndex")
    public Object doIndex(@RequestParam(required = false,value = "pageno",defaultValue = "1") Integer pageno, @RequestParam(required = false,value = "pagesize",defaultValue = "4") Integer pagesize,String queryText){
        start();
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("pageno",pageno);
        map.put("pagesize",pagesize);
        map.put("name",queryText);
        try{
            Page page = roleService.queryPage(map);
            param("page",page);
            success(true);
        }catch (Exception e){
            success(false);
            message("查询出错");
        }

        return end();
    }
    @ResponseBody
    @RequestMapping("/loadDataAsync")
    public Object loadDataAsync(Integer roleid) {
            //根
            List<Permission> root=new ArrayList<Permission>();
            List<Permission>childrenPermissions=permissionService.queryAllPermission();
            //根据角色id查询分配之前所分配的许可
        List<Integer> permissionIdsForRoleid = permissionService.queryPermissionIdsByRoleid(roleid);

        //所有节点
            Map<Integer,Permission>map=new HashMap<Integer,Permission>();
            for (Permission innerChildren : childrenPermissions) {
                map.put(innerChildren.getId(),innerChildren);
                if (permissionIdsForRoleid.contains(innerChildren.getId())){
                    innerChildren.setChecked(true);
                }
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

        return root;
    }


}
