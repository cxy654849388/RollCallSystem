package com.chm.service;

import com.chm.domain.Record;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 14:05
 */
public interface RecordService {
    Record getRecord(String stuId, Integer schId);

    void counting(Integer schId);
}
