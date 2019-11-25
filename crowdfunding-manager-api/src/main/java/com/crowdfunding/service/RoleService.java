package com.crowdfunding.service;

import com.crowdfunding.bean.Role;
import com.crowdfunding.util.Page;
import com.crowdfunding.vo.Data;

import java.util.Map;


public interface RoleService {

    Page<Role> queryPage(Map<String,Object> map);

    int save(Role role);

    int deleteRoleById(Integer id);

    int deleteBatch(String[]ids);
    int deleteBatch(Integer[]ids);

    int saveRolePermissionRelationship(Integer roleid, Data datas);
}
