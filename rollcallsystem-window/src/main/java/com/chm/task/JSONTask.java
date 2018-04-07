package com.chm.task;

import com.chm.thread.SignedThread;
import com.chm.utils.QuartzUtils;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * @Author: Hongming Cai
 * @Created: 2018/4/7 21:48
 */
public class JSONTask implements Job {
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        SignedThread.setJson(null);
        QuartzUtils.removeJob(context.getJobDetail().getKey().getName());
    }
}
