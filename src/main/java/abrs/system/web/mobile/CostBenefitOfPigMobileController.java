package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.aspect.CFAspect;
import abrs.system.dao.Entity.CostBenefitOfPig;
import abrs.system.service.CostBenefitOfPigService;
import abrs.system.web.mobile.form.CostBenefitOfPigForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * Created by Edifi_000 on 2016-04-03.
 */
@Controller
@RequestMapping("/mobile/costBenefitOfPig")
public class CostBenefitOfPigMobileController {

    private static Logger logger = LoggerFactory.getLogger(CostBenefitOfPigMobileController.class);

    @Autowired
    CostBenefitOfPigService service;

    @CFAspect
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("CostBenefitOfPigForm",new CostBenefitOfPigForm());
        return "mobile/cost_benefit_of_pig_add";
    }

    @Auth(role = Auth.Role.USER)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("CostBenefitOfPigForm") CostBenefitOfPigForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                CostBenefitOfPig costBenefitOfPig = form.getCostBenefitOfPig();

                service.addItem(costBenefitOfPig);
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
        List<CostBenefitOfPig> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/cost_benefit_of_pig_list";
    }

    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        CostBenefitOfPigForm form = new CostBenefitOfPigForm();
        form.setCostBenefitOfPig(service.getItem(id));
        try {
            modelMap.addAttribute("CostBenefitOfPigForm",form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/cost_benefit_of_pig_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.USER)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("CostBenefitOfPigForm") CostBenefitOfPigForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
            CostBenefitOfPig costBenefitOfPig = form.getCostBenefitOfPig();

            service.updateItem(costBenefitOfPig);

            map.put("message","修改成功");
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
}
