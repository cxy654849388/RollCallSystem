package com.chm.thread;

import java.util.concurrent.*;

/**
 * 线程池管理器
 *
 * @Author: Hongming Cai
 * @Created: 2018/4/7 22:09
 */

public class HandlerThreadsPool {
    private static ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(5, 10, 200
        , TimeUnit.MILLISECONDS, new ArrayBlockingQueue<Runnable>(5));

    /**
     * 创建线程，对线程处理事件
     */
    public static void execute(Runnable runnable) {
        if (threadPoolExecutor.getPoolSize() < threadPoolExecutor.getMaximumPoolSize()) {
            threadPoolExecutor.execute(runnable);
        }
    }

    /**
     * 对象销毁时，销毁线程
     */
    public static void stop() {
        threadPoolExecutor.shutdown();
    }

}
