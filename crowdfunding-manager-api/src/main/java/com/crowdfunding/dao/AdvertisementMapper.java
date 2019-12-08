package com.crowdfunding.dao;

import com.crowdfunding.bean.Advertisement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdvertisementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Advertisement record);

    Advertisement selectByPrimaryKey(Integer id);

    List<Advertisement> selectAll();

    int updateByPrimaryKey(Advertisement record);

    List queryAdvertsByPage(Map<String,Object> map);
    int queryCount(Map<String,Object> map);
}