package com.crowdfunding.dao;

import com.crowdfunding.bean.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tag record);

    Tag selectByPrimaryKey(Integer id);

    List<Tag> selectAll();

    int updateByPrimaryKey(Tag record);
}