package com.crowdfunding.dao;

import com.crowdfunding.bean.ProjectType;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProjectTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectType record);

    ProjectType selectByPrimaryKey(Integer id);

    List<ProjectType> selectAll();

    int updateByPrimaryKey(ProjectType record);
}