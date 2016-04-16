package abrs.system.web.mobile.workflow;

import abrs.system.dao.Entity.RegistrationFormWorkFlow;
import abrs.system.service.RegistrationFormWorkFlowService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class BaseWorkFlow {

    @Autowired
    RegistrationFormWorkFlowService service;

    public String getWorkFlowName() {
        return WorkFlowName;
    }

    private String WorkFlowName = "基础流程";//流程操作名称

    public void Accept(BaseWorkFlowContext context) throws Exception
    {
        //Check RegistrationFormWorkFlow
        RegistrationFormWorkFlow current = context.getCurrent_workflow();
        if(service.checkNextExist(current.getAggregation_id(),current.getNo()+1))
        {
            throw new Exception("流程已被处理,无需重复处理");
        }

        //When No nextWorkFlow Step Can Not Accept
        BaseWorkFlow nextWorkFlow = WorkFlowAggregation.GetNextWorkFlow(context.getWorkflow_queue_name(), current.getClass_name());
        if(nextWorkFlow == null)
        {
            throw new Exception("当前流程已经完成");
        }

        //Update RegistrationFormWorkFlow Statue Accept
        current.setResult(1);
        service.updateItem(current);

        //Add RegistrationFormWorkFlow To Next Region
        RegistrationFormWorkFlow next = new RegistrationFormWorkFlow();
        next.setResult(0);
        next.setClass_name(nextWorkFlow.getClass().getName());
        next.setNo(current.getNo() + 1);//序号+1
        next.setRegion_id("");//获取上一级区域 --待完成
        service.addItem(next);//上报上级单位
    }

    public void Reject(BaseWorkFlowContext context) throws Exception
    {
        //Check RegistrationFormWorkFlow
        RegistrationFormWorkFlow current = context.getCurrent_workflow();
        if(service.checkNextExist(current.getAggregation_id(),current.getNo()+1))
        {
            throw new Exception("流程已被处理,无需重复处理");
        }

        //When No Pre Step Can Not Reject
        BaseWorkFlow preWorkFlow = WorkFlowAggregation.GetPreWorkFlow(context.getWorkflow_queue_name(), current.getClass_name());
        if(preWorkFlow == null||current.getNo()==0)
        {
            throw new Exception("当前流程无前置流程,无法拒绝");
        }

        //Update RegistrationFormWorkFlow Statue Reject
        current.setResult(-1);
        service.updateItem(current);

        //Add RegistrationFormWorkFlow Reject to Pre Region
        RegistrationFormWorkFlow next = new RegistrationFormWorkFlow();
        next.setResult(0);
        next.setClass_name(preWorkFlow.getClass().getName());
        next.setNo(current.getNo() + 1);//序号+1
        next.setRegion_id(service.getItem(current.getAggregation_id(),current.getNo()-1).getRegion_id());//获取提交单位所在区域单位
        service.addItem(next);//打回提交单位
    }
}
