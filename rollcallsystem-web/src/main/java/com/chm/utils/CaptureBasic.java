package com.chm.utils;


import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.opencv_core.*;
import org.bytedeco.javacpp.opencv_objdetect.*;
import org.bytedeco.javacv.FrameGrabber;

import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import static javax.swing.UIManager.get;
import static org.bytedeco.javacpp.opencv_core.cvLoad;
import static org.bytedeco.javacpp.opencv_objdetect.cvHaarDetectObjects;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/1 0:27
 */
public class CaptureBasic extends JPanel {

    private BufferedImage mImg;

    private BufferedImage mat2BI(Mat mat) {
        int dataSize = mat.cols() * mat.rows() * (int) mat.elemSize();
        //byte[] data = new byte[dataSize];
        //mat.get(0, 0, data);
        byte[] data = mat.getByteBuffer().array();
        int type = mat.channels() == 1 ?
                BufferedImage.TYPE_BYTE_GRAY : BufferedImage.TYPE_3BYTE_BGR;

        if (type == BufferedImage.TYPE_3BYTE_BGR) {
            for (int i = 0; i < dataSize; i += 3) {
                byte blue = data[i + 0];
                data[i + 0] = data[i + 2];
                data[i + 2] = blue;
            }
        }
        BufferedImage image = new BufferedImage(mat.cols(), mat.rows(), type);
        image.getRaster().setDataElements(0, 0, mat.cols(), mat.rows(), data);

        return image;
    }

    @Override
    public void paintComponent(Graphics g) {
        if (mImg != null) {
            g.drawImage(mImg, 0, 0, mImg.getWidth(), mImg.getHeight(), this);
        }
    }

    public static void main(String[] args) throws FrameGrabber.Exception {

        LocalTime time = LocalTime.now();
        System.out.println(time.toSecondOfDay());
        System.out.println(System.currentTimeMillis());
        String str = "1,2,3,4,5,6,7,8,9,10";
        java.util.List list1 = new ArrayList<String>();
        Set<String> stringSet = new HashSet<>();
        stringSet.addAll(Arrays.asList(str.split(",")));
        System.out.println(stringSet);
        System.out.println(stringSet.contains("12"));
    }

    /**
     * opencv实现人脸识别
     *
     * @param img
     */
    public static Mat detectFace(Mat img) throws Exception {

        System.out.println("Running DetectFace ... ");
        ClassLoader classLoader = CaptureBasic.class.getClassLoader();
        URL resource = classLoader.getResource("src/main/resources/classifier/haarcascade_frontalface_alt2.xml");
        File file = new File(resource.getFile());
        System.out.println(file.getAbsolutePath());
        // 从配置文件lbpcascade_frontalface.xml中创建一个人脸识别器，该文件位于opencv安装目录中
        CvHaarClassifierCascade faceDetector = new CvHaarClassifierCascade(cvLoad(resource.getFile()));


        // 在图片中检测人脸
        RectVector faceDetections = new RectVector();

        CvMemStorage storage = new CvMemStorage();
        IplImage grayImage;
        CvSeq faces;
        // faces = cvHaarDetectObjects(, faceDetector, storage, 1.1, 3, CV_HAAR_DO_CANNY_PRUNING);

        //faceDetector.detectMultiScale(img, faceDetections);

        //System.out.println(String.format("Detected %s faces", faceDetections.toArray().length));
        int len = (int) faceDetections.size();

        Rect[] rects = new Rect[len];

        for (len = len - 1; len >= 0; len--) {
            rects[len] = faceDetections.pop_back();
        }


        if (rects != null && rects.length >= 1) {
            for (Rect rect : rects) {
                opencv_imgproc.rectangle(img, new opencv_core.Point(rect.x(), rect.y()), new opencv_core.Point(rect.x() + rect.width(), rect.y() + rect.height()),
                        new Scalar());
            }
        }
        return img;
    }

}
