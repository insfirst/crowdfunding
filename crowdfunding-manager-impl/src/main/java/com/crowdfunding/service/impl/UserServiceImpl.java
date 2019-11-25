package com.crowdfunding.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.crowdfunding.bean.Role;
import com.crowdfunding.bean.User;
import com.crowdfunding.exception.LoginFailException;
import com.crowdfunding.dao.UserMapper;
import com.crowdfunding.service.UserService;
import com.crowdfunding.util.Const;
import com.crowdfunding.util.MD5Util;
import com.crowdfunding.util.Page;
import com.crowdfunding.vo.Data;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public User queryLogin(Map<String, Object> paramMap) {
		User user=userMapper.queryLogin(paramMap);
		if(user==null) {
			throw new LoginFailException("用户账号或密码不正确!");
		}
		return user;
	}


	@Override
	public int addUser(User user) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime=sdf.format(new Date());
		user.setUserpswd(MD5Util.digest(Const.PASSWORD));
		user.setCreatetime(createtime);
		return userMapper.insert(user);
	}


	@Override
	public Page queryPage(Map<String, Object> param) {
		Page page=new Page((Integer)param.get("pageno"),(Integer)param.get("pagesize"));
		Integer startIndex=page.getStartIndex();
		param.put("startIndex", startIndex);
		List<User> data=userMapper.queryList(param);
		page.setData(data);
		Integer totalsize=userMapper.queryCount(param);
		page.setTotalsize(totalsize);
		return page;
	}


	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}


	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(user);
	}


	@Override
	public int deleteUser(Integer id) {
		return userMapper.deleteByPrimaryKey(id);
	}


	public int deleteBatchUser(Integer[] ids) {

		return userMapper.deleteBatchUserByIds(ids);
	}


	@Override
	public int deleteBatchUserByData(Data data) {
		return userMapper.deleteByPrimaryKeyByData(data);
	}


	@Override
	public List<Role> querAllRole() {
		return userMapper.querAllRole();
	}


	@Override
	public List<Integer> queryRoleUserid(Integer id) {
		return userMapper.queryRoleUserid(id);
	}


	@Override
	public int saveUserRoleRelationship(Integer userid,Data data) {
		return userMapper.saveUserRoleRelationship(userid,data);
	}


	@Override
	public int deleteUserRoleRelationship(Integer userid,Data data) {
		return userMapper.deleteUserRoleRelationship(userid,data);
	}
}
