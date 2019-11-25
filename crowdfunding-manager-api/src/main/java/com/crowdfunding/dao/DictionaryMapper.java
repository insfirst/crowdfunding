package com.crowdfunding.dao;

import com.crowdfunding.bean.Dictionary;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface DictionaryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    List<Dictionary> selectAll();

    int updateByPrimaryKey(Dictionary record);
}