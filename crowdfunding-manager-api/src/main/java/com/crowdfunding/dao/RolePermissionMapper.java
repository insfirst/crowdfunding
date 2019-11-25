package com.crowdfunding.dao;

import com.crowdfunding.bean.RolePermission;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RolePermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    List<RolePermission> selectAll();

    int updateByPrimaryKey(RolePermission record);
}