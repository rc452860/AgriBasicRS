package abrs.system.web.mobile.workflow;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class EndWorkFlow extends BaseWorkFlow{

    private String WorkFlowName = "流程结束";//流程操作名称

    public String getWorkFlowName() {
        return WorkFlowName;
    }

    public void Accept(BaseWorkFlowContext context)
    {
        //Do Nothing
    }

    public void Reject(BaseWorkFlowContext context)
    {
        //Do Nothing
    }
}
