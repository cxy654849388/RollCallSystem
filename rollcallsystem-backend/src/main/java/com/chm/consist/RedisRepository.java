package com.chm.consist;

/**
 * @Author: caihongming
 * @Created: 2018/4/10
 */
public interface RedisRepository {

    String add(String userId);

    void update(String userId);

    String get(String userId);

    void delete(String userId);
}
