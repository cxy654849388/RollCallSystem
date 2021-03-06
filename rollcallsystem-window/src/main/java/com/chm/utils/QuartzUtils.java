package com.chm.utils;


import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.SimpleTimeZone;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;


public class QuartzUtils {
    /**
     * 创建一个SchedulerFactory工厂实例
     */
    private static SchedulerFactory gSchedulerFactory = new StdSchedulerFactory();
    /**
     * 任务组
     */
    private static String JOB_GROUP_NAME = "FH_JOBGROUP_NAME";
    /**
     * 触发器组
     */
    private static String TRIGGER_GROUP_NAME = "FH_TRIGGERGROUP_NAME";

    public static void addJob(String jobName, Class<? extends Job> cls, String time) {
        try {
            addJob(jobName, JOB_GROUP_NAME, jobName, TRIGGER_GROUP_NAME, cls, time, null);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加一个定时任务，使用默认的任务组名，触发器名，触发器组名  （带参数）
     *
     * @param jobName 任务名
     * @param cls     任务
     * @param time    时间设置，参考quartz说明文档
     */
    public static void addJob(String jobName, Class<? extends Job> cls, String time, Map<String, Object> parameter) {
        try {
            addJob(jobName, JOB_GROUP_NAME, jobName, TRIGGER_GROUP_NAME, cls, time, parameter);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加一个定时任务
     *
     * @param jobName          任务名
     * @param jobGroupName     任务组名
     * @param triggerName      触发器名
     * @param triggerGroupName 触发器组名
     * @param jobClass         任务
     * @param time             时间设置，参考quartz说明文档
     */
    public static void addJob(String jobName, String jobGroupName,
                              String triggerName, String triggerGroupName, Class<? extends Job> jobClass,
                              String time) {
        try {
            addJob(jobName, jobGroupName, triggerName, triggerGroupName, jobClass, time, null);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 添加一个定时任务  （带参数）
     *
     * @param jobName          任务名
     * @param jobGroupName     任务组名
     * @param triggerName      触发器名
     * @param triggerGroupName 触发器组名
     * @param jobClass         任务
     * @param time             时间设置，参考quartz说明文档
     */
    public static void addJob(String jobName, String jobGroupName,
                              String triggerName, String triggerGroupName, Class<? extends Job> jobClass,
                              String time, Map<String, Object> parameter) {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            // 任务名，任务组，任务执行类
            JobDetail jobDetail = JobBuilder.newJob(jobClass).withIdentity(jobName, jobGroupName).build();
            if (parameter != null) {
                //传参数
                jobDetail.getJobDataMap().put("parameterList", parameter);
            }
            // 触发器
            CronTrigger trigger = TriggerBuilder
                .newTrigger()
                .withIdentity(triggerName, triggerGroupName)
                .withSchedule(CronScheduleBuilder.cronSchedule(time))
                .build();
            sched.scheduleJob(jobDetail, trigger);
            if (!sched.isShutdown()) {
                // 启动
                sched.start();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改一个任务的触发时间(使用默认的任务组名，触发器名，触发器组名)
     *
     * @param jobName 任务名
     * @param time    新的时间设置
     */
    public static void modifyJobTime(String jobName, String time) {
        try {
            //通过SchedulerFactory构建Scheduler对象
            Scheduler sched = gSchedulerFactory.getScheduler();
            //通过触发器名和组名获取TriggerKey
            TriggerKey triggerKey = TriggerKey.triggerKey(jobName, TRIGGER_GROUP_NAME);
            //通过TriggerKey获取CronTrigger
            CronTrigger trigger = (CronTrigger) sched.getTrigger(triggerKey);
            if (trigger == null) {
                return;
            }
            String oldTime = trigger.getCronExpression();
            if (!oldTime.equalsIgnoreCase(time)) {
                //通过任务名和组名获取JobKey
                JobKey jobKey = JobKey.jobKey(jobName, JOB_GROUP_NAME);
                JobDetail jobDetail = sched.getJobDetail(jobKey);
                Class<? extends Job> objJobClass = jobDetail.getJobClass();
                removeJob(jobName);
                addJob(jobName, objJobClass, time);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 修改一个任务的触发时间
     *
     * @param triggerName      任务名称
     * @param triggerGroupName 传过来的任务名称
     * @param time             更新后的时间规则
     */
    public static void modifyJobTime(String triggerName, String triggerGroupName, String time) {
        try {
            //通过SchedulerFactory构建Scheduler对象
            Scheduler sched = gSchedulerFactory.getScheduler();
            //通过触发器名和组名获取TriggerKey
            TriggerKey triggerKey = TriggerKey.triggerKey(triggerName, triggerGroupName);
            //通过TriggerKey获取CronTrigger
            CronTrigger trigger = (CronTrigger) sched.getTrigger(triggerKey);
            if (trigger == null) {
                return;
            }
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(trigger.getCronExpression());
            String oldTime = trigger.getCronExpression();
            if (!oldTime.equalsIgnoreCase(time)) {
                //重新构建trigger
                trigger = trigger.getTriggerBuilder()
                    .withIdentity(triggerKey)
                    .withSchedule(scheduleBuilder)
                    .withSchedule(CronScheduleBuilder.cronSchedule(time))
                    .build();
                //按新的trigger重新设置job执行
                sched.rescheduleJob(triggerKey, trigger);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 移除一个任务(使用默认的任务组名，触发器名，触发器组名)
     *
     * @param jobName 任务名称
     */
    public static void removeJob(String jobName) {
        try {
            removeJob(jobName, JOB_GROUP_NAME, jobName, TRIGGER_GROUP_NAME);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 移除一个任务
     *
     * @param jobName          任务名
     * @param jobGroupName     任务组名
     * @param triggerName      触发器名
     * @param triggerGroupName 触发器组名
     */
    public static void removeJob(String jobName, String jobGroupName, String triggerName, String triggerGroupName) {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            //通过触发器名和组名获取TriggerKey
            TriggerKey triggerKey = TriggerKey.triggerKey(triggerName, triggerGroupName);
            //通过任务名和组名获取JobKey
            JobKey jobKey = JobKey.jobKey(jobName, jobGroupName);
            // 停止触发器
            sched.pauseTrigger(triggerKey);
            // 移除触发器
            sched.unscheduleJob(triggerKey);
            // 删除任务
            sched.deleteJob(jobKey);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 启动所有定时任务
     */
    public static void startJobs() {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            sched.start();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 关闭所有定时任务
     */
    public static void shutdownJobs() {
        try {
            Scheduler sched = gSchedulerFactory.getScheduler();
            if (!sched.isShutdown()) {
                sched.shutdown();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean hasJobName(String jobName) {
        TriggerKey triggerKey = TriggerKey.triggerKey(jobName, TRIGGER_GROUP_NAME);
        CronTrigger trigger = null;
        try {
            trigger = (CronTrigger) gSchedulerFactory.getScheduler().getTrigger(triggerKey);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
        return trigger != null;
    }

    public static String getCron(LocalTime time) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("ss mm HH * * ? *");
        return formatter.format(time);
    }
}
