package com.chm.service.impl;

import com.chm.consist.RedisRepository;
import com.chm.mapper.ManagerMapper;
import com.chm.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: caihongming
 * @Created: 2018/4/12
 */
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    ManagerMapper managerMapper;

    @Autowired
    RedisRepository redisRepository;

    @Override
    public String login(String account, String password) {
        if (managerMapper.getPasswordByAccount(account).equals(password)) {
            return redisRepository.add(account);
        }
        return null;
    }
}
