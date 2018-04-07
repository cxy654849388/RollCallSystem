package com.chm.thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 线程池管理器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/7 22:09
 */
public class HandlerThreadsPool {
    private static ExecutorService executorService = Executors.newCachedThreadPool();

    /*
　　　* 创建线程，对线程处理事件
    */
    public static void execute(Runnable runnable) {
        executorService.execute(runnable);
    }


    /*
　　 * 对象销毁时，销毁线程
　　 */
    public static void stop() {
        executorService.shutdown();
    }

}
