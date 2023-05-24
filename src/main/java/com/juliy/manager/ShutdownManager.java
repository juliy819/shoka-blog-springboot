package com.juliy.manager;

import jakarta.annotation.PreDestroy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 关闭管理器(确保应用退出时能关闭后台线程)
 * @author juliy
 * @date 2023/5/16 17:48
 */
@Component
public class ShutdownManager {

    private static final Logger logger = LoggerFactory.getLogger(ShutdownManager.class);

    @PreDestroy
    public void destroy() {
        shutdownAsyncManager();
    }

    /**
     * 停止异步执行任务
     */
    private void shutdownAsyncManager() {
        try {
            logger.info("====关闭后台任务任务线程池====");
            AsyncManager.getInstance().shutdown();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

}