package com.chm.mapper;

import com.chm.domain.Academy;

import java.util.List;

public interface AcademyMapper {
    int deleteByPrimaryKey(String acaid);

    int insert(Academy record);

    int insertSelective(Academy record);

    Academy selectByPrimaryKey(String acaid);

    int updateByPrimaryKeySelective(Academy record);

    int updateByPrimaryKey(Academy record);

    List getSchoolInfo();
}