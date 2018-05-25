package com.chm.thread;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chm.task.JSONTask;
import com.chm.utils.HttpUtils;
import com.chm.utils.QuartzUtils;
import com.chm.windows.TableWindow;

import javax.swing.text.TabableView;
import java.io.IOException;
import java.time.LocalTime;
import java.util.Map;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 21:08
 */
public class SignedThread implements Runnable {

    private static JSONObject json = new JSONObject();

    private static boolean flg = true;

    private Map map;

    public static JSONObject getJson() {
        return json;
    }

    public static boolean isFlg() {
        return flg;
    }

    public static void setFlg(boolean flg) {
        SignedThread.flg = flg;
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
    public synchronized void run() {
        try {
            JSONObject result = JSON.parseObject(HttpUtils.
                httpPost("http://127.0.0.1:8080/RollCallSystem/signed", map, null));
            setJson(result.getJSONObject("result"));
            if (SignedThread.getJson().containsKey("student")) {
                String stuId = json.getJSONObject("student").getString("stuid");
                String stuName = json.getJSONObject("student").getString("stuname");
                String sex = json.getJSONObject("student").getString("stusex");
                String signedTime = json.getJSONObject("record").getString("signedtime")
                    .substring(0, 8);
                String status = json.getJSONObject("record").getString("status");
                TableWindow.addRow(stuId, stuName, sex, signedTime, status);
            }

        } catch (IOException e) {
            System.out.println(1);
        } finally {
            SignedThread.setFlg(true);
        }
    }
}
