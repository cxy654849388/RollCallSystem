package com.chm;

import com.chm.task.ScheduleTask;
import com.chm.utils.QuartzUtils;
import com.chm.windows.SignedWindow;
import com.chm.windows.TableWindow;
import org.bytedeco.javacv.FrameGrabber;

import java.io.IOException;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: caihongming
 * @Created: 2018/4/24
 */
public class Run {
    public static void main(String[] args) {
        SignedWindow window = SignedWindow.getInstance(9);
        TableWindow tableWindow = TableWindow.getInstance();
        window.setSchid("19");
        Map map = new HashMap();
        map.put("window", window);
        //开始任务
        QuartzUtils.startJobs();
        //添加每日0时获取课表
        QuartzUtils.addJob("startTask", ScheduleTask.class, "0 0 0 * * ? *", map);
        //立即获取课表
        QuartzUtils.addJob("now", ScheduleTask.class, QuartzUtils.getCron(LocalTime.now().plusSeconds(5)), map);
        try {
            window.init();
            window.start();
        } catch (FrameGrabber.Exception e) {
            System.exit(1);
        }
    }
}
