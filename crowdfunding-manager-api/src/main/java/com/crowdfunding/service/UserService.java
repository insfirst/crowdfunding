package com.crowdfunding.service;

import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.User;
import com.crowdfunding.util.Page;
import com.crowdfunding.vo.Data;

import java.util.List;
import java.util.Map;

public interface UserService {

	User queryLogin(Map<String, Object> paramMap);
	
	
	int addUser(User user);

	Page queryPage(Map<String, Object> param);


	User getUserById(Integer id);


	int update(User user);


	int deleteUser(Integer id);


	int deleteBatchUser(Integer[] ids);


	int deleteBatchUserByData(Data data);


	List<Role> querAllRole();


	List<Integer> queryRoleUserid(Integer id);


	int saveUserRoleRelationship(Integer userid, Data data);


	int deleteUserRoleRelationship(Integer userid, Data data);
	
}
