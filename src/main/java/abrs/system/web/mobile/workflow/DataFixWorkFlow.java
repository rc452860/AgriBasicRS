package abrs.system.web.mobile.workflow;

import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.Entity.RegistrationFormWorkFlow;

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

        //当前不需要修改区域单位为上级,故退回到原区域单位
        RegistrationFormWorkFlow last =  context.getWork_flow_service().getItem(context.getCurrent_workflow().getAggregation_id(),context.getCurrent_workflow().getNo());
        RegistrationFormWorkFlow current =  context.getWork_flow_service().getItem(context.getCurrent_workflow().getAggregation_id(),context.getCurrent_workflow().getNo()+1);
        current.setRegion_id(last.getRegion_id());
        context.getWork_flow_service().updateItem(current);

        //Add Ext
    }
}
