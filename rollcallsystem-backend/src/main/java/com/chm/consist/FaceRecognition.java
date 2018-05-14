package com.chm.consist;

import java.util.List;

/**
 * 人脸识别接口
 *
 * @Author: Hongming Cai
 * @Created: 2018/3/28 10:31
 */
public interface FaceRecognition {

    /**
     * 人脸训练方法
     *
     * @param images 人脸集合
     * @param lable  人脸集合对应的标签
     */
    void train(List images, String lable);

    /**
     * 人脸识别方法
     *
     * @param image  人脸数据
     * @param groups 用户组
     * @return
     */
    String recogntion(String image, List groups);

    /**
     * 新增人脸方法
     *
     * @param image 人脸数据
     * @param lable 人脸对应的标签
     * @return
     */
    void add(String image, String lable);

    /**
     * 人脸模型存储方法
     *
     * @param filePath 模型存储路径
     */
    void save(String filePath);

    /**
     * 人脸检测
     *
     * @param image
     */
    boolean faceDetect(String image);

}
