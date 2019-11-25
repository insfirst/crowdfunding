package com.crowdfunding.service;

import java.util.List;

import com.crowdfunding.bean.Permission;

public interface PermissionService {

	Permission getRootPermission();

	List<Permission> getChildrenPermissionByPid(Integer id);

	List<Permission> queryAllPermission();

    int savePermission(Permission permission);

    Permission getPermissionById(Integer id);

	int updatePermission(Permission permission);

	int deletePermissionById(Integer id);

    List<Integer> queryPermissionIdsByRoleid(Integer roleid);
}
