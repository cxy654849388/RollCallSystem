package com.chm.task;

import com.chm.utils.HttpUtils;
import com.chm.utils.QuartzUtils;
import com.chm.windows.SignedWindow;
import org.json.JSONObject;
import org.quartz.*;

import java.io.IOException;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

/**
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
            json = new JSONObject(HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/getSchedule", map, null));
        } catch (IOException e) {
            if (!"startTask".equals(jobName)) {
                QuartzUtils.removeJob(jobName);
            }
            return;
        }
        //根据返回结果设置课表id
        if (json != null && json.has("schedule")) {
            window.setSchid(String.valueOf(json.getJSONObject("schedule").getInt("schid")));
            //下课时间
            LocalTime localTime = LocalTime.parse(json.getJSONObject("schedule").getString("endtime"));
            //添加任务
            QuartzUtils.addJob(localTime.toString(), ScheduleTask.class, QuartzUtils.getCron(localTime), (Map) dataMap.get("parameterList"));
            Map m = new HashMap();
            m.put("schid", String.valueOf(json.getJSONObject("schedule").getInt("schid")));
            QuartzUtils.addJob("counting", CountTask.class, QuartzUtils.getCron(localTime), m);
        }
        //移除任务
        if (!"startTask".equals(jobName)) {
            QuartzUtils.removeJob(jobName);
        }
    }
}
