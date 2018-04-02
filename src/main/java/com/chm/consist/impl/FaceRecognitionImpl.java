package com.chm.consist.impl;

import com.baidu.aip.face.AipFace;
import com.chm.consist.FaceRecognition;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import sun.misc.BASE64Encoder;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
    private static final double THRESHOLD = 75.;

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
        client.updateUser(userId, null, groupId, base64ToBytes((String) images.get(0)), null);
        //新增人脸图片
        for (int i = 1; i < images.size(); i++) {
            List<String> list = new ArrayList<>();
            list.add(groupId);
            client.addUser(userId, null, list, base64ToBytes((String) images.get(i)), null);
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
    public String recogntion(String image, List groups) {

        JSONObject object = client.identifyUser(groups, base64ToBytes(image), null);

        String groupid = object.getJSONArray("result").getJSONObject(0).getString("group_id");

        String uid = object.getJSONArray("result").getJSONObject(0).getString("uid");

        JSONArray scores = object.getJSONArray("result").getJSONObject(0).getJSONArray("scores");

        System.out.println(groupid);

        System.out.println(uid);

        System.out.println(scores.getDouble(0));

        if (scores.getDouble(0) > THRESHOLD) {
            return new StringBuffer().append(groupid).append("/").append(uid).toString();
        } else {
            return null;
        }

    }

    @Override
    public void save(String filePath) {
    }

    private static byte[] base64ToBytes(String base64) {
        return Base64.decodeBase64(base64);
    }

    public static void main(String[] args) throws IOException {
        FaceRecognition faceRecognition = new FaceRecognitionImpl();


        InputStream in = new FileInputStream("C:\\Users\\caihongming\\Desktop\\img\\s8\\6.jpg");
        byte[] data = new byte[in.available()];
        in.read(data);
        in.close();
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();

        List<String> groups = new ArrayList<>();
        groups.add("s1");
        groups.add("s2");
        groups.add("s3");
        groups.add("s4");

        System.out.println(faceRecognition.recogntion(encoder.encode(data), groups));
    }

}
