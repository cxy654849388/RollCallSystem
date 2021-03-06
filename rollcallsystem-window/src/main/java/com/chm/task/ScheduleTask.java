package com.chm.task;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.utils.HttpUtils;
import com.chm.utils.QuartzUtils;
import com.chm.windows.SignedWindow;
import com.chm.windows.TableWindow;
import org.quartz.*;

import java.io.IOException;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 获取课表类
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/7 17:53
 */
public class ScheduleTask implements Job {
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        //获取任务名称
        String jobName = context.getJobDetail().getKey().getName();
        //获取参数
        JobDataMap dataMap = context.getJobDetail().getJobDataMap();
        SignedWindow window = (SignedWindow) ((Map) dataMap.get("parameterList")).get("window");
        //添加教室id
        Map map = new HashMap();
        map.put("roomid", window.getRoomid().toString());
        //发送post请求并接收返回结果
        JSONObject json = null;
        try {
            json = JSON.parseObject(HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/getSchedule", map, null));
        } catch (IOException e) {
            if (!"startTask".equals(jobName)) {
                QuartzUtils.removeJob(jobName);
            }
            return;
        }
        window.setSchid(null);
        TableWindow.clear();
        //根据返回结果设置课表id
        if (json != null && json.getInteger("resultCode").intValue() == 0) {
            window.setSchid(String.valueOf(json.getJSONObject("result").getInteger("schid")));
            //下课时间
            LocalTime localTime = LocalTime.parse(json.getJSONObject("result").getString("endtime"));
            //添加任务
            QuartzUtils.addJob(localTime.toString(), ScheduleTask.class, QuartzUtils.getCron(localTime), (Map) dataMap.get("parameterList"));
            Map m = new HashMap();
            m.put("schid", String.valueOf(json.getJSONObject("result").getInteger("schid")));
            QuartzUtils.addJob("counting", CountTask.class, QuartzUtils.getCron(localTime), m);
        }
        //移除任务
        if (!"startTask".equals(jobName)) {
            QuartzUtils.removeJob(jobName);
        }
    }
}
