package com.chm.utils;

/**
 * @Author: caihongming
 * @Created: 2018/4/12
 */
public class RoleTypeUtils {

    /**
     * 管理员
     */
    public static final String MANAGER = "MANAGER";

    /**
     * 教师
     */
    public static final String TEACHER = "TEACHER";

    /**
     * 学生
     */
    public static final String STUDENT = "STUDENT";

    /**
     *
     * @param userId
     * @return
     */
    public static String discriminant(String userId) {
        if(userId.length() == 10){
            return STUDENT;
        }else if(userId.length() == 6){
            return MANAGER;
        }else if(userId.length() == 4){
            return TEACHER;
        }
        return null;
    }

}
