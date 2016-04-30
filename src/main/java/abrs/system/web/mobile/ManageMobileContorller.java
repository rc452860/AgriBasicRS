package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.dao.Entity.User;
import abrs.system.service.FarmerService;
import abrs.system.service.RegistrationFormService;
import abrs.system.web.context.SessionContext;
import abrs.system.web.mobile.excel.FarmerExport;
import abrs.system.web.mobile.excel.ResponseUtils;
import abrs.system.web.mobile.form.FarmerForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rc452 on 2016/3/26.
 */

@Controller
@RequestMapping("/mobile/manage")
public class ManageMobileContorller {
    private static Logger logger = LoggerFactory.getLogger(ManageMobileContorller.class);

    @Autowired
    FarmerService farmerService;

    @Autowired
    RegistrationFormService registrationFormService;

    @Autowired
    HttpSession session;


    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/farmerAdd",method = RequestMethod.GET)
    public String farmerManage(ModelMap modelMap){
        FarmerForm farmerForm = new FarmerForm();
        User user = (User)session.getAttribute(SessionContext.CURRENT_USER);
        farmerForm.setRecord_person(user.getName());
        farmerForm.setUpdate_person(user.getName());
        modelMap.addAttribute("FarmerForm",farmerForm);
        return "mobile/farmerAdd";
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/farmerAdd",method = RequestMethod.POST)
    public Object farmerManage(@Valid @ModelAttribute("FarmerForm") FarmerForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                farmerService.addItem(form.getFarmer());
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/farmerList",method = RequestMethod.GET)
    public String farmerList(
            @RequestParam(value = "index",defaultValue = "1") int index ,
            @RequestParam(value = "size",defaultValue = "20") int size,
            @RequestParam(value = "name",required = false) String name,
            @RequestParam(value = "telphone",required = false) String telphone,
            @RequestParam(value = "village",required = false) String village,
            ModelMap modelMap){
        List<Farmer> list = farmerService.getItems((index-1)*size,size,name,telphone,village);
        long count = farmerService.getCount(name,telphone,village);
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));
        return "mobile/farmerList";
    }
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/farmerEdit",method = RequestMethod.GET)
    public String farmerEdit(@RequestParam(value = "id") String id,ModelMap modelMap){
        Farmer farmer =  farmerService.getItem(id);
        try {
            FarmerForm farmerForm = FarmerForm.FarmerToForm(farmer);
            User user = (User)session.getAttribute(SessionContext.CURRENT_USER);
            farmerForm.setUpdate_person(user.getName());
            modelMap.addAttribute("FarmerForm",farmerForm);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/farmerEdit";
    }
    @ResponseBody
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/farmerEdit",method = RequestMethod.POST)
    public Object farmerEdit(@Valid @ModelAttribute("FarmerForm") FarmerForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            Farmer farmer = form.getFarmer();
            farmerService.updateItem(farmer);
            map.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;

    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "farmerDelete",method = RequestMethod.POST)
    public Object farmerDelete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            farmerService.remove(id);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "farmerDeleteMulit",method = RequestMethod.POST)
    public Object farmerDeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            farmerService.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/export",method = RequestMethod.GET)
    public String Export(HttpServletRequest request,HttpServletResponse response)
    {
        List<Farmer> list =farmerService.getItems(0, (int)farmerService.getCount("","",""),"","","");
        final int size =  list.size();

        FarmerExport needExport = new FarmerExport();
        needExport.setRealPath(request.getRealPath("mobile/exceltemplate"));
        needExport.setIncreaseType(1);
        needExport.setIncreaseCount(size);
        Farmer[] add = list.toArray(new Farmer[size]);
        needExport.setList_Farmer(add);

        try{
            byte[] content = needExport.Export();
            ResponseUtils.MakeDownLoadFile(content, response, needExport.getTemplateFileName());
            return null;
        }
        catch (Exception ex){
            System.out.print(ex.toString());
        }

        return null;
    }

}
