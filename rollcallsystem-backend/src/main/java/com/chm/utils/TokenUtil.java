package com.chm.utils;

import org.apache.commons.codec.digest.DigestUtils;

import java.time.LocalDateTime;
import java.util.Random;

/**
 * Token工具类
 *
 * @Author: caihongming
 * @Created: 2018/4/9 9:28
 */
public class TokenUtil {

    /**
     * 加密秘钥
     */
    private static final String SECRET = "ashdjkahwkj";

    /**
     * 随机函数
     */
    private static final Random random = new Random();


    /**
     * user_token = md5 ('userId' + Random(datetime) + '加密密钥')
     *
     * @param userId 用户ID
     * @return 密文
     */
    public static String createToken(String userId) {
        random.setSeed(LocalDateTime.now().getSecond());
        //加密后的字符串
        String encodeStr = DigestUtils.md5Hex(userId + random.nextLong() + SECRET);
        return encodeStr;
    }

    /**
     * MD5验证方法
     *
     * @param userId 用户ID
     * @param md5    密文
     * @return true/false
     */
    public static boolean verify(String userId, String md5) {
        //根据传入的密钥进行验证
        if (userId.equalsIgnoreCase(md5)) {
            System.out.println("MD5验证通过");
            return true;
        }
        return false;
    }

}
