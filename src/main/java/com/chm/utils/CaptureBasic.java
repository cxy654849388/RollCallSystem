package com.chm.utils;


import org.bytedeco.javacpp.*;
import org.bytedeco.javacpp.opencv_core.*;
import org.bytedeco.javacpp.opencv_objdetect.*;
import org.bytedeco.javacpp.opencv_videoio.*;
import org.bytedeco.javacv.FrameGrabber;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.nio.DoubleBuffer;

import static javax.swing.UIManager.get;
import static org.bytedeco.javacpp.opencv_core.cvLoad;
import static org.bytedeco.javacpp.opencv_objdetect.CV_HAAR_DO_CANNY_PRUNING;
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

    public void paintComponent(Graphics g) {
        if (mImg != null) {
            g.drawImage(mImg, 0, 0, mImg.getWidth(), mImg.getHeight(), this);
        }
    }

    public static void main(String[] args) throws FrameGrabber.Exception {

        //FrameGrabber grabber = FrameGrabber.createDefault(0);
        try {
            // System.loadLibrary(opencv_core.NATIVE_LIBRARY_NAME);
            Mat capImg = new Mat();
            VideoCapture capture = new VideoCapture(0);
            int height = (int) capture.get(opencv_videoio.CV_CAP_PROP_FRAME_HEIGHT);
            int width = (int) capture.get(opencv_videoio.CAP_PROP_FRAME_WIDTH);
            if (height == 0 || width == 0) {
                throw new Exception("camera not found!");
            }


            JFrame frame = new JFrame("camera");
            frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
            CaptureBasic panel = new CaptureBasic();
            frame.setContentPane(panel);
            frame.setVisible(true);
            frame.setSize(width + frame.getInsets().left + frame.getInsets().right,
                    height + frame.getInsets().top + frame.getInsets().bottom);
            int n = 0;
            Mat temp = new Mat();
            while (frame.isShowing() && n < 500) {
                //capture.grab();
                //System.out.println("第"+n+"张");
                capture.read(capImg);
                opencv_imgproc.cvtColor(capImg, temp, opencv_imgproc.COLOR_RGB2GRAY);
                //Imgcodecs.imwrite("G:/opencv/lw/neg/back"+n+".png", temp);
                panel.mImg = panel.mat2BI(detectFace(capImg));
                panel.repaint();
                //n++;
                //break;
            }
            capture.release();
            frame.dispose();
        } catch (Exception e) {
            System.out.println("例外：" + e);
        } finally {
            System.out.println("--done--");
        }

    }

    /**
     * opencv实现人脸识别
     *
     * @param img
     */
    public static Mat detectFace(Mat img) throws Exception {

        System.out.println("Running DetectFace ... ");
        ClassLoader classLoader = CaptureBasic.class.getClassLoader();
        URL resource = classLoader.getResource("classifier/haarcascade_frontalface_alt2.xml");
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
