package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.Entity.RegistrationFormWorkFlow;
import abrs.system.dao.Entity.User;
import abrs.system.service.RegionService;
import abrs.system.service.RegistrationFormService;
import abrs.system.service.RegistrationFormWorkFlowService;
import abrs.system.web.context.SessionContext;
import abrs.system.web.mobile.form.RegistrationFormForm;
import abrs.system.web.mobile.workflow.BaseWorkFlow;
import abrs.system.web.mobile.workflow.BaseWorkFlowContext;
import abrs.system.web.mobile.workflow.StartWorkFlow;
import abrs.system.web.mobile.workflow.WorkFlowAggregation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
@Controller
@RequestMapping("/mobile/registrationForm")
public class RegistrationFormMobileController {
    private static Logger logger = LoggerFactory.getLogger(RegistrationFormMobileController.class);

    @Autowired
    RegistrationFormService service;
    @Autowired
    RegionService regionService;
    @Autowired
    RegistrationFormWorkFlowService workFlowService;
    @Autowired
    private HttpSession session;

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("RegistrationFormForm",new RegistrationFormForm());
        return "mobile/registration_form_add";
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("RegistrationFormForm") RegistrationFormForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                User currentUser =  (User)session.getAttribute(SessionContext.CURRENT_USER);
                RegistrationForm registrationForm = form.getEntity();
                StartWorkFlow startWorkFlow = new StartWorkFlow();
                RegistrationFormWorkFlow startRegistrationWorkFlow = new RegistrationFormWorkFlow();
                startRegistrationWorkFlow.setName(startWorkFlow.getWorkFlowName());
                startRegistrationWorkFlow.setClass_name(startWorkFlow.getClass().getName());
                startRegistrationWorkFlow.setNo(0);
                startRegistrationWorkFlow.setAggregation_id(UUID.randomUUID().toString());
                startRegistrationWorkFlow.setRegion_id(registrationForm.getRegion_id());
                startRegistrationWorkFlow.setUser_id(currentUser.getId());
                workFlowService.addItem(startRegistrationWorkFlow);

                registrationForm.setWorkflow_id(startRegistrationWorkFlow.getId());
                service.addItem(registrationForm);
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String List(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<RegistrationForm> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/registration_form_list";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){
        RegistrationForm entity =  service.getItem(id);
        try {
            modelMap.addAttribute("RegistrationFormForm",RegistrationFormForm.EntityToForm(entity));
            modelMap.addAttribute("region",regionService.getByCode(entity.getRegion_id()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/registration_form_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("RegistrationFormForm") RegistrationFormForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            RegistrationForm entity = form.getEntity();
            service.updateItem(entity);
            map.put("message", "修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object Delete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            service.remove(id);
            map.put("message", "删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/deleteMulit",method = RequestMethod.POST)
    public Object DeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            service.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/select",method = RequestMethod.GET)
    public String select(){

        return "mobile/registration_form_select";
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/selectJson",method = RequestMethod.GET)
    public Object selectJson(@RequestParam(value = "page",required = false) Integer page,
                             @RequestParam(value = "rows",required = false) Integer rows){
        final long count = service.getCount();
        rows = rows == null ? 10:rows;
        page = page == null ?0:page;
        final List<RegistrationForm> list = service.getItems((page-1)*rows,rows);
        for (RegistrationForm item : list){
            Region region = regionService.getByCode(item.getRegion_id());
            item.setRegion_id(region.getName());
        }
        return new Object(){
            public int getTotal() {
                return total;
            }

            public void setTotal(int total) {
                this.total = total;
            }

            public List<RegistrationForm> getRows() {
                return rows;
            }

            public void setRows(List<RegistrationForm> rows) {
                this.rows = rows;
            }

            private int total;
            private List<RegistrationForm> rows;
            {
                total = (int) count;
                rows = list;
            }
        };
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/selectJsonB/{form_type}",method = RequestMethod.GET)
    public Object selectJsonB(@PathVariable("form_type") String form_type){
        List<RegistrationForm> registrationForms =  service.getAvailableRegister(form_type);
        List<Object> result = new ArrayList<Object>();
        for (final RegistrationForm item : registrationForms){
            result.add(new Object() {
                String id;

                public String getText() {
                    return text;
                }

                public void setText(String text) {
                    this.text = text;
                }

                String text;

                public String getId() {
                    return id;
                }

                public void setId(String id) {
                    this.id = id;
                }

                {
                    id = item.getNo();
                    text = item.getName();
                }
            });
        }
        return result;
    }

    @Auth(role = Auth.Role.USER)
     @RequestMapping(value = "/workflowlist",method = RequestMethod.GET)
     public String WorkFlowList(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<String> workflowids = new ArrayList<String>();
        RegistrationFormWorkFlow conditions = new RegistrationFormWorkFlow();
        conditions.setRegion_id(((User)session.getAttribute(SessionContext.CURRENT_USER)).getRegionCode());
        conditions.setResult(0);
        List<RegistrationFormWorkFlow>  listWorkFlow =  workFlowService.getItems(conditions, 0, (int) workFlowService.getCount());
        for(int i=0;i<listWorkFlow.size();i++)
        {
            workflowids.add(listWorkFlow.get(i).getId());
        }

        List<RegistrationForm> list = service.getItemsInWorkFlowIds(workflowids, (index - 1) * size, size);

        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/registration_form_work_flow_list";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/workflowprocesslist",method = RequestMethod.GET)
    public String WorkFlowProcessList(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        RegistrationForm conditions = new RegistrationForm();
        conditions.setRegion_id(((User)session.getAttribute(SessionContext.CURRENT_USER)).getRegionCode());
        List<RegistrationForm> list = service.getItems(conditions,(index - 1) * size, size);
        long count = list.size();

        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/registration_form_work_flow_process_list";
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/accpet",method = RequestMethod.POST)
    public Object Accpet(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            for(int i=0;i<ids.length;i++)
            {
                String id = ids[i];
                RegistrationForm registrationForm =  service.getItem(id);
                RegistrationFormWorkFlow registrationFormWorkFlow = workFlowService.getItem(registrationForm.getWorkflow_id());
                BaseWorkFlow currentWorkFlow = WorkFlowAggregation.GetWorkFlow("登记上报", registrationFormWorkFlow.getClass_name());
                BaseWorkFlowContext context = new BaseWorkFlowContext();
                context.setCurrent_workflow(registrationFormWorkFlow);
                context.setWorkflow_queue_name("登记上报");
                context.setRegion_service(regionService);
                context.setWork_flow_service(workFlowService);
                context.setRegistration_form_service(service);
                context.setCurrntUser((User)session.getAttribute(SessionContext.CURRENT_USER));
                currentWorkFlow.Accept(context);
            }
            map.put("message","通过成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/reject",method = RequestMethod.POST)
    public Object Reject(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            for(int i=0;i<ids.length;i++)
            {
                String id = ids[i];
                RegistrationForm registrationForm =  service.getItem(id);
                RegistrationFormWorkFlow registrationFormWorkFlow = workFlowService.getItem(registrationForm.getWorkflow_id());
                BaseWorkFlow currentWorkFlow = WorkFlowAggregation.GetWorkFlow("登记上报", registrationFormWorkFlow.getClass_name());
                BaseWorkFlowContext context = new BaseWorkFlowContext();
                context.setCurrent_workflow(registrationFormWorkFlow);
                context.setWorkflow_queue_name("登记上报");
                context.setRegion_service(regionService);
                context.setWork_flow_service(workFlowService);
                context.setRegistration_form_service(service);
                context.setCurrntUser((User) session.getAttribute(SessionContext.CURRENT_USER));
                currentWorkFlow.Reject(context);
            }
            map.put("message","拒绝成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/info",method = RequestMethod.GET)
    public String Info(@RequestParam(value = "id") String id,ModelMap modelMap){
        RegistrationForm entity =  service.getItem(id);
        try {
            modelMap.addAttribute("RegistrationFormForm",RegistrationFormForm.EntityToForm(entity));
            modelMap.addAttribute("region", regionService.getByCode(entity.getRegion_id()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/registration_form_edit";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/process",method = RequestMethod.GET)
    public String Process(@RequestParam(value = "id") String id,ModelMap modelMap){
        RegistrationForm registrationForm = service.getItemByWorkFlowId(id);
        RegistrationFormWorkFlow currentWorkFlow = workFlowService.getItem(id);
        List<RegistrationFormWorkFlow> list = workFlowService.getItemsByAggregation(currentWorkFlow.getAggregation_id());
        modelMap.addAttribute("registration",registrationForm);
        modelMap.addAttribute("list",list);
        return "mobile/registration_form_work_flow_item_list";
    }
}
