package abrs.system.task;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ExpireTask {
    private static Logger logger = LoggerFactory.getLogger(ExpireTask.class);

    /**
     * 定期任务处理
     */
    public void doBiz() {
        logger.info("do task");
    }
}
