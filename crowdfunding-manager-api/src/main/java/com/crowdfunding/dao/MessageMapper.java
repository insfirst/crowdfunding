package com.crowdfunding.dao;

import com.crowdfunding.bean.Message;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    Message selectByPrimaryKey(Integer id);

    List<Message> selectAll();

    int updateByPrimaryKey(Message record);
}