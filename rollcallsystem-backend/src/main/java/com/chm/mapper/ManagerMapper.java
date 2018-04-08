package com.chm.mapper;

import com.chm.domain.Manager;

public interface ManagerMapper {
    int deleteByPrimaryKey(String account);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(String account);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}