package com.crowdfunding.dao;

import com.crowdfunding.bean.ProjectTag;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ProjectTagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectTag record);

    ProjectTag selectByPrimaryKey(Integer id);

    List<ProjectTag> selectAll();

    int updateByPrimaryKey(ProjectTag record);
}