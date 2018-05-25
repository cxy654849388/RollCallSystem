package com.chm.consist.impl;

import com.baidu.aip.face.AipFace;
import com.chm.consist.FaceRecognition;
import com.google.common.collect.Maps;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Author: Hongming Cai
 * @Created: 2018/3/28 10:39
 */
@Component("faceRecognition")
public class FaceRecognitionImpl implements FaceRecognition {

    /**
     * 设置陌生人阈值
     */
    @Value("${THRESHOLD:75.}")
    private static double THRESHOLD;

    /**
     * 设置APPID/AK/SK
     */
    private static final String APP_ID = "10912328";
    private static final String API_KEY = "dyuN0Fp8csdM51Xvr9yyITwl";
    private static final String SECRET_KEY = "GOtlye9AWl1C5s2Y4oGE2R9NU4kcWOZl";
    /**
     * 初始化一个AipFace
     */
    private static AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);

    /**
     * @param images 人脸集合 (格式为：base64)
     * @param lable  人脸对应的标签
     *               lable格式:groupId/userId
     */
    @Override
    public void train(List images, String lable) {
        //获取人脸组ID
        String groupId = lable.split("/")[0];
        //获取用户ID
        String userId = lable.split("/")[1];

        //替换人脸图片
        client.updateUser((String) images.get(0), "BASE64", groupId, userId, null);
        //新增人脸所在组
        List<String> list = new ArrayList<>();
        list.add(groupId);
        //新增人脸图片
        for (int i = 1; i < images.size(); i++) {
            client.addUser((String) images.get(i), "BASE64", groupId, userId, null);
            try {
                //暂停1秒,QPS限制 (QPS：百度人脸识别api每秒允许访问量)
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * @param image  人脸数据
     * @param groups 用户组
     * @return 返回字符串格式:groupId/userId
     */
    @Override
    public synchronized String recogntion(String image, List groups) {
        HashMap<String, String> options = Maps.newHashMap();
        options.put("group_id_list", String.join(",", groups));
        JSONObject object = client.search(image, "BASE64", options);

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        if ("SUCCESS".equals(object.getString("error_msg"))) {

            String groupid = object.getJSONObject("result").
                getJSONArray("user_list").getJSONObject(0).
                getString("group_id");

            String uid = object.getJSONObject("result").
                getJSONArray("user_list").getJSONObject(0).
                getString("user_id");

            Double score = object.getJSONObject("result").
                getJSONArray("user_list").getJSONObject(0).
                getDouble("score");

            if (score > THRESHOLD) {
                return new StringBuffer().append(groupid).append("/").append(uid).toString();
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public void add(String image, String lable) {
        //获取人脸组ID
        String groupId = lable.split("/")[0];
        //获取用户ID
        String userId = lable.split("/")[1];
        //新增人脸所在组
        List<String> list = new ArrayList<>();
        list.add(groupId);
        //新增人脸图片
        client.addUser(image, "BASE64", groupId, userId, null);
    }

    @Override
    public void save(String filePath) {
    }

    @Override
    public boolean faceDetect(String image) {
        JSONObject object = client.detect(image, "BASE64", null);
        if (object.keySet().contains("result")) {
            return object.getJSONObject("result").getInt("face_num") == 1;
        }
        return false;
    }

    public static void main(String[] args) throws IOException {
        /**
         * 测试人脸识别接口示例
         */

        FaceRecognition faceRecognition = new FaceRecognitionImpl();


        InputStream in = new FileInputStream("C:\\Users\\MTC\\Desktop\\10.jpg");
        byte[] data = new byte[in.available()];
        in.read(data);
        in.close();
        // 对字节数组Base64编码
        List<String> groups = new ArrayList<>();
        groups.add("14070201");
        groups.add("14070202");
        groups.add("14070203");
        groups.add("14070204");

        System.out.println(faceRecognition.recogntion(Base64.encodeBase64String(data), groups));
    }

}
