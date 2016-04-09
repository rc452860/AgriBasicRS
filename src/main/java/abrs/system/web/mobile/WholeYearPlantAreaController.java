package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.dao.Entity.RegistrationForm;
import abrs.system.dao.Entity.WholeYearPlantArea;
import abrs.system.service.RegistrationFormService;
import abrs.system.service.WholeYearPlantAreaService;
import abrs.system.web.mobile.form.FarmerForm;
import abrs.system.web.mobile.form.RegistrationFormForm;
import abrs.system.web.mobile.form.WholeYearPlantAreaForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rc452 on 2016/3/31.
 */
@Controller
@RequestMapping("/mobile/WholeYearPlantArea")
public class WholeYearPlantAreaController {
    private static Logger logger = LoggerFactory.getLogger(RegionMobileController.class);

    @Autowired
    RegistrationFormService service;
    @Autowired
    WholeYearPlantAreaService wholeYearPlantAreaService;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String add(ModelMap modelMap){
        WholeYearPlantAreaForm wholeYearPlantArea = new WholeYearPlantAreaForm();
        modelMap.addAttribute("WholeYearPlantAreaForm",wholeYearPlantArea);
        return "/mobile/WholeYearPlantAreaAdd";
    }
    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object add(@Valid @ModelAttribute("WholeYearPlantAreaForm") WholeYearPlantAreaForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                wholeYearPlantAreaService.addItem(form.getWholeYearPlantArea());
                map.put("message","添加成功");
            }catch (Exception e){
                e.printStackTrace();
                map.put("message", e.getMessage());
            }
        }
        return map;
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(@RequestParam("id") String id, ModelMap modelMap){
        WholeYearPlantArea wholeYearPlantArea =  wholeYearPlantAreaService.getItem(id);
        try {
            modelMap.addAttribute("WholeYearPlantAreaForm",WholeYearPlantAreaForm.WholeYearPlantAreaToForm(wholeYearPlantArea));
        }catch (Exception e){
            e.printStackTrace();
        }

        return "/mobile/WholeYearPlantAreaEdit";
    }
    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object farmerEdit(@Valid @ModelAttribute("WholeYearPlantAreaForm") WholeYearPlantAreaForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            WholeYearPlantArea wholeYearPlantArea = form.getWholeYearPlantArea();
            wholeYearPlantAreaService.updateItem(wholeYearPlantArea);
            map.put("message","修改成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;

    }
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String farmerList(
            @RequestParam(value = "index",defaultValue = "1") int index ,
            @RequestParam(value = "size",defaultValue = "20") int size,
            @RequestParam(value = "name",required = false) String name,
            @RequestParam(value = "telphone",required = false) String telphone,
            @RequestParam(value = "village",required = false) String village,
            ModelMap modelMap){
        List<WholeYearPlantArea> list = wholeYearPlantAreaService.getItems((index-1)*size,size);
        long count = wholeYearPlantAreaService.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));
        return "mobile/WholeYearPlantAreaList";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public Object farmerDelete(@RequestParam("id") String id){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            wholeYearPlantAreaService.remove(id);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "deleteMulit",method = RequestMethod.POST)
    public Object farmerDeleteMulit(@RequestParam("ids[]") String[] ids){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            wholeYearPlantAreaService.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
}
