package abrs.system.web.mobile.workflow;

import abrs.system.service.RegionService;
import abrs.system.service.RegistrationFormWorkFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
@Component
public class StartWorkFlow extends BaseWorkFlow{

    private String WorkFlowName = "流程开始";//流程操作名称

    public String getWorkFlowName() {
        return WorkFlowName;
    }

    public void Accept(BaseWorkFlowContext context) throws Exception
    {
        super.Accept(context);
    }

    public void Reject(BaseWorkFlowContext context)
    {
        //Do Nothing
    }
}
