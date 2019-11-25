package com.crowdfunding.dao;

import com.crowdfunding.bean.Project;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProjectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    Project selectByPrimaryKey(Integer id);

    List<Project> selectAll();

    int updateByPrimaryKey(Project record);
}