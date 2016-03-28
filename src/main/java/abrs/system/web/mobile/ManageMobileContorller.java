package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.service.FarmerService;
import abrs.system.web.mobile.form.FarmerForm;
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
 * Created by rc452 on 2016/3/26.
 */

@Controller
@RequestMapping("/mobile/manage")
public class ManageMobileContorller {
    private static Logger logger = LoggerFactory.getLogger(UserMobileController.class);

    @Autowired
    FarmerService farmerService;


    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/farmerAdd",method = RequestMethod.GET)
    public String farmerManage(ModelMap modelMap){
        modelMap.addAttribute("FarmerForm",new FarmerForm());
        return "mobile/farmerAdd";
    }
    @Auth(role = Auth.Role.ADMIN)
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
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/farmerList",method = RequestMethod.GET)
    public String farmerList(@RequestParam(value = "index",defaultValue = "1") int index ,@RequestParam(value = "size",defaultValue = "20") int size, ModelMap modelMap){
        List<Farmer> list = farmerService.getItems((index-1)*size,size);
        long count = farmerService.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/farmerList";
    }
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/farmerEdit",method = RequestMethod.GET)
    public String farmerEdit(@RequestParam(value = "id") String id,ModelMap modelMap){
        Farmer farmer =  farmerService.getItem(id);
        try {
            modelMap.addAttribute("FarmerForm",FarmerForm.FarmerToForm(farmer));
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/farmerEdit";
    }
    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
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

    @Auth(role = Auth.Role.ADMIN)
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


}
