package com.chm.mapper;

import com.chm.domain.Teach;

public interface TeachMapper {
    int deleteByPrimaryKey(Integer teachid);

    int insert(Teach record);

    int insertSelective(Teach record);

    Teach selectByPrimaryKey(Integer teachid);

    int updateByPrimaryKeySelective(Teach record);

    int updateByPrimaryKey(Teach record);
}