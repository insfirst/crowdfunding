package com.crowdfunding.dao;

import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.RolePermission;
import com.crowdfunding.vo.Data;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    List<Role> queryPage(Map<String, Object> map);

    Integer queryCount(Map<String, Object> map);

    int deleteBatch(@Param("ids")Integer[]ids);

    int deleteRolePermissionRelationship(Integer roleid);

    int insertRolePermissionRelationship(RolePermission rp);
}