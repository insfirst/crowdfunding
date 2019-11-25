package com.crowdfunding.dao;


import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.User;
import com.crowdfunding.vo.Data;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	User queryLogin(Map<String, Object> paramMap);

	List<User> queryList(Map<String, Object> param);

	Integer queryCount(Map<String, Object> param);

	int deleteByPrimaryKeyByData(Data data);

	List<Role> querAllRole();

	List<Integer> queryRoleUserid(Integer id);

	int saveUserRoleRelationship(@Param("userid") Integer userid, @Param("data") Data data);

	int deleteUserRoleRelationship(@Param("userid") Integer userid, @Param("data") Data data);

    int deleteBatchUserByIds(@Param("ids")Integer[] ids);
}