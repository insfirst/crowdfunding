package com.crowdfunding.dao;

import com.crowdfunding.bean.UserRole;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole record);
}