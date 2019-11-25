package com.crowdfunding.dao;

import com.crowdfunding.bean.Advertisement;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AdvertisementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Advertisement record);

    Advertisement selectByPrimaryKey(Integer id);

    List<Advertisement> selectAll();

    int updateByPrimaryKey(Advertisement record);
}