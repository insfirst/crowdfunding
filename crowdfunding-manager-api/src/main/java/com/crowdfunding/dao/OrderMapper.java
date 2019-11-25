package com.crowdfunding.dao;

import com.crowdfunding.bean.Order;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    Order selectByPrimaryKey(Integer id);

    List<Order> selectAll();

    int updateByPrimaryKey(Order record);
}