package com.crowdfunding.dao;

import com.crowdfunding.bean.Cert;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CertMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cert record);

    Cert selectByPrimaryKey(Integer id);

    List<Cert> selectAll();

    int updateByPrimaryKey(Cert record);
}