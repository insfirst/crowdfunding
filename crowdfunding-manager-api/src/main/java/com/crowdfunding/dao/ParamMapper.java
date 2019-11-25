package com.crowdfunding.dao;

import com.crowdfunding.bean.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ParamMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Param record);

    Param selectByPrimaryKey(Integer id);

    List<Param> selectAll();

    int updateByPrimaryKey(Param record);
}