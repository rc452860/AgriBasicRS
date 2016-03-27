package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.service.FarmerService;
import abrs.system.web.mobile.form.FarmerForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.jws.WebParam;
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
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
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

}
