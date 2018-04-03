package com.chm.windows;

import org.bytedeco.javacpp.opencv_core;
import org.bytedeco.javacpp.opencv_imgcodecs;
import org.bytedeco.javacpp.opencv_imgproc;
import org.bytedeco.javacpp.opencv_objdetect;
import org.bytedeco.javacv.*;

import java.net.URL;

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

    public void init() throws FrameGrabber.Exception {
        String classifierName = null;
        ClassLoader classLoader = Window.class.getClassLoader();
        URL resource = classLoader.getResource("classifier/haarcascade_frontalface_alt.xml");
        classifierName = resource.getFile().substring(1);


        opencv_objdetect.CvHaarClassifierCascade classifier = new opencv_objdetect.CvHaarClassifierCascade(cvLoad(classifierName));
        if (classifier.isNull()) {
            System.err.println("Error loading classifier file \"" + classifierName + "\".");
            System.exit(1);
        }

        OpenCVFrameGrabber grabber = new OpenCVFrameGrabber(0);
        grabber.start();   //开始获取摄像头数据


        OpenCVFrameConverter.ToIplImage converter = new OpenCVFrameConverter.ToIplImage();

        IplImage grabbedImage = converter.convert(grabber.grab());
        int width = grabbedImage.width();
        int height = grabbedImage.height();
        IplImage grayImage = opencv_core.IplImage.create(width, height, IPL_DEPTH_8U, 1);

        CvMemStorage storage = opencv_core.CvMemStorage.create();


        CanvasFrame frame = new CanvasFrame("Some Title");
        while (frame.isVisible() && (grabbedImage = converter.convert(grabber.grab())) != null) {
            cvClearMemStorage(storage);
            cvCvtColor(grabbedImage, grayImage, CV_BGR2GRAY);
            opencv_core.CvSeq faces = cvHaarDetectObjects(grayImage, classifier, storage,
                    1.1, 3, CV_HAAR_FIND_BIGGEST_OBJECT | CV_HAAR_DO_ROUGH_SEARCH);
            int total = faces.total();
            for (int i = 0; i < total; i++) {
                opencv_core.CvRect r = new opencv_core.CvRect(cvGetSeqElem(faces, i));
                int x = r.x(), y = r.y(), w = r.width(), h = r.height();
                IplImage iplImage = grabbedImage.clone();
                cvRectangle(grabbedImage, cvPoint(x, y), cvPoint(x + w, y + h), CvScalar.RED, 2, CV_AA, 0);


                opencv_core.Mat mat = converter.convertToMat(converter.convert(iplImage));
                Rect rect = new Rect(r);
                mat = mat.apply(rect);
                opencv_imgcodecs.imwrite("d:\\img\\1.png", mat);
                //System.out.println(1);
                // byte[] bytes = mat.getByteBuffer().array();
            }
            //System.out.println(2);
            Frame rotatedFrame = converter.convert(grabbedImage);
            //System.out.println(3);
            frame.showImage(rotatedFrame);
        }
        frame.dispose();
        grabber.stop();
    }

    public static void main(String[] args) {
        Window window = new Window();
        try {
            window.init();
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        }
    }

}
