package com.chm.windows;

import com.chm.utils.HttpUtils;
import org.apache.commons.codec.binary.Base64;
import org.bytedeco.javacpp.*;
import org.bytedeco.javacv.*;

import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import static org.bytedeco.javacpp.helper.opencv_objdetect.cvHaarDetectObjects;
import static org.bytedeco.javacpp.opencv_core.*;
import static org.bytedeco.javacpp.opencv_core.cvPoint;
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
    private Integer schid;

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

    public Integer getSchid() {
        return schid;
    }

    public void setSchid(Integer schid) {
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


        //关闭摄像头
        grabber.stop();


    }

    private BufferedImage mat2BI(Mat mat) {
        int dataSize = mat.cols() * mat.rows() * (int) mat.elemSize();
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
        IplImage grayImage = opencv_core.IplImage.create(width, height, grabbedImage.depth(), 1);
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
            //框选检测到的人脸
            for (int i = 0; i < total; i++) {
                //获取人脸坐标
                opencv_core.CvRect r = new opencv_core.CvRect(cvGetSeqElem(faces, i));
                //int x = r.x(), y = r.y(), w = r.width(), h = r.height();
                IplImage iplImage = grabbedImage.clone();
                mat = converter.convertToMat(converter.convert(iplImage));
                //保存图片
                Rect rect = new Rect(r);

                //map.put("image", Base64.encodeBase64String(((DataBufferByte) mat2BI(mat.apply(rect)).getData().getDataBuffer()).getData()));
                map.put("image", Base64.encodeBase64String(mat.getByteBuffer().array()));
                map.put("schid", schid);
                String results = null;
                try {
                    results = HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/signed", map, null);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                opencv_imgcodecs.imwrite("d:\\img\\1.png", mat.apply(rect));
                //cvRectangle(grabbedImage, cvPoint(x, y), cvPoint(x + w, y + h), CvScalar.RED, 2, CV_AA, 0);
                Point point2 = new Point(rect.x() + rect.width() / 2, rect.y() - 10);
                Scalar scalar2 = new Scalar(0, 0, 255, 0);
                //绘制人脸
                rectangle(mat, rect, scalar2, 2, 16, 0);
                //人脸对应的名字
                putText(mat, results.split("/")[0], point2, opencv_imgproc.CV_FONT_VECTOR0, 2.2, scalar2, 3, 0, false);
                // byte[] bytes = mat.getByteBuffer().array();
            }
            Frame rotatedFrame = converter.convert(mat);
            frame.showImage(rotatedFrame);
        }
        frame.dispose();
        grabber.stop();
    }


    public static void main(String[] args) throws InterruptedException {
        // 转换器，用于Frame/Mat/IplImage相互转换
        OpenCVFrameConverter.ToIplImage converter = new OpenCVFrameConverter.ToIplImage();
        CanvasFrame frame = new CanvasFrame("Some Title");
        // Frame rotatedFrame = new Frame(500, 500, 1, 3);

        Scalar scalar2 = new Scalar(0, 0, 255, 0);
        // 取一帧视频（图像），并转换为Mat
        File file = new File("C:\\Users\\caihongming\\Desktop\\img");
        for (File files : file.listFiles()) {
            for (File file1 : files.listFiles()) {
                Mat mat = opencv_imgcodecs.imread(file1.getAbsolutePath());
                Point point2 = new Point(mat.rows() / 2, mat.cols() / 2);
                Rect rect = new Rect(mat.cols() / 4, mat.rows() / 4, mat.cols() / 2, mat.rows() / 2);
                putText(mat, "eguid!", point2, opencv_imgproc.CV_FONT_VECTOR0, 2.2, scalar2, 3, 16, false);
                rectangle(mat, rect, scalar2, 2, 16, 0);
                //System.out.println(3);
                frame.showImage(converter.convert(mat));
                Thread.sleep(500);
            }
        }

    }


}
