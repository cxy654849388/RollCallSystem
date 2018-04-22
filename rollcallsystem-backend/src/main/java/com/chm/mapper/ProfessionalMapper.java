package com.chm.mapper;

import com.chm.domain.Professional;

public interface ProfessionalMapper {
    int deleteByPrimaryKey(String proid);

    int insert(Professional record);

    int insertSelective(Professional record);

    Professional selectByPrimaryKey(String proid);

    int updateByPrimaryKeySelective(Professional record);

    int updateByPrimaryKey(Professional record);
}