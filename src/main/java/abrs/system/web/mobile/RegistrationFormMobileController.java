package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.service.RegionService;
import abrs.system.service.RegistrationFormService;
import abrs.system.web.mobile.form.RegistrationFormForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
@Controller
@RequestMapping("/mobile/registrationForm")
public class RegistrationFormMobileController {
    private static Logger logger = LoggerFactory.getLogger(RegionMobileController.class);

    @Autowired
    RegistrationFormService service;
    @Autowired
    RegionService regionService;
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("RegistrationFormForm",new RegistrationFormForm());
        return "mobile/registration_form_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("RegistrationFormForm") RegistrationFormForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                service.addItem(form.getEntity());
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @Auth(role = Auth.Role.ADMIN)
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

    @Auth(role = Auth.Role.ADMIN)
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
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("RegistrationFormForm") RegistrationFormForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            RegistrationForm entity = form.getEntity();
            service.updateItem(entity);
            map.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }

    @Auth(role = Auth.Role.ADMIN)
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
    @Auth(role = Auth.Role.ADMIN)
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

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/select",method = RequestMethod.GET)
    public String select(){

        return "mobile/registration_form_select";
    }
    @Auth(role = Auth.Role.ADMIN)
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
    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/selectJsonB",method = RequestMethod.GET)
    public Object selectJsonB(){
        List<RegistrationForm> registrationForms =  service.getAvailableRegister();
        List<Object> result = new ArrayList<Object>();
        for (final RegistrationForm item : registrationForms){
            result.add(new Object(){
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
}
