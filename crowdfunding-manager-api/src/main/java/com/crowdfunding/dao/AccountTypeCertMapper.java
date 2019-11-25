package com.crowdfunding.dao;

import com.crowdfunding.bean.AccountTypeCert;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AccountTypeCertMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AccountTypeCert record);

    AccountTypeCert selectByPrimaryKey(Integer id);

    List<AccountTypeCert> selectAll();

    int updateByPrimaryKey(AccountTypeCert record);
}