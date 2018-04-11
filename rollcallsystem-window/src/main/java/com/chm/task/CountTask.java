package com.chm.task;

import com.chm.utils.HttpUtils;
import com.chm.utils.QuartzUtils;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 清点人数定时任务
 *
 * @Author: caihongming
 * @Created: 2018/4/9 9:32
 */
public class CountTask implements Job {
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        //获取参数
        JobDataMap dataMap = context.getJobDetail().getJobDataMap();
        String schId = (String) ((Map) dataMap.get("parameterList")).get("schid");
        //添加教室id
        Map map = new HashMap();
        map.put("schid", schId);
        try {
            HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/counting", map, null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        QuartzUtils.removeJob(context.getJobDetail().getKey().getName());
    }
}
