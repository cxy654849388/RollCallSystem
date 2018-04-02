package com.chm.utils;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.Map;

/**
 * Http工具类
 */
public class HttpUtils {
    /**
     * 模拟发送get请求
     *
     * @param url
     * @param cookie
     * @return
     * @throws IOException
     */
    public static String httpGet(String url, String cookie) throws IOException {
        //获取请求连接
        Connection con = Jsoup.connect(url);
        //请求头设置，特别是cookie设置
        con.header("Accept", "text/html, application/xhtml+xml, */*");
        con.header("Content-Type", "application/x-www-form-urlencoded");
        con.header("User-Agent", "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0))");
        con.header("Cookie", cookie);
        //解析请求结果
        Document doc = con.get();
        //获取标题
        System.out.println(doc.title());
        //返回内容
        return doc.toString();
    }

    /**
     * 模拟发送get请求
     *
     * @param url
     * @param map    请求参数
     * @param cookie
     * @return
     * @throws IOException
     */
    public static String httpPost(String url, Map<String, String> map, String cookie) throws IOException {
        //获取请求连接
        Connection con = Jsoup.connect(url);
        //遍历生成参数
        if (map != null) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                //添加参数
                con.data(entry.getKey(), entry.getValue());
            }
        }
        //插入cookie（头文件形式）
        con.header("Cookie", cookie);
        Document doc = con.post();
        System.out.println(doc);
        return doc.toString();
    }
}
