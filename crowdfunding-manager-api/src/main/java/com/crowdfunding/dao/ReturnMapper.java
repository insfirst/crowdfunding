package com.crowdfunding.dao;

import com.crowdfunding.bean.Return;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ReturnMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Return record);

    Return selectByPrimaryKey(Integer id);

    List<Return> selectAll();

    int updateByPrimaryKey(Return record);
}