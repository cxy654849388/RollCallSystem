package com.chm.windows;

import com.chm.utils.HttpUtils;
import org.apache.commons.codec.binary.Base64;
import org.bytedeco.javacpp.*;
import org.bytedeco.javacv.*;
import org.bytedeco.javacv.Frame;
import org.json.JSONObject;
import org.springframework.core.io.ClassPathResource;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import static org.bytedeco.javacpp.helper.opencv_objdetect.cvHaarDetectObjects;
import static org.bytedeco.javacpp.opencv_core.*;
import static org.bytedeco.javacpp.opencv_imgproc.*;
import static org.bytedeco.javacpp.opencv_objdetect.CV_HAAR_DO_ROUGH_SEARCH;
import static org.bytedeco.javacpp.opencv_objdetect.CV_HAAR_FIND_BIGGEST_OBJECT;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/3 22:12
 */
public class Window {

    /**
     * 教师编号
     */
    private Integer roomid;

    /**
     * 课表编号
     */
    private String schid;

    /**
     * 人脸检测器
     */
    private opencv_objdetect.CvHaarClassifierCascade classifier;

    /**
     * post参数
     */
    private Map map;

    /**
     * 摄像头
     */
    private OpenCVFrameGrabber grabber;

    public Window() {
    }

    public Window(Integer roomid) {
        this.roomid = roomid;
    }

    public String getSchid() {
        return schid;
    }

    public void setSchid(String schid) {
        this.schid = schid;
    }

    public void init() throws FrameGrabber.Exception {
        map = new HashMap();
        ClassLoader classLoader = Window.class.getClassLoader();
        URL resource = classLoader.getResource("classifier/haarcascade_frontalface_alt.xml");
        //获取classifier路径
        String classifierName = resource.getFile().substring(1);
        //人脸检测器
        classifier = new opencv_objdetect.CvHaarClassifierCascade(cvLoad(classifierName));
        if (classifier.isNull()) {
            System.err.println("Error loading classifier file \"" + classifierName + "\".");
            System.exit(1);
        }
        grabber = new OpenCVFrameGrabber(0);
    }

    /**
     * mat转BufferedImage
     *
     * @param mat
     * @return
     */
    private BufferedImage mat2BI(Mat mat) {
        return new Java2DFrameConverter().convert(new OpenCVFrameConverter.ToMat().convert(mat));
    }

    public void start() throws FrameGrabber.Exception {
        //开始获取摄像头数据
        grabber.start();
        //窗体
        CanvasFrame frame = new CanvasFrame("Some Title", CanvasFrame.getDefaultGamma() / grabber.getGamma());
        //存储器
        CvMemStorage storage = opencv_core.CvMemStorage.create();
        // 转换器，用于Frame/Mat/IplImage相互转换
        OpenCVFrameConverter.ToIplImage converter = new OpenCVFrameConverter.ToIplImage();
        IplImage grabbedImage = converter.convert(grabber.grab());
        int width = grabbedImage.width();
        int height = grabbedImage.height();
        //用于将图像灰度检测人脸
        IplImage grayImage = opencv_core.IplImage.create(width, height, IPL_DEPTH_8U, 1);
        while (frame.isVisible() && (grabbedImage = converter.convert(grabber.grab())) != null) {
            //清空存储
            cvClearMemStorage(storage);
            //颜色转换为灰度
            cvCvtColor(grabbedImage, grayImage, CV_BGR2GRAY);
            //检测人脸
            CvSeq faces = cvHaarDetectObjects(grayImage, classifier, storage,
                    1.1, 3, CV_HAAR_FIND_BIGGEST_OBJECT | CV_HAAR_DO_ROUGH_SEARCH);
            int total = faces.total();
            Mat mat = null;
            String results = null;
            //框选检测到的人脸
            for (int i = 0; i < total; i++) {
                //获取人脸坐标
                opencv_core.CvRect r = new opencv_core.CvRect(cvGetSeqElem(faces, i));
                IplImage iplImage = grabbedImage.clone();
                mat = converter.convertToMat(converter.convert(iplImage));
                //保存图片
                Rect rect = new Rect(r);
                //mat 转 byte[]
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                try {
                    ImageIO.write(mat2BI(mat), "jpg", out);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                //byte[] 转 String
                map.put("image", Base64.encodeBase64String(out.toByteArray()));
                map.put("schid", schid);

                try {
                    results = HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/signed", map, null);
                    System.out.println(results);
                } catch (IOException e) {
                    System.out.println(1);
                    continue;
                }
                opencv_imgcodecs.imwrite("d:\\img\\1.png", mat);
                Point point2 = new Point(rect.x(), rect.y() - 10);
                Scalar scalar2 = new Scalar(0, 0, 255, 0);
                //绘制人脸
                rectangle(mat, rect, scalar2);
                //人脸对应的学号
                putText(mat, !"".equals(results) ? new JSONObject(results).getString("stuid") : "",
                        point2, opencv_imgproc.CV_FONT_VECTOR0, 1, scalar2);
            }
            if (mat == null) {
                continue;
            }
            Frame rotatedFrame = converter.convert(mat);
            frame.showImage(rotatedFrame);

        }
        frame.dispose();
        grabber.stop();
    }


    public static void main(String[] args) throws InterruptedException, IOException {
        Window window = new Window(9);
        window.setSchid("32");
        try {
            window.init();
            window.start();
        } catch (FrameGrabber.Exception e) {
            System.exit(1);
        }

    }


}
