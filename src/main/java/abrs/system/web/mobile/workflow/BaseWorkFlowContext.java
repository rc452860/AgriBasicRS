package abrs.system.web.mobile.workflow;

import abrs.system.dao.Entity.RegistrationFormWorkFlow;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class BaseWorkFlowContext {

    public RegistrationFormWorkFlow getCurrent_workflow() {
        return current_workflow;
    }

    private RegistrationFormWorkFlow current_workflow;//当前工作流数据

    public String getWorkflow_queue_name() {
        return workflow_queue_name;
    }

    private String workflow_queue_name;//当前流程名称
}
