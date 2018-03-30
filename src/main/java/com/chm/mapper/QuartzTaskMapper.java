package com.chm.mapper;


import com.chm.domain.QuartzTask;

import java.util.List;

public interface QuartzTaskMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(QuartzTask record);

    int insertSelective(QuartzTask record);

    QuartzTask selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuartzTask record);

    int updateByPrimaryKey(QuartzTask record);

    List<QuartzTask> findAll();
}
