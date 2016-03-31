package abrs.system.web.mobile;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.SummerFoodAndRapeseedExpecPro;
import abrs.system.dao.Entity.ExpectedProductionItem;
import abrs.system.service.SummerFoodAndRapeseedExpecProService;
import abrs.system.service.ExpectedProductionItemService;
import abrs.system.web.mobile.form.SummerFoodAndRapeseedExpecProForm;
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
 * Created by Edifi_000 on 2016-03-30.
 */
@Controller
@RequestMapping("/mobile/summerFoodAndRapeseedExpecPro")
public class SummerFoodAndRapeseedExpecProMobileController {

    private static Logger logger = LoggerFactory.getLogger(SummerFoodAndRapeseedExpecProMobileController.class);

    @Autowired
    SummerFoodAndRapeseedExpecProService service;

    @Autowired
    ExpectedProductionItemService itemService;

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String Add(ModelMap modelMap){
        modelMap.addAttribute("SummerFoodAndRapeseedExpecProForm",new SummerFoodAndRapeseedExpecProForm());
        return "mobile/summer_food_and_rapeseed_expec_pro_add";
    }

    @Auth(role = Auth.Role.ADMIN)
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Object Add(@Valid @ModelAttribute("SummerFoodAndRapeseedExpecProForm") SummerFoodAndRapeseedExpecProForm form, Errors errors, ModelMap model){
        Map<String, Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()) {
            map.put("message", errors.getFieldError().getDefaultMessage());
        }else{
            try {
                SummerFoodAndRapeseedExpecPro summerFoodAndRapeseedExpecPr = form.getSummerFoodAndRapeseedExpecPro();
                ExpectedProductionItem foodItem = form.getFood_item();
                ExpectedProductionItem foodXiaoMaiItem = form.getFood_xiaomai_food_item();
                ExpectedProductionItem rapeseedItem = form.getRapeseed_food_item();

                //TODO 需要进行单亩计算后再进行添加
                foodItem.RefreshData();
                foodXiaoMaiItem.RefreshData();
                rapeseedItem.RefreshData();

                summerFoodAndRapeseedExpecPr.setFood_itemid(itemService.addItem(foodItem));
                summerFoodAndRapeseedExpecPr.setFood_xiaomai_food_itemid(itemService.addItem(foodXiaoMaiItem));
                summerFoodAndRapeseedExpecPr.setRapeseed_youcaizi_itemid(itemService.addItem(rapeseedItem));
                service.addItem(summerFoodAndRapeseedExpecPr);
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
        List<SummerFoodAndRapeseedExpecPro> list = service.getItems((index-1)*size,size);
        long count = service.getCount();
        modelMap.addAttribute("list",list);
        modelMap.addAttribute("count",count);
        modelMap.addAttribute("index",index);
        modelMap.addAttribute("size",size);
        modelMap.addAttribute("countpage",Math.floor(count/size));

        return "mobile/summer_food_and_rapeseed_expec_pro_list";
    }

    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String Edit(@RequestParam(value = "id") String id,ModelMap modelMap){

        SummerFoodAndRapeseedExpecPro entity =  service.getItem(id);
        ExpectedProductionItem foodItem = itemService.getItem(entity.getFood_itemid());
        ExpectedProductionItem foodXiaoMaiItem = itemService.getItem(entity.getFood_xiaomai_food_itemid());
        ExpectedProductionItem rapeseedItem = itemService.getItem(entity.getRapeseed_youcaizi_itemid());

        SummerFoodAndRapeseedExpecProForm form = new SummerFoodAndRapeseedExpecProForm();
        form.setSummerFoodAndRapeseedExpecPro(entity);
        form.setFood_item(foodItem);
        form.setFood_xiaomai_food_item(foodXiaoMaiItem);
        form.setRapeseed_food_item(rapeseedItem);
        try {
            modelMap.addAttribute("SummerFoodAndRapeseedExpecProForm",form);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "mobile/summer_food_and_rapeseed_expec_pro_edit";
    }

    @ResponseBody
    @Auth(role = Auth.Role.ADMIN)
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Object Edit(@Valid @ModelAttribute("SummerFoodAndRapeseedExpecProForm") SummerFoodAndRapeseedExpecProForm form, Errors errors, ModelMap model){
        Map<String,Object> map = new HashMap<String, Object>();
        if (errors.hasErrors()){
            map.put("message",errors.getFieldError().getDefaultMessage());
        }
        try {
//            //TODO update成为了add临时删除处理
//            SummerFoodAndRapeseedExpecPro entity =  service.getItem(form.getSummerFoodAndRapeseedExpecPro().getId());
//            service.remove(entity.getId());
//            itemService.remove(entity.getFood_itemid());
//            itemService.remove(entity.getFood_xiaomai_food_itemid());
//            itemService.remove(entity.getRapeseed_youcaizi_itemid());

            SummerFoodAndRapeseedExpecPro summerFoodAndRapeseedExpecPr = form.getSummerFoodAndRapeseedExpecPro();
            ExpectedProductionItem foodItem = form.getFood_item();
            ExpectedProductionItem foodXiaoMaiItem = form.getFood_xiaomai_food_item();
            ExpectedProductionItem rapeseedItem = form.getRapeseed_food_item();

            service.updateItem(summerFoodAndRapeseedExpecPr);
            itemService.updateItem(foodItem);
            itemService.updateItem(foodXiaoMaiItem);
            itemService.updateItem(rapeseedItem);



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
            SummerFoodAndRapeseedExpecPro entity =  service.getItem(id);
            service.remove(id);
            itemService.remove(entity.getFood_itemid());
            itemService.remove(entity.getFood_xiaomai_food_itemid());
            itemService.remove(entity.getRapeseed_youcaizi_itemid());
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
            for(int i=0;i<ids.length;i++)
            {
                String id = ids[i];
                SummerFoodAndRapeseedExpecPro entity =  service.getItem(id);
                service.remove(id);
                itemService.remove(entity.getFood_itemid());
                itemService.remove(entity.getFood_xiaomai_food_itemid());
                itemService.remove(entity.getRapeseed_youcaizi_itemid());
            }
            //service.removeMulit(ids);
            map.put("message","删除成功");
        }catch (Exception e){
            e.printStackTrace();
            map.put("message", e.getMessage());
        }
        return map;
    }
}
