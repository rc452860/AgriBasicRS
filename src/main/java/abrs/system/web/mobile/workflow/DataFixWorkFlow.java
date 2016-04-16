package abrs.system.web.mobile.workflow;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class DataFixWorkFlow extends BaseWorkFlow {

    private String WorkFlowName = "数字修正";//流程操作名称

    public String getWorkFlowName() {
        return WorkFlowName;
    }

    public void Accept(BaseWorkFlowContext context) throws Exception
    {
        super.Accept(context);
        //Add Ext
    }
}
