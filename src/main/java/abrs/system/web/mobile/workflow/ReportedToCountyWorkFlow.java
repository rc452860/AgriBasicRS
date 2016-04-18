package abrs.system.web.mobile.workflow;

import abrs.system.dao.Entity.RegistrationFormWorkFlow;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class ReportedToCountyWorkFlow extends BaseWorkFlow {

    private String WorkFlowName = "上报县级";//流程操作名称

    public String getWorkFlowName() {
        return WorkFlowName;
    }

    public void Accept(BaseWorkFlowContext context) throws Exception
    {
        super.Accept(context);

        //Add Ext
        RegistrationFormWorkFlow current =  context.getWork_flow_service().getItem(context.getCurrent_workflow().getAggregation_id(),context.getCurrent_workflow().getNo()+1);
        current.setRegion_id(context.getRegion_service().getParent(context.getCurrent_workflow().getRegion_id()).getNo());
        context.getWork_flow_service().updateItem(current);
    }
}
