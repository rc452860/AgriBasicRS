package abrs.system.web.mobile.workflow;

import java.util.HashMap;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class WorkFlowAggregation {

    public static HashMap<String,Queue<BaseWorkFlow>> WorkFlowQueues;

    public WorkFlowAggregation()
    {
        Init();
    }

    private void Init()
    {
        WorkFlowQueues = new HashMap<String,Queue<BaseWorkFlow>>();
        Queue<BaseWorkFlow> workFlows = new LinkedBlockingQueue<BaseWorkFlow>();
        workFlows.add(new StartWorkFlow());
        workFlows.add(new ReportedToCountyWorkFlow());
        workFlows.add(new CountyAuditingWorkFlow());
        workFlows.add(new DataFixWorkFlow());
        workFlows.add(new ReportedToCountryWorkFlow());
        workFlows.add(new EndWorkFlow());
        WorkFlowQueues.put("登记上报",workFlows);
    }

    public static BaseWorkFlow GetWorkFlow(String QueueName,String ClassName)
    {
        Queue<BaseWorkFlow> workFlowQueue =  WorkFlowQueues.get(QueueName);
        for (BaseWorkFlow x : workFlowQueue) {
            if(x.getClass().getName().equals(ClassName))
            {
                return x;
            }
        }
        return null;
    }

    public static BaseWorkFlow GetPreWorkFlow(String QueueName,String ClassName)
    {
        BaseWorkFlow pre = null;
        Queue<BaseWorkFlow> workFlowQueue =  WorkFlowQueues.get(QueueName);
        for (BaseWorkFlow x : workFlowQueue) {
            if(x.getClass().getName().equals(ClassName))
            {
                return pre;
            }
            pre = x;
        }
        return null;
    }

    public static BaseWorkFlow GetNextWorkFlow(String QueueName,String ClassName)
    {
        boolean is_need_record = false;
        Queue<BaseWorkFlow> workFlowQueue =  WorkFlowQueues.get(QueueName);
        for (BaseWorkFlow x : workFlowQueue) {
            if(is_need_record)
            {
                return x;
            }
            if(x.getClass().getName().equals(ClassName))
            {
                is_need_record = true;
            }
        }
        return null;//表示为最后一个节点了
    }
}
