package abrs.system.web.mobile.workflow;

import abrs.system.dao.Entity.RegistrationFormWorkFlow;
import abrs.system.dao.Entity.User;
import abrs.system.service.RegionService;
import abrs.system.service.RegistrationFormService;
import abrs.system.service.RegistrationFormWorkFlowService;

/**
 * Created by Edifi_000 on 2016-04-17.
 */
public class BaseWorkFlowContext {

    public RegistrationFormWorkFlow getCurrent_workflow() {
        return current_workflow;
    }

    public void setCurrent_workflow(RegistrationFormWorkFlow current_workflow) {
        this.current_workflow = current_workflow;
    }

    private RegistrationFormWorkFlow current_workflow;//当前工作流数据

    public String getWorkflow_queue_name() {
        return workflow_queue_name;
    }

    public void setWorkflow_queue_name(String workflow_queue_name) {
        this.workflow_queue_name = workflow_queue_name;
    }

    private String workflow_queue_name;//当前流程名称


    public RegistrationFormWorkFlowService getWork_flow_service() {
        return work_flow_service;
    }

    public void setWork_flow_service(RegistrationFormWorkFlowService work_flow_service) {
        this.work_flow_service = work_flow_service;
    }

    public RegionService getRegion_service() {
        return region_service;
    }

    public void setRegion_service(RegionService region_service) {
        this.region_service = region_service;
    }

    public RegistrationFormService getRegistration_form_service() {
        return registration_form_service;
    }

    public void setRegistration_form_service(RegistrationFormService registration_form_service) {
        this.registration_form_service = registration_form_service;
    }

    public User getCurrntUser() {
        return currntUser;
    }

    public void setCurrntUser(User currntUser) {
        this.currntUser = currntUser;
    }

    RegistrationFormWorkFlowService work_flow_service;

    RegionService region_service;
    
    RegistrationFormService registration_form_service;

    User currntUser;
}
