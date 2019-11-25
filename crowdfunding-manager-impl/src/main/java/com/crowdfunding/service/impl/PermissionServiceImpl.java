package com.crowdfunding.service.impl;

import java.util.List;

import com.crowdfunding.bean.Permission;
import com.crowdfunding.dao.PermissionMapper;
import com.crowdfunding.service.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PermissionServiceImpl implements PermissionService {
	@Resource
	private PermissionMapper permissionMapper;

	@Override
	public Permission getRootPermission() {
		return permissionMapper.getRootPermission();
	}

	@Override
	public List<Permission> getChildrenPermissionByPid(Integer id) {
		return permissionMapper.getChildrenPermissionByPid(id);
	}
	@Override
	public List<Permission> queryAllPermission() {
		return permissionMapper.queryAllPermission();
	}

	@Override
	public int savePermission(Permission permission) {
		return permissionMapper.insert(permission);
	}

	@Override
	public Permission getPermissionById(Integer id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updatePermission(Permission permission) {
		return permissionMapper.updateByPrimaryKey(permission);
	}

	@Override
	public int deletePermissionById(Integer id) {
		return permissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Integer> queryPermissionIdsByRoleid(Integer roleid) {
		return permissionMapper.queryPermissionIdsByRoleid(roleid);

	}
}
