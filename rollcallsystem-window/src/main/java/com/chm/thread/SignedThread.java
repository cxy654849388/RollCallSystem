package com.chm.thread;

import ch.qos.logback.core.util.TimeUtil;
import com.alibaba.druid.util.StringUtils;
import com.chm.task.JSONTask;
import com.chm.utils.HttpUtils;
import com.chm.utils.QuartzUtils;
import org.json.JSONObject;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalTime;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 21:08
 */
public class SignedThread implements Runnable {

    private static JSONObject json = new JSONObject();

    private static LocalTime aLong;

    private Map map;

    public static JSONObject getJson() {
        return json;
    }

    public static void setJson(JSONObject json) {
        SignedThread.json = json;
        if (json != null && !"{}".equals(json.toString())) {
            if (QuartzUtils.hasJobName("remove")) {
                QuartzUtils.modifyJobTime("remove", QuartzUtils.getCron(LocalTime.now().plusSeconds(10)));
            } else {
                QuartzUtils.addJob("remove", JSONTask.class, QuartzUtils.getCron(LocalTime.now().plusSeconds(10)));
            }
        }
    }

    public SignedThread(Map map) {
        this.map = map;
    }

    @Override
    public void run() {
        try {
            setJson(new JSONObject(HttpUtils.httpPost("http://127.0.0.1:8080/RollCallSystem/signed", map, null)));
        } catch (IOException e) {
            System.out.println(1);
        }
    }
}
